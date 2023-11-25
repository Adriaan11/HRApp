using EngineeringClubHR.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class Employee
    {
        public string fullName
        {
            get
            {
                return $"{firstName} {lastName}";
            }
        }
    }

    public partial class CreateLeave : System.Web.UI.Page
    {
        EngineeringClubHREntities4 entities = new EngineeringClubHREntities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();

                if (Request.QueryString["leaveId"] != null && int.TryParse(Request.QueryString["leaveId"], out int leaveId))
                {
                    LoadLeaveData(leaveId);
                    SubmitButton.Text = "Update";
                }
            }
        }

        private void LoadData()
        {
            LoadEmployees();
            LoadLeaveTypes();
        }

        private void LoadLeaveData(int leaveId)
        {
            var leave = entities.Leaves.Find(leaveId);
            var test = entities.WorkflowTables.OrderByDescending(x => x.LeaveOrExpenseID == leaveId).FirstOrDefault()?.Comments;

            if (leave != null)
            {
                DDLemployee.SelectedValue = leave.Employee.fullName;
                DDLleaveType.SelectedValue = leave.leaveType;
                TextBoxstartDate.Text = leave.startDate?.ToString("yyyy-MM-dd");
                TxtendDate.Text = leave.endDate?.ToString("yyyy-MM-dd");
                CommentTextBox.Text = test ?? string.Empty;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["leaveId"] != null && int.TryParse(Request.QueryString["leaveId"], out int leaveId))
                {
                    UpdateLeave(leaveId);
                }
                else
                {
                    ApplyLeave();
                }
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }

        }

        private void LoadEmployees()
        {
            List<Employee> employees = entities.Employees.ToList();
            DDLemployee.DataSource = employees;
            DDLemployee.DataTextField = "fullName";
            DDLemployee.DataBind();
        }

        private void LoadLeaveTypes()
        {
            List<String> leaveTypes = entities.leaveTypes.Select(x => x.leaveTypeName).ToList();
            DDLleaveType.DataSource = leaveTypes;
            DDLleaveType.DataBind();
        }

        private void UpdateLeave(int leaveId)
        {
            var leave = entities.Leaves.Find(leaveId);
            if (leave != null)
            {
                var (selectedEmployee, managerID) = GetSelectedEmployeeAndManagerID();
                if (selectedEmployee != null)
                {
                    leave.employeeID = selectedEmployee.employeeID;
                    leave.approverID = Convert.ToInt32(managerID);
                    leave.leaveType = DDLleaveType.SelectedItem.Text;
                    if (DateTime.TryParse(TextBoxstartDate.Text, out DateTime startDate))
                    {
                        leave.startDate = startDate;
                    }
                    if (DateTime.TryParse(TxtendDate.Text, out DateTime endDate))
                    {
                        leave.endDate = endDate;
                    }
                    leave.statusID = 3;

                    var newWorkflow = entities.WorkflowTables.OrderByDescending(x => x.LeaveOrExpenseID == leaveId).FirstOrDefault();
                    if (newWorkflow != null)
                    {
                        UpdateWorkflow(newWorkflow, selectedEmployee, managerID, leaveId);
                    }

                    entities.SaveChanges();
                    Response.Redirect("ManageLeave.aspx");
                }
                else
                {
                    // Handle case where no matching employee is found...
                }
            }
        }

        private void ApplyLeave()
        {
            try
            {
                var (selectedEmployee, managerID) = GetSelectedEmployeeAndManagerID();
                if (selectedEmployee != null)
                {
                    Leave newLeave = new Leave
                    {
                        employeeID = selectedEmployee.employeeID,
                        approverID = Convert.ToInt32(managerID),
                        leaveType = DDLleaveType.SelectedItem.Text,
                        statusID = 3
                    };

                    if (DateTime.TryParse(TextBoxstartDate.Text, out DateTime startDate))
                    {
                        newLeave.startDate = startDate;
                    }
                    if (DateTime.TryParse(TxtendDate.Text, out DateTime endDate))
                    {
                        newLeave.endDate = endDate;
                    }

                    entities.Leaves.Add(newLeave);
                    entities.SaveChanges();  // Consider using transaction if atomic operation is required

                    WorkflowTable newWorkflow = CreateNewWorkflow(selectedEmployee, managerID, newLeave.leaveID);
                    entities.WorkflowTables.Add(newWorkflow);
                    entities.SaveChanges();  // Consider using transaction if atomic operation is required

                    Response.Redirect("ManageLeave.aspx");
                }
                else
                {
                    // Handle case where no matching employee is found...
                }
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }

        }

        private (Employee, string) GetSelectedEmployeeAndManagerID()
        {
            var fullName = DDLemployee.SelectedItem.Text;
            var nameParts = fullName.Split(' ');
            var firstName = nameParts[0];
            var lastName = nameParts.Length > 1 ? nameParts[1] : "";
            var selectedEmployee = entities.Employees.FirstOrDefault(emp => emp.firstName == firstName && emp.lastName == lastName);
            var managerID = selectedEmployee?.managerID;
            return (selectedEmployee, managerID.ToString());
        }

        private WorkflowTable CreateNewWorkflow(Employee selectedEmployee, string managerID, int leaveID)
        {
            return new WorkflowTable
            {
                EmployeeID = selectedEmployee.employeeID,
                EmployeeFirstName = selectedEmployee.firstName,
                EmployeeLastName = selectedEmployee.lastName,
                ManagerID = Convert.ToInt32(managerID),
                ManagerFirstName = entities.Managers.Where(x => x.managerID.ToString() == managerID).Select(x => x.managerFirstName).FirstOrDefault(),
                ManagerLastName = entities.Managers.Where(x => x.managerID.ToString() == managerID).Select(x => x.managerLastName).FirstOrDefault(),
                ApplicationType = "Leave",
                LeaveOrExpenseID = leaveID,
                ApplicationDate = DateTime.Now,
                ApprovalStatusID = 3,
                ApprovalStatus = "Pending",
                ManagerActionDate = DateTime.Now.Date,
                Comments = CommentTextBox.Text
            };
        }

        private void UpdateWorkflow(WorkflowTable workflow, Employee selectedEmployee, string managerID, int leaveID)
        {
            workflow.EmployeeID = selectedEmployee.employeeID;
            workflow.EmployeeFirstName = selectedEmployee.firstName;
            workflow.EmployeeLastName = selectedEmployee.lastName;
            workflow.ManagerID = Convert.ToInt32(managerID);
            workflow.ManagerFirstName = entities.Managers.Where(x => x.managerID.ToString() == managerID).Select(x => x.managerFirstName).FirstOrDefault();
            workflow.ManagerLastName = entities.Managers.Where(x => x.managerID.ToString() == managerID).Select(x => x.managerLastName).FirstOrDefault();
            workflow.ApplicationType = "Leave";
            workflow.LeaveOrExpenseID = leaveID;
            workflow.ApplicationDate = DateTime.Now;
            workflow.ApprovalStatusID = 3;
            workflow.ApprovalStatus = "Pending";
            workflow.ManagerActionDate = null; // Assuming manager action date is now
            workflow.Comments = CommentTextBox.Text;
        }
    }
}
