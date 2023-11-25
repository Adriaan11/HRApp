using System;
using System.Linq;

namespace EngineeringClubHR
{
    public partial class ViewGrievance : System.Web.UI.Page
    {
        private readonly EngineeringClubHREntities4 _db = new EngineeringClubHREntities4();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if GrievanceID parameter exists in the URL
                if (Request.QueryString["GrievanceID"] != null)
                {
                    int grievanceID = Convert.ToInt32(Request.QueryString["GrievanceID"]);

                    // Retrieve grievance details
                    var grievance = _db.Grievances
                        .Where(g => g.GrievanceID == grievanceID)
                        .FirstOrDefault();

                    if (grievance != null)
                    {
                        // Display GrievanceID and details
                        LabelGrievanceTitle.Text = $"Grievance Title: {grievance.GrievanceTitle}";
                        LabelGrievanceDetails.Text = $"Employee: {grievance.Employee.firstName},  Description: {grievance.GrievanceDescription}";

                        // Retrieve and display GrievanceLogs
                        var grievanceLogs = _db.GrievanceLogs
                            .Where(log => log.GrievanceID == grievanceID)
                            .OrderByDescending(log => log.LogDate)
                            .ToList();

                        if (grievanceLogs.Count > 0)
                        {
                             RepeaterGrievanceLogs.DataSource = grievanceLogs;
                             RepeaterGrievanceLogs.DataBind();

                        }
                        else
                        {
                            RepeaterGrievanceLogs.Visible = false; // Hide the Repeater
                            NoLogsAvailable.Visible = true;
                        }
                    }
                    else
                    {
                        LabelGrievanceTitle.Text = "No Data";
                        LabelGrievanceDetails.Text = "";
                    }
                }
                else
                {
                    // GrievanceID parameter not found
                    LabelGrievanceTitle.Text = "No Data";
                    LabelGrievanceDetails.Text = "";
                }
            }
        }
    }
}