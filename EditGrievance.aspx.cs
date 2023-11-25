using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class EditGrievance : System.Web.UI.Page
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

                    // Retrieve Grievance data by ID
                    var grievance = _db.Grievances.FirstOrDefault(g => g.GrievanceID == grievanceID);

                    if (grievance != null)
                    {
                        // Populate the form controls with grievance data
                        TextBoxGrievanceDescription.Text = grievance.GrievanceDescription;

                        // Populate the status dropdown list from GrievanceStatus table
                        DropDownListStatus.DataSource = _db.GrievanceStatus.ToList();
                        DropDownListStatus.DataTextField = "StatusName";
                        DropDownListStatus.DataValueField = "StatusID";
                        DropDownListStatus.DataBind();

                        // Set the selected value based on Grievance's StatusID
                        DropDownListStatus.SelectedValue = grievance.StatusID.ToString();

                        // Populate the perpetrator dropdown list from Employees table
                        DropDownListPerpetrator.DataSource = _db.Employees.ToList();
                        DropDownListPerpetrator.DataTextField = "FullName";
                        DropDownListPerpetrator.DataValueField = "employeeID";
                        DropDownListPerpetrator.DataBind();

                        // Set the selected value based on Grievance's PerpetratorID
                        DropDownListPerpetrator.SelectedValue = grievance.PerpetratorID.ToString();
                    }
                    else
                    {
                        // Grievance not found
                        // Handle the error or redirect to an error page
                    }
                }
                else
                {
                    // GrievanceID parameter not found
                    // Handle the error or redirect to an error page
                }
            }
        }



        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            // Update the Grievance record with the edited data
            if (Request.QueryString["GrievanceID"] != null)
            {
                int grievanceID = Convert.ToInt32(Request.QueryString["GrievanceID"]);
                var grievance = _db.Grievances.Find(grievanceID);

                if (grievance != null)
                {
                    // Update the Grievance data
                    grievance.GrievanceDescription = TextBoxGrievanceDescription.Text;
                    grievance.StatusID = Convert.ToInt32(DropDownListStatus.SelectedValue);
                    grievance.PerpetratorID = Convert.ToInt32(DropDownListPerpetrator.SelectedValue);

                    // Save changes to the database
                    _db.SaveChanges();

                    // Redirect back to the ManageGrievance page
                    Response.Redirect("ManageGrievance.aspx");
                }
                else
                {
                    // Grievance not found
                    // Handle the error or redirect to an error page
                }


            }
        }
    }
}
