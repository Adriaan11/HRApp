using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public class ManagerInfo
    {
        public string ManagerName { get; set; }
        public int ManagerID { get; set; }
    }
    public partial class SettingsPage : System.Web.UI.Page
    {
        private List<string> _leaveTypes;
        private List<PublicHoliday> _publicHolidays;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private List<Employee> GetEmployees()
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                // Get the list of manager IDs
                var managerIDs = _engineeringClubHREntities.Managers.Select(m => m.managerID).ToList();

                // Get the list of employees who are not managers
                List<Employee> _employees = _engineeringClubHREntities.Employees
                                            .Where(e => !managerIDs.Contains(e.employeeID))
                                            .ToList();

                return _employees;
            }
        }

        private void LoadData()
        {
            LoadLeaveTypes();
            LoadPublicHolidays();
            LoadEmployeesAndManagers();
            rptEmployees.DataSource = GetEmployees();
            rptEmployees.DataBind();

            ddlManagers.DataTextField = "ManagerName";
            ddlManagers.DataValueField = "ManagerID";
            ddlManagers.DataSource = GetManagers();
            ddlManagers.DataBind();
            LoadGenderData();
        }

        private List<ManagerInfo> GetManagers()
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                return _engineeringClubHREntities.Managers
                    .Select(m => new ManagerInfo
                    {
                        ManagerName = m.managerFirstName + " " + m.managerLastName,
                        ManagerID = m.managerID
                    })
                    .ToList();
            }
        }

        private List<string> GetLeaveTypesDBA()
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                List<string> _leavetypes = _engineeringClubHREntities.leaveTypes
                    .Select(lt => lt.leaveTypeName)
                    .ToList();
                return _leavetypes;
            }
        }
        private List<PublicHoliday> GetPublicHolidaysDBA()
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                List<PublicHoliday> _publicHolidays = _engineeringClubHREntities.PublicHolidays.ToList();
                return _publicHolidays;
            }
        }
        private void LoadPublicHolidays()
        {
            List<PublicHoliday> publicHolidays = GetPublicHolidaysDBA();
            HolidayGridView.DataSource = publicHolidays;
            HolidayGridView.DataBind();
        }
        protected void HolidayGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            HolidayGridView.EditIndex = e.NewEditIndex;
            LoadPublicHolidays();
        }
        protected void HolidayGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (e.RowIndex < 0 || e.RowIndex >= HolidayGridView.Rows.Count)
            {
                // Log an error, display a message, or throw an exception
                return;
            }
            string holidayName = (string)HolidayGridView.DataKeys[e.RowIndex].Value;
            TextBox DateTextBox = (TextBox)HolidayGridView.Rows[e.RowIndex].FindControl("DateTextBox");
            DateTime newDate;
            if (DateTime.TryParse(DateTextBox.Text, out newDate))
            {
                UpdateHolidayDate(holidayName, newDate);
                HolidayGridView.EditIndex = -1;
                LoadPublicHolidays();
            }
            else
            {
                // Handle date parse failure...
            }
        }
        protected void HolidayGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string holidayName = (string)HolidayGridView.DataKeys[e.RowIndex].Value;
            DeleteHoliday(holidayName);
            LoadPublicHolidays();
        }
        private void DeleteHoliday(string holidayName)
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                PublicHoliday holidayToDelete = _engineeringClubHREntities.PublicHolidays.FirstOrDefault(h => h.HolidayName == holidayName);
                if (holidayToDelete != null)
                {
                    _engineeringClubHREntities.PublicHolidays.Remove(holidayToDelete);
                    _engineeringClubHREntities.SaveChanges();
                }
            }
        }
        protected void HolidayGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            HolidayGridView.EditIndex = -1;
            LoadPublicHolidays();
        }
        private void UpdateHolidayDate(string holidayName, DateTime newDate)
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                var holiday = _engineeringClubHREntities.PublicHolidays.FirstOrDefault(h => h.HolidayName == holidayName);
                if (holiday != null)
                {
                    holiday.HolidayDate = newDate;
                    _engineeringClubHREntities.SaveChanges();
                }
            }
        }
        private List<string> GetLeaveTypes()
        {
            if (_leaveTypes == null)
            {
                _leaveTypes = Session["LeaveTypes"] as List<string>;
                if (_leaveTypes == null)
                {
                    _leaveTypes = GetLeaveTypesDBA();
                    Session["LeaveTypes"] = _leaveTypes;
                }
            }
            return _leaveTypes;
        }
        private void LoadLeaveTypes()
        {
            List<string> leaveTypes = GetLeaveTypesDBA();
            DDLleaveType.DataSource = leaveTypes;
            DDLleaveType.DataBind();
        }
        protected void addingLeaveBtn_Click(object sender, EventArgs e)
        {
            string newLeaveType = txtNewLeaveType.Text.Trim();
            try
            {
                using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
                {
                    if (!string.IsNullOrEmpty(newLeaveType))
                    {
                        if (!ExistingLeaveType(newLeaveType))
                        {
                            List<string> leaveTypes = GetLeaveTypesDBA();
                            _engineeringClubHREntities.leaveTypes.Add(new leaveType { leaveTypeName = newLeaveType });
                            _engineeringClubHREntities.SaveChanges();
                            LoadLeaveTypes();
                            txtNewLeaveType.Text = "";
                        }
                        else
                        {
                            lblMessage.Visible = false;
                            lblMessage.Text = "Leave Type Already Exists";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        private bool ExistingLeaveType(string newLeaveType)
        {
            List<string> leavetype = GetLeaveTypesDBA();
            foreach (string leaveTypeExists in leavetype)
            {
                if (string.Equals(leaveTypeExists, newLeaveType, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }
        protected void deleteLeaveBtn_Click(object sender, EventArgs e)
        {
            if (DDLleaveType.SelectedIndex >= 0)
            {
                string selectedLeaveType = DDLleaveType.SelectedItem.Text;
                try
                {
                    using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
                    {
                        var deleteLeaveType = _engineeringClubHREntities.leaveTypes.FirstOrDefault(lt => lt.leaveTypeName == selectedLeaveType);
                        if (deleteLeaveType != null)
                        {
                            _engineeringClubHREntities.leaveTypes.Remove(deleteLeaveType);
                            _engineeringClubHREntities.SaveChanges();
                        }
                        List<string> leaveTypes = GetLeaveTypesDBA();
                        leaveTypes.Remove(selectedLeaveType);
                        SaveLeaveTypes(leaveTypes);
                        LoadLeaveTypes();
                    }
                }
                catch (DbUpdateException ex)
                {
                    string errorMessage = ex.InnerException?.Message ?? ex.Message;
                    Console.WriteLine(errorMessage);
                    lblMessage.Visible = true;
                    lblMessage.Text = "Error occurred on deletion";
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    lblMessage.Visible = true;
                    lblMessage.Text = "Error occurred on deletion";
                }

            }
        }
        private void SaveLeaveTypes(List<string> leaveTypes)
        {
            _leaveTypes = leaveTypes;
            Session["LeaveTypes"] = _leaveTypes;
        }
        protected void addingHolidayBtn_Click(object sender, EventArgs e)
        {
            string newHolidayName = txtNewHoliday.Text.Trim();
            DateTime newHolidayDate;
            if (!DateTime.TryParse(txtHolidayDate.Text.Trim(), out newHolidayDate))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Invalid date format.";
                return;
            }
            try
            {
                using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
                {
                    if (!string.IsNullOrEmpty(newHolidayName))
                    {
                        if (!ExistingHoliday(newHolidayName))
                        {
                            _engineeringClubHREntities.PublicHolidays.Add(new PublicHoliday { HolidayName = newHolidayName, HolidayDate = newHolidayDate });
                            _engineeringClubHREntities.SaveChanges();
                            LoadPublicHolidays();
                            txtNewHoliday.Text = "";
                            txtHolidayDate.Text = "";
                        }
                        else
                        {
                            lblMessage.Visible = true;
                            lblMessage.Text = "Holiday Already Exists";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception...
            }
        }
        private bool ExistingHoliday(string newHolidayName)
        {
            List<PublicHoliday> publicHolidays = GetPublicHolidaysDBA();
            return publicHolidays.Any(h => string.Equals(h.HolidayName, newHolidayName, StringComparison.OrdinalIgnoreCase));
        }
        protected void deleteHolidayBtn_Click(object sender, EventArgs e)
        {
        }
        private PublicHoliday GetPublicHolidayByName(string holidayName)
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                return _engineeringClubHREntities.PublicHolidays.FirstOrDefault(h => h.HolidayName == holidayName);
            }
        }
        private void LoadEmployeesAndManagers()
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                // Fetch managers and materialize the list of manager's employee IDs into memory
                var managerEmployeeIds = _engineeringClubHREntities.Managers
                   .Select(m => m.employeeID)
                   .ToList();
                // Fetch employees who are not managers
                var employees = _engineeringClubHREntities.Employees
                    .Where(e => !managerEmployeeIds.Contains(e.employeeID)) // Exclude employees who are managers
                    .Select(e => new { ID = e.employeeID, Name = e.firstName + " " + e.lastName })
                    .ToList();
                // Bind data to DDLEmployeeToPromote
                DDLEmployeeToPromote.DataSource = employees;
                DDLEmployeeToPromote.DataTextField = "Name";
                DDLEmployeeToPromote.DataValueField = "ID";
                DDLEmployeeToPromote.DataBind();
                // Fetch managers again for binding to DDLManagerToDemote
                var managers = _engineeringClubHREntities.Managers
                   .Select(m => new { ID = m.managerID, Name = m.managerFirstName + " " + m.managerLastName })
                   .ToList();
                // Bind data to DDLManagerToDemote
                DDLManagerToDemote.DataSource = managers;
                DDLManagerToDemote.DataTextField = "Name";
                DDLManagerToDemote.DataValueField = "ID";
                DDLManagerToDemote.DataBind();
            }
        }
        protected void promoteBtn_Click(object sender, EventArgs e)
        {
            int employeeID = int.Parse(DDLEmployeeToPromote.SelectedValue);
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                var employee = _engineeringClubHREntities.Employees.FirstOrDefault(x => x.employeeID == employeeID);
                if (employee != null)
                {
                    // Get the next managerID
                    int nextManagerID = GetNextManagerID(_engineeringClubHREntities);
                    // Add the new manager
                    _engineeringClubHREntities.Managers.Add(new Manager
                    {
                        managerID = nextManagerID,
                        managerFirstName = employee.firstName,
                        managerLastName = employee.lastName,
                        employeeID = employee.employeeID
                    });
                    _engineeringClubHREntities.SaveChanges();
                    LoadData();
                }
            }
        }
        protected void demoteBtn_Click(object sender, EventArgs e)
        {
            int managerID = int.Parse(DDLManagerToDemote.SelectedValue);
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                if (IsMultipleManagers(_engineeringClubHREntities))
                {
                    var managerToDemote = FindManager(_engineeringClubHREntities, managerID);
                    var anotherManager = FindAnotherManager(_engineeringClubHREntities, managerID);

                    if (managerToDemote != null && anotherManager != null)
                    {
                        ReassignEmployees(_engineeringClubHREntities, managerID, anotherManager.managerID);
                        ReassignWorkflowEntries(_engineeringClubHREntities, managerID, anotherManager);
                        RemoveManager(_engineeringClubHREntities, managerToDemote);

                        _engineeringClubHREntities.SaveChanges();
                        LoadData();
                    }
                }
                else
                {
                    ShowWarning();
                }
            }
        }
        private bool IsMultipleManagers(EngineeringClubHREntities4 context)
        {
            return context.Managers.Count() > 1;
        }
        private Manager FindManager(EngineeringClubHREntities4 context, int managerID)
        {
            return context.Managers.FirstOrDefault(m => m.managerID == managerID);
        }
        private Manager FindAnotherManager(EngineeringClubHREntities4 context, int managerID)
        {
            return context.Managers.FirstOrDefault(m => m.managerID != managerID);
        }
        private void ReassignEmployees(EngineeringClubHREntities4 context, int oldManagerID, int newManagerID)
        {
            var employeesToReassign = context.Employees.Where(f => f.managerID == oldManagerID).ToList();
            foreach (var employee in employeesToReassign)
            {
                employee.managerID = newManagerID;
            }
        }
        private void ReassignWorkflowEntries(EngineeringClubHREntities4 context, int oldManagerID, Manager newManager)
        {
            var workflowEntriesToUpdate = context.WorkflowTables.Where(w => w.ManagerID == oldManagerID).ToList();
            foreach (var workflowEntry in workflowEntriesToUpdate)
            {
                workflowEntry.ManagerID = newManager.managerID;
                workflowEntry.ManagerFirstName = newManager.managerFirstName;
                workflowEntry.ManagerLastName = newManager.managerLastName;
            }
        }
        private void RemoveManager(EngineeringClubHREntities4 context, Manager manager)
        {
            context.Managers.Remove(manager);
        }
        private void ShowWarning()
        {
            string script = "alert('There needs to be at least one manager.');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
        }
        private int GetNextManagerID(EngineeringClubHREntities4 dbContext)
        {
            // Fetch the maximum managerID currently in the Managers table
            int? maxManagerID = dbContext.Managers.Max(m => (int?)m.managerID);

            // If the table is empty, start with 1, otherwise increment the maximum ID by 1
            return (maxManagerID ?? 0) + 1;
        }
        private void LoadActiveManagers(DropDownList ddl)
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                var activeManagers = _engineeringClubHREntities.Managers
                    .Select(m => new { ID = m.managerID, Name = m.managerFirstName + " " + m.managerLastName })
                    .ToList();
                ddl.DataSource = activeManagers;
                ddl.DataTextField = "Name";
                ddl.DataValueField = "ID";
                ddl.DataBind();
            }
        }
        protected void btnAssign_Click(object sender, EventArgs e)
        {
            List<int> selectedEmployeeIds = GetSelectedEmployeeIds();
            if (IsManagerSelected())
            {
                int selectedManagerId = int.Parse(ddlManagers.SelectedItem.Value);
                using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
                {
                    AssignEmployeesToManager(_engineeringClubHREntities, selectedEmployeeIds, selectedManagerId);
                    UpdateWorkflowEntries(_engineeringClubHREntities, selectedEmployeeIds, selectedManagerId);
                    _engineeringClubHREntities.SaveChanges();
                    LoadData();
                }
            }
            else
            {
                ShowManagerNotSelectedWarning();
            }
        }
        private List<int> GetSelectedEmployeeIds()
        {
            List<int> selectedEmployeeIds = new List<int>();
            foreach (RepeaterItem item in rptEmployees.Items)
            {
                RadioButton rb = (RadioButton)item.FindControl("rbSelectEmployee");
                if (rb != null && rb.Checked)
                {
                    int employeeId = Convert.ToInt32(((HiddenField)item.FindControl("HiddenFieldEmployeeId")).Value);
                    selectedEmployeeIds.Add(employeeId);
                }
            }
            return selectedEmployeeIds;
        }
        private bool IsManagerSelected()
        {
            return ddlManagers.SelectedItem != null;
        }
        private void AssignEmployeesToManager(EngineeringClubHREntities4 context, List<int> employeeIds, int managerId)
        {
            foreach (int employeeId in employeeIds)
            {
                var employee = context.Employees.FirstOrDefault(g => g.employeeID == employeeId);
                if (employee != null)
                {
                    employee.managerID = managerId;
                }
            }
        }
        private void UpdateWorkflowEntries(EngineeringClubHREntities4 context, List<int> employeeIds, int newManagerId)
        {
            var newManager = context.Managers.FirstOrDefault(m => m.managerID == newManagerId);
            if (newManager != null)
            {
                foreach (int employeeId in employeeIds)
                {
                    var workflowEntriesToUpdate = context.WorkflowTables.Where(w => w.EmployeeID == employeeId).ToList();
                    foreach (var workflowEntry in workflowEntriesToUpdate)
                    {
                        workflowEntry.ManagerID = newManager.managerID;
                        workflowEntry.ManagerFirstName = newManager.managerFirstName;
                        workflowEntry.ManagerLastName = newManager.managerLastName;
                    }
                }
            }
        }
        private void ShowManagerNotSelectedWarning()
        {
            string script = "alert('Please select a manager.');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
        }

        private void LoadGenderData()
        {
            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                var genders = _engineeringClubHREntities.Genders.ToList();
                DDLExistingGenders.DataSource = genders;
                DDLExistingGenders.DataTextField = "Description";
                DDLExistingGenders.DataValueField = "GenderID";
                DDLExistingGenders.DataBind();
            }
        }
        protected void btnAddGender_Click(object sender, EventArgs e)
        {
            string newGenderDescription = txtNewGender.Text.Trim();
            if (string.IsNullOrEmpty(newGenderDescription))
            {
                // Show warning: Empty gender description
                return;
            }

            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                // Find the last GenderID
                int? lastGenderID = _engineeringClubHREntities.Genders
                                        .Select(x => x.GenderID)
                                        .Max();

                // If no records exist, start with 1, otherwise, take the last ID and add 1
                int newGenderID = (lastGenderID.HasValue) ? lastGenderID.Value + 1 : 1;

                Gender newGender = new Gender
                {
                    Description = newGenderDescription,
                    GenderID = newGenderID
                };

                _engineeringClubHREntities.Genders.Add(newGender);
                _engineeringClubHREntities.SaveChanges();
                LoadGenderData(); // Refresh the dropdown
            }


        }

        protected void btnDeleteGender_Click(object sender, EventArgs e)
        {
            int selectedGenderID = int.Parse(DDLExistingGenders.SelectedValue);

            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                // Check if any employees are using this GenderID
                var employees = _engineeringClubHREntities.Employees.ToList();
                var employeesUsingGender = employees
                    .Where(emp => Convert.ToInt32(emp.gender) == selectedGenderID)
                    .ToList();

                if (employeesUsingGender.Count > 0)
                {
                    // Display warning and exit
                    // For example, use a label to show the warning message
                    string script = "alert('There are Employees assigned with this Gender!');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                }
                else
                {
                    Gender genderToDelete = _engineeringClubHREntities.Genders.Find(selectedGenderID);

                    if (genderToDelete != null)
                    {
                        _engineeringClubHREntities.Genders.Remove(genderToDelete);
                        _engineeringClubHREntities.SaveChanges();
                        LoadGenderData();  // Refresh dropdown
                    }
                    else
                    {
                    }
                }


            }
        }


    }
}