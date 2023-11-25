using System;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Data.Entity.Infrastructure;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using EngineeringClubHR.Classes;

namespace EngineeringClubHR
{
    public partial class CreateEmployee : System.Web.UI.Page
    {
        private EngineeringClubHREntities4 _db;
        string _id = null;
        private Employee _employee;
        private int _currentID;

        private int CurrentID { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            _db = new EngineeringClubHREntities4();
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            _db.Dispose();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var employeeID = Request.QueryString["employeeID"];
                if (!string.IsNullOrEmpty(employeeID))
                {
                    _id = employeeID;
                    PopulateManagersDropDown();
                    populatGenderDropDown();
                    PopulateFieldsForEdit(employeeID);
                    Update.Visible = true;
                }
                else
                {
                    CurrentID = -1;
                    PopulateManagersDropDown();
                    populatGenderDropDown();
                    SaveButton.Visible = true;
                }
                System.Diagnostics.Debug.WriteLine("--AAAAAAAAAAAAAAAAA--");
            }
        }

        private void PopulateFieldsForEdit(string employeeID)
        {
            string isActive = "";
            string profilePictureUrl = "";
            DateTime? terminationDate = GetTerminationDate();
            if (!int.TryParse(employeeID, out var empID)) return;

            _employee = _db.Employees.Find(empID);
            if (_employee == null) return;

            _employee = _db.Employees.Find(empID);
            if (_employee == null) return;
            if (_employee.active)
            {
                isActive = "Active";
            }
            else
            {
                isActive = "Inactive";

            }
            TextBoxName.Text = _employee.firstName;
            TextBoxMiddleName.Text = _employee.middleName;
            TextBoxSurname.Text = _employee.lastName;
            TextBoxPreferredName.Text = _employee.preferredName;
            DropDownListGender.SelectedValue = _employee.gender;
            TextBoxIDNumber.Text = _employee.identificationNumber;
            TextBoxNationality.Text = _employee.nationality;
            TextBoxPhoneNumber.Text = _employee.phoneNumber;
            TextBoxEmail.Text = _employee.emailAddress;
            TextBoxAddress.Text = _employee.address;
            TextBoxcity.Text = _employee.city;
            Textboxstate.Text = _employee.state;
            TextBoxpassword.Text = _employee.password;
            TextBoxPostalcode.Text = _employee.postalCode;
            TXTstartDate.Text = _employee.dateOfBirth.ToString("yyyy-MM-dd");
            TextBoxCountry.Text = _employee.country;
            TextBoxMaritalStatus.Text = _employee.maritalStatus;
            TextBoxEmergencyContactName.Text = _employee.emergencyContactName;
            TextBoxEmergencyContactRelationship.Text = _employee.emergencyContactRelationship;
            TextBoxEmergencyContactPhone.Text = _employee.emergencyContactPhone;
            TextBoxPosition.Text = _employee.position;
            TextBoxJobTitle.Text = _employee.jobTitle;
            TextBoxDepartment.Text = _employee.department;
            DropDownListManager.SelectedValue = _employee.managerID.ToString();
            TextBoxHireDate.Text = _employee.hireDate.ToString("yyyy-MM-dd");
            TextBoxTerminationDate.Text = _employee.terminationDate?.ToString("yyyy-MM-dd");
            TextBoxEmploymentStatus.Text = _employee.employmentStatus;
            TextBoxEmploymentType.Text = _employee.employmentType;
            TextBoxWorkHoursPerWeek.Text = _employee.workHoursPerWeek.ToString();
            TextBoxSalary.Text = _employee.salary.ToString();
            TextBoxHourlyRate.Text = _employee.hourlyRate.ToString();
            TextBoxOfficeLocation.Text = _employee.officeLocation;
            TextBoxEmergencyContactEmail.Text = _employee.emailAddress;
            TextBoxCountryOfBirth.Text = _employee.country;
            DropDownListEmployeeStatus.SelectedValue = isActive;
            profilePictureUrl = _employee.profilePicture;
            string imageUrl = "~/Pictures/EmployeePictures/" + profilePictureUrl;
            ProfilePictureImage.ImageUrl = imageUrl;
            CurrentID = _employee.employeeID;
            Update.CommandArgument = CurrentID.ToString();
            System.Diagnostics.Debug.WriteLine(CurrentID);
        }

        protected void SaveButton_Click1(object sender, EventArgs e)
        {
            var newEmployee = GetEmployeeFromFields();

            try
            {
                _db.Employees.Add(newEmployee);
                _db.SaveChanges();
                Response.Redirect("~/ManageEmployee.aspx");
            }
            catch (DbEntityValidationException ex)
            {
                LogEntityValidationErrors(ex);
            }
            catch (Exception ex)
            {
                // Log or handle the general exception
            }
        }

