using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class ManageGrievance : System.Web.UI.Page
    {
        EngineeringClubHREntities4 engineeringClubHREntities = new EngineeringClubHREntities4();
        public class GrievanceViewModel
        {
            public int GrievanceID { get; set; }
            public int EmployeeID { get; set; }
            public string EmployeeName { get; set; }
            public string GrievanceDescription { get; set; }
            public DateTime SubmissionDate { get; set; }
            public string Status { get; set; }
            public int PerpetratorID { get; set; }
            public string PerpetratorName { get; set; }
            public string GrievanceTitle { get; set; }
            public Boolean IsActive { get; set; }

            public string FormattedSubmissionDate
            {
                get
                {
                    return SubmissionDate.ToString("dd MMMM yyyy");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrievanceData();
            }
        }

        protected void GrievanceGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the GrievanceID from the data source
                string grievanceID = DataBinder.Eval(e.Row.DataItem, "GrievanceID").ToString();

                // Apply CSS class to the row to make it clickable
                e.Row.CssClass = "clickable-row";

                // Attach JavaScript onclick event to the row
                e.Row.Attributes["onclick"] = $"redirectToView('{grievanceID}');";
            }
        }
        protected void GrievanceGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditGrievance")
            {
                int grievanceID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("EditGrievance.aspx?GrievanceID=" + grievanceID);

                // Redirect to the edit page or perform the editing logic here
            }
            if (e.CommandName == "AddLog")
            {
                int grievanceID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("CreateGrievanceLog.aspx?GrievanceID=" + grievanceID);
            }
            else if (e.CommandName == "ToggleActive")
            {
                int grievanceID = Convert.ToInt32(e.CommandArgument);

                // Find the grievance by ID
                var grievance = engineeringClubHREntities.Grievances.Find(grievanceID);

                if (grievance != null)
                {
                    // Toggle the IsActive status
                    grievance.IsActive = !grievance.IsActive;

                    // Save changes
                    engineeringClubHREntities.SaveChanges();

                    // Preserve the current filter settings
                    bool showActive = !CheckBoxShowInactive.Checked;

                    // Reload the grid with the same filter settings
                    BindGrievanceData(showActive);
                }
            }
        }
        public void BindGrievanceData(bool showActive)
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var query = from g in context.Grievances
                            join e in context.Employees on g.EmployeeID equals e.employeeID
                            join p in context.Employees on g.PerpetratorID equals p.employeeID
                            join s in context.GrievanceStatus on g.StatusID equals s.StatusID
                            select new GrievanceViewModel
                            {
                                EmployeeName = e.firstName,
                                GrievanceID = g.GrievanceID,
                                GrievanceTitle = g.GrievanceTitle,
                                EmployeeID = (int)g.EmployeeID,
                                GrievanceDescription = g.GrievanceDescription,
                                SubmissionDate = (DateTime)g.SubmissionDate,
                                Status = s.StatusName,
                                PerpetratorID = (int)g.PerpetratorID,
                                PerpetratorName = p.firstName,
                                IsActive = g.IsActive,
                            };

                string selectedStatusName = DropDownListStatus.SelectedValue;
                if (!string.IsNullOrEmpty(selectedStatusName))
                {
                    query = query.Where(g => g.Status == selectedStatusName);
                }

                // Filter for Active or Inactive Grievances based on showActive parameter
                if (showActive)
                {
                    query = query.Where(g => g.IsActive);
                }
                else
                {
                    query = query.Where(g => !g.IsActive);
                }

                if (!string.IsNullOrEmpty(GrievanceGrid.SortExpression))
                {
                    // ... (your existing sorting logic)
                }

                GrievanceGrid.DataSource = query.ToList();
                GrievanceGrid.DataBind();
            }
        }

        public void BindGrievanceData()
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var query = from g in context.Grievances
                            join e in context.Employees on g.EmployeeID equals e.employeeID
                            join p in context.Employees on g.PerpetratorID equals p.employeeID
                            join s in context.GrievanceStatus on g.StatusID equals s.StatusID
                            select new GrievanceViewModel
                            {
                                EmployeeName = e.firstName,
                                GrievanceID = g.GrievanceID,
                                GrievanceTitle = g.GrievanceTitle,
                                EmployeeID = (int)g.EmployeeID,
                                GrievanceDescription = g.GrievanceDescription,
                                SubmissionDate = (DateTime)g.SubmissionDate,
                                Status = s.StatusName,
                                PerpetratorID = (int)g.PerpetratorID,
                                PerpetratorName = p.firstName,
                                IsActive = g.IsActive,
                            };

                string selectedStatusName = DropDownListStatus.SelectedValue; // You'll need a DropDownList for status selection.
                if (!string.IsNullOrEmpty(selectedStatusName))
                {
                    query = query.Where(g => g.Status == selectedStatusName);
                }

                bool showInactiveGrievances = CheckBoxShowInactive.Checked; // Add a CheckBox for this
                if (!showInactiveGrievances)
                {
                    query = query.Where(g => g.IsActive);
                }

                if (!string.IsNullOrEmpty(GrievanceGrid.SortExpression))
                {
                    string sortExpression = GrievanceGrid.SortExpression;
                    string sortDirection = GrievanceGrid.SortDirection == SortDirection.Ascending ? "ASC" : "DESC";

                    // Explicitly specify the type arguments for OrderBy
                    if (sortExpression == "Status")
                    {
                        if (sortDirection == "ASC")
                        {
                            query = query.OrderBy(g => g.Status);
                        }
                        else
                        {
                            query = query.OrderByDescending(g => g.Status);
                        }
                    }
                    else
                    {
                        // Handle other columns for sorting if needed
                    }
                }

                GrievanceGrid.DataSource = query.ToList();
                GrievanceGrid.DataBind();
            }
        }

        protected void DropDownListStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool showActive = !CheckBoxShowInactive.Checked; // Invert the checkbox state
            BindGrievanceData(showActive);
        }

        protected void CheckBoxShowInactive_CheckedChanged(object sender, EventArgs e)
        {
            bool showActive = !CheckBoxShowInactive.Checked; // Invert the checkbox state
            BindGrievanceData(showActive);
        }



        protected void EditButton_Click(object sender, EventArgs e)
        {
            int grievanceID = Convert.ToInt32(((Button)sender).CommandArgument);
            var griev = engineeringClubHREntities.Grievances.Find(grievanceID);
        }

        protected void AddGrievance_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateGrievance.aspx");
        }

        public List<GrievanceViewModel> GetActionableGrievances(int pageIndex, int pageSize, out int PageCount)
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var query = from g in context.Grievances
                            join e in context.Employees on g.EmployeeID equals e.employeeID
                            join p in context.Employees on g.PerpetratorID equals p.employeeID
                            join s in context.GrievanceStatus on g.StatusID equals s.StatusID
                            select new GrievanceViewModel
                            {
                                EmployeeName = e.firstName,
                                GrievanceID = g.GrievanceID,
                                EmployeeID = (int)g.EmployeeID,
                                GrievanceDescription = g.GrievanceDescription,
                                SubmissionDate = (DateTime)g.SubmissionDate,
                                Status = s.StatusName,
                                PerpetratorID = (int)g.PerpetratorID,
                                PerpetratorName = p.firstName
                            };
                query = query.Where(x => x.Status == "Submitted" || x.Status == "Under Review" || x.Status == "Escalated");
                query = query.OrderBy(x => x.SubmissionDate);
                PageCount = (int)Math.Ceiling((double)query.Count() / pageSize);
                var paginatedResults = query.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                return paginatedResults;

            }
        }
    }


}
