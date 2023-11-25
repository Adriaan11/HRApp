using System;
using System.Linq;

namespace EngineeringClubHR
{
    public partial class EditGrievanceLog : System.Web.UI.Page
    {
        private readonly EngineeringClubHREntities4 _db = new EngineeringClubHREntities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if GrievanceLogId parameter exists in the URL
                if (Request.QueryString["GrievanceLogId"] != null)
                {
                    int grievanceLogId = Convert.ToInt32(Request.QueryString["GrievanceLogId"]);

                    // Retrieve Grievance Log data by ID
                    var grievanceLog = _db.GrievanceLogs.FirstOrDefault(g => g.LogID == grievanceLogId);

                    if (grievanceLog != null)
                    {
                        // Populate the form controls with Grievance Log data
                        TextBoxLogDescription.Text = grievanceLog.LogDescription;
                    }
                    else
                    {
                        // Grievance Log not found
                        // Handle the error or redirect to an error page
                    }
                }
                else
                {
                    // GrievanceLogId parameter not found
                    // Handle the error or redirect to an error page
                }
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            // Update the Grievance Log record with the edited data
            if (Request.QueryString["GrievanceLogId"] != null)
            {
                int grievanceLogId = Convert.ToInt32(Request.QueryString["GrievanceLogId"]);
                var grievanceLog = _db.GrievanceLogs.Find(grievanceLogId);

                if (grievanceLog != null)
                {
                    // Update the Grievance Log data
                    grievanceLog.LogDescription = TextBoxLogDescription.Text;

                    // Save changes to the database
                    _db.SaveChanges();

                    // Redirect back to the ViewGrievance page
                    Response.Redirect("ViewGrievance.aspx?GrievanceID=" + grievanceLog.GrievanceID);
                }
                else
                {
                    // Grievance Log not found
                    // Handle the error or redirect to an error page
                }
            }
        }
    }
}
