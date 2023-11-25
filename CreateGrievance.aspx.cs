using EngineeringClubHR.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class CreateGrievance : System.Web.UI.Page
    {
        private readonly EngineeringClubHREntities4 _db = new EngineeringClubHREntities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Simulated data for demo
                PopulateEmployeeDropdown();
                PopulateGrievanceEmployeeDropdown();
            }
        }

        protected void PopulateEmployeeDropdown()
        {
            try
            {
                List<Employee> employee = _db.Employees.ToList();
                employeeSelect.DataSource = employee;
                employeeSelect.DataTextField = "FullName"; // Set the text field
                employeeSelect.DataValueField = "employeeID"; // Set the value field
                employeeSelect.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the exception appropriately
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }
        }

        protected void PopulateGrievanceEmployeeDropdown()
        {
            try
            {
                List<Employee> employee = _db.Employees.ToList();
                grievanceEmployeeSelect.DataSource = employee;
                grievanceEmployeeSelect.DataTextField = "FullName"; // Set the text field
                grievanceEmployeeSelect.DataValueField = "employeeID"; // Set the value field
                grievanceEmployeeSelect.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the exception appropriately
                ErrorLogger.LogError(ex, this);
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }

        }

        /*private bool EmployeeExists(string employeeName)
        {
            // Check if employee exists in database using Entity Framework
            return _db.Employees.Any(emp => emp.firstName == employeeName || emp.lastName== employeeName);
        } */

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            // Initialize variables
            string grievanceEmployee = employeeSelect.SelectedItem.ToString();
            string grievanceAbout = grievanceEmployeeSelect.SelectedItem.ToString().Trim();
            string grievanceTitle = TextBoxGrievanceTitle.Text.Trim();
            string description = TextBoxDescription.Text.Trim();

            // Check for empty space in input
            if (string.IsNullOrWhiteSpace(grievanceTitle) || string.IsNullOrWhiteSpace(description))
            {
                LabelResult.Text = "All fields are required.";
                return;
            }

            // Get current time
            DateTime submissionDate = DateTime.Now;
            int submittedStatusID = 1;

            if (_db.Grievances.Any(g => g.GrievanceTitle == grievanceTitle))
            {
                // Handle duplicate Grievance Title
                string script = $@"
                    <script type='text/javascript'>
                    var result = confirm('A Grievance with the title ""{grievanceTitle}"" already exists. Do you want to save it anyway?');
                    if (result) {{
                    // Continue saving
                    }} else {{
                    // Clear the Title field
                    document.getElementById('{TextBoxGrievanceTitle.ClientID}').value = '';
                    }}
                    </script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "DuplicateTitleScript", script);
                return;
            }

            try
            {

                // Instantiate a new Grievance object
                var _grievance = new Grievance();
                {
                    // Populate Grievance properties

                    Button btn = (Button)sender;

                    var EMP = employeeSelect.SelectedValue;
                    var PERP = grievanceEmployeeSelect.SelectedValue;
                    _grievance.EmployeeID = Convert.ToInt32(EMP);
                    _grievance.PerpetratorID = Convert.ToInt32(PERP);

                    // .Where(x => x.firstName == grievanceAbout)
                    // .Select(x => x.employeeID)
                    // .FirstOrDefault();
                    _grievance.GrievanceDescription = description;
                    _grievance.GrievanceTitle = grievanceTitle;
                    _grievance.SubmissionDate = submissionDate;
                    _grievance.StatusID = submittedStatusID;
                }

                // Insert into Grievances table using Entity Framework
                _db.Grievances.Add(_grievance);


                var grievanceLog = new GrievanceLog
                {
                    GrievanceID = _grievance.GrievanceID, // Reference to the newly created Grievance
                    LogDescription = "Grievance Log Entry is created!",
                    LogDate = submissionDate
                };
                _db.GrievanceLogs.Add(grievanceLog);

                _db.SaveChanges(); // Save changes to the database

                // Insert the GrievanceLog into GrievanceLogs table

                string script = @"
            <script type='text/javascript'>
                setTimeout(function () {
                    window.location.href = 'ManageGrievance.aspx'; // Replace with your actual page URL
                }, 3000); // 3000 milliseconds (3 seconds)
            </script>";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", script);


                LabelResult.Text = "Grievance submitted successfully.";
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }
        }

    }
}