        private Employee GetEmployeeFromFields()
        {
            var profilePictureUrl = SaveUploadedFile(FileUploadProfilePicture);

            int selectedManagerID = GetSelectedManagerID();
            DateTime? terminationDate = GetTerminationDate();

            return new Employee
            {
                firstName = TextBoxName.Text,
                middleName = TextBoxMiddleName.Text,
                lastName = TextBoxSurname.Text,
                preferredName = TextBoxPreferredName.Text,
                gender = DropDownListGender.SelectedValue,
                identificationNumber = TextBoxIDNumber.Text,
                dateOfBirth = DateTime.TryParse(TXTstartDate.Text, out DateTime dateOfBirth) ? dateOfBirth : default,
                nationality = TextBoxNationality.Text,
                phoneNumber = TextBoxPhoneNumber.Text,
                emailAddress = TextBoxEmail.Text,
                address = TextBoxAddress.Text,
                city = TextBoxcity.Text,
                state = Textboxstate.Text,
                postalCode = TextBoxPostalcode.Text,
                password = TextBoxpassword.Text,
                country = TextBoxCountry.Text,
                maritalStatus = TextBoxMaritalStatus.Text,
                emergencyContactName = TextBoxEmergencyContactName.Text,
                emergencyContactRelationship = TextBoxEmergencyContactRelationship.Text,
                emergencyContactPhone = TextBoxEmergencyContactPhone.Text,
                position = TextBoxPosition.Text,
                jobTitle = TextBoxJobTitle.Text,
                department = TextBoxDepartment.Text,
                managerID = selectedManagerID,
                hireDate = DateTime.TryParse(TextBoxHireDate.Text, out DateTime hireDate) ? hireDate : default,
                terminationDate = terminationDate,
                employmentStatus = TextBoxEmploymentStatus.Text,
                employmentType = TextBoxEmploymentType.Text,
                workHoursPerWeek = int.TryParse(TextBoxWorkHoursPerWeek.Text, out int workHours) ? workHours : default,
                salary = double.TryParse(TextBoxSalary.Text, out double salary) ? salary : default,
                hourlyRate = double.TryParse(TextBoxHourlyRate.Text, out double hourlyRate) ? hourlyRate : default,
                officeLocation = TextBoxOfficeLocation.Text,
                profilePicture = profilePictureUrl
            };
        }


        private string SaveUploadedFile(FileUpload fileUpload)
        {
            if (!fileUpload.HasFile) return null;

            var uploadedFile = fileUpload.PostedFile;
            var uniqueFileName = GetUniqueFileName(uploadedFile.FileName);
            var folderPath = Server.MapPath("~/Pictures/EmployeePictures/");
            var filePath = Path.Combine(folderPath, uniqueFileName);

            uploadedFile.SaveAs(filePath);

            return uniqueFileName;
        }

        private string GetUniqueFileName(string originalFileName)
        {
            var fileName = Path.GetFileNameWithoutExtension(originalFileName);
            var fileExtension = Path.GetExtension(originalFileName);
            return $"{fileName}_{DateTime.Now.Ticks}{fileExtension}";
        }

        private void LogEntityValidationErrors(DbEntityValidationException ex)
        {
            foreach (var eve in ex.EntityValidationErrors)
            {
                Debug.WriteLine($"Entity of type \"{eve.Entry.Entity.GetType().Name}\" in state \"{eve.Entry.State}\" has the following validation errors:");
                foreach (var ve in eve.ValidationErrors)
                {
                    Debug.WriteLine($"- Property: \"{ve.PropertyName}\", Error: \"{ve.ErrorMessage}\"");
                }
            }
        }

        private void PopulateManagersDropDown()
        {
            try
            {
                List<Manager> managers = _db.Managers.ToList();
                DropDownListManager.DataSource = managers;
                DropDownListManager.DataTextField = "managerFirstName";
                DropDownListManager.DataValueField = "ManagerID";
                DropDownListManager.DataBind();
            }
            catch (Exception e)
            {
                throw new Exception("An error occurred while populating the dropdown.", e);
            }
        }

        private void populatGenderDropDown()
        {
            try
            {
                var genderList = _db.Genders.ToList();
                DropDownListGender.DataSource = genderList;
                DropDownListGender.DataTextField = "Description";
                DropDownListGender.DataValueField = "GenderID";
                DropDownListGender.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        private int GetSelectedManagerID()
        {
            // Parse the selected manager ID from the DropDownList
            return int.TryParse(DropDownListManager.SelectedValue, out int managerId) ? managerId : 0;
        }

        private DateTime? GetTerminationDate()
        {
            return !string.IsNullOrEmpty(TextBoxTerminationDate.Text) && DateTime.TryParseExact(TextBoxTerminationDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out var tempDate)
                ? tempDate
                : (DateTime?)null;
        }

        protected async void Update_Click(object sender, CommandEventArgs e)
        {

            int selectedManagerID = GetSelectedManagerID();
            DateTime? terminationDate = GetTerminationDate();
            string arg = e.CommandArgument.ToString();
            if (int.TryParse(arg, out int empID))
            {

                System.Diagnostics.Debug.WriteLine($"Employee ID: {empID}");
                System.Diagnostics.Debug.WriteLine(CurrentID);
            }
            else
            {
                // Conversion failed, handle the error as needed.
                System.Diagnostics.Debug.WriteLine("Invalid Employee ID: " + arg);
            }
            if (empID != -1)
            {

                _employee = _db.Employees.Find(empID);
                _employee.firstName = TextBoxName.Text;
                _employee.middleName = TextBoxMiddleName.Text;
                _employee.lastName = TextBoxSurname.Text;
                _employee.preferredName = TextBoxPreferredName.Text;
                _employee.gender = DropDownListGender.SelectedValue;
                _employee.identificationNumber = TextBoxIDNumber.Text;
                _employee.dateOfBirth = DateTime.Parse(TXTstartDate.Text);
                _employee.nationality = TextBoxNationality.Text;
                _employee.phoneNumber = TextBoxPhoneNumber.Text;
                _employee.address = TextBoxAddress.Text;
                _employee.country = TextBoxCountry.Text;
                _employee.maritalStatus = TextBoxMaritalStatus.Text;
                _employee.emergencyContactName = TextBoxEmergencyContactName.Text;
                _employee.emergencyContactRelationship = TextBoxEmergencyContactRelationship.Text;
                _employee.emergencyContactPhone = TextBoxEmergencyContactPhone.Text;
                _employee.position = TextBoxPosition.Text;
                _employee.jobTitle = TextBoxJobTitle.Text;
                _employee.department = TextBoxDepartment.Text;
                _employee.managerID = selectedManagerID;
                _employee.hireDate = DateTime.Parse(TextBoxHireDate.Text);
                _employee.terminationDate = terminationDate;
                _employee.employmentStatus = TextBoxEmploymentStatus.Text;
                _employee.employmentType = TextBoxEmploymentType.Text;
                _employee.workHoursPerWeek = int.TryParse(TextBoxWorkHoursPerWeek.Text, out int workHours2) ? workHours2 : default;
                _employee.salary = double.TryParse(TextBoxSalary.Text, out double salary2) ? salary2 : default;
                _employee.hourlyRate = double.TryParse(TextBoxHourlyRate.Text, out double hourlyRate2) ? hourlyRate2 : default;
                _employee.officeLocation = TextBoxOfficeLocation.Text;



                if (FileUploadProfilePicture.HasFile)
                {
                    try
                    {
                        HttpPostedFile uploadedFile = FileUploadProfilePicture.PostedFile;
                        string fileName = Path.GetFileNameWithoutExtension(uploadedFile.FileName);
                        string fileExtension = Path.GetExtension(uploadedFile.FileName);
                        string uniqueFileName = $"{fileName}_{DateTime.Now.Ticks}{fileExtension}";
                        string folderPath = Server.MapPath("~/Pictures/EmployeePictures/");
                        string filePath = Path.Combine(folderPath, uniqueFileName);

                        uploadedFile.SaveAs(filePath);

                        // Update the profile picture URL in the database
                        _employee.profilePicture = uniqueFileName;

                        // Update the ImageUrl to display the new image
                        string imageUrl = "~/Pictures/EmployeePictures/" + uniqueFileName;
                        ProfilePictureImage.ImageUrl = imageUrl;
                    }
                    catch (Exception ex)
                    {
                        ErrorLogger.LogError(ex, this.Page);
                        // If you want to do something with the logged error details
                        string loggedErrorDetails = ErrorLogger.ErrorDetails;
                    }
                }
                _db.SaveChanges();
                try
                {
                    _db.SaveChanges();
                    Response.Redirect("ManageEmployee.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();  // Safely complete the request
                }
                catch (Exception ex)
                {
                    ErrorLogger.LogError(ex, this.Page);
                    // If you want to do something with the logged error details
                    string loggedErrorDetails = ErrorLogger.ErrorDetails;
                }
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("not running");
            }
        }
    }
}
