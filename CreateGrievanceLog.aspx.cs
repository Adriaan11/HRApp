using EngineeringClubHR.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Activities;

namespace EngineeringClubHR
{
    public partial class CreateGrievanceLog : System.Web.UI.Page
    {
        private readonly EngineeringClubHREntities4 _db = new EngineeringClubHREntities4();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve GrievanceID from URL parameter
                if (Request.QueryString["GrievanceID"] != null)
                {
                    int grievanceID = Convert.ToInt32(Request.QueryString["GrievanceID"]);

                    // Store the GrievanceID in a variable for further use
                    // You can also bind this ID to a hidden field in your form
                    // for easier access in the client-side code
                    ViewState["GrievanceID"] = grievanceID;
                    LoadGrievanceLogs(grievanceID);
                }
                else
                {
                    // GrievanceID parameter not found, handle the error
                }
            }
        }
        private void LoadGrievanceLogs(int grievanceID)
        {
            // Query the database to get Grievance Logs for the specified Grievance
            var grievanceLogs = _db.GrievanceLogs
                .Where(log => log.GrievanceID == grievanceID)
                .OrderByDescending(log => log.LogDate)
                .ToList();

            // Bind the Grievance Logs to the ListView control
            ListViewGrievanceLogs.DataSource = grievanceLogs;
            ListViewGrievanceLogs.DataBind();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int grievanceID = Convert.ToInt32(Request.QueryString["GrievanceID"]);
                // Create a new GrievanceLog object and set its properties
                var grievanceLog = new GrievanceLog
                {
                    GrievanceID = grievanceID,// Provide the GrievanceID obtained from the URL or another source,
                    LogDescription = TextBoxLogDescription.Text,
                    LogDate = DateTime.Now // You can set the log date as needed
                };

                // Add the GrievanceLog to the database and save changes
                _db.GrievanceLogs.Add(grievanceLog);
                _db.SaveChanges();

                // Redirect back to the ManageGrievance page
                Response.Redirect("ManageGrievance.aspx");
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }

        }

    }
}