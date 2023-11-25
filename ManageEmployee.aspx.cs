using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using EngineeringClubHR.Classes;

namespace EngineeringClubHR
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAndLoadEmployees();
            }
        }
        protected void BUTTADDEMPLOYEE_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEmployee.aspx");
        }

        private void BindAndLoadEmployees()
        {
            using (var db = new EngineeringClubHREntities4())
            {
                var activeEmployees = GetEmployeesData(db, true);
                ActiveEmployeeRepeater.DataSource = activeEmployees;
                ActiveEmployeeRepeater.DataBind();

                var inactiveEmployees = GetEmployeesData(db, false);
                InactiveEmployeeRepeater.DataSource = inactiveEmployees;
                InactiveEmployeeRepeater.DataBind();
            }
        }

        private List<dynamic> GetEmployeesData(EngineeringClubHREntities4 db, bool isActive, string searchQuery = null)
        {
            IQueryable<Employee> query = db.Employees.Where(x => x.active == isActive);

            if (!string.IsNullOrEmpty(searchQuery))
            {
                query = query.Where(x => x.employeeID.ToString().Contains(searchQuery) ||
                                         x.firstName.Contains(searchQuery) ||
                                         x.lastName.Contains(searchQuery) ||
                                         x.emailAddress.Contains(searchQuery) ||
                                         x.phoneNumber.Contains(searchQuery) ||
                                         x.managerID.ToString().Contains(searchQuery));
            }

            var managerIds = query.Select(e => e.managerID).Distinct();
            var managers = db.Managers.Where(m => managerIds.Contains(m.managerID)).ToList();

            var dataList = (from e in query
                            join m in db.Managers on e.managerID equals m.managerID into grouping
                            from m in grouping.DefaultIfEmpty()
                            select new
                            {
                                empName = e.firstName,
                                empLastName = e.lastName,
                                empID = e.employeeID,
                                empEmail = e.emailAddress,
                                empPhone = e.phoneNumber,
                                empManager = m == null ? "Not Available" : m.managerFirstName + " " + m.managerLastName,
                                active = e.active ? "Active" : "Inactive",
                            }).ToList<dynamic>();

            return dataList;
        }

        protected void EmployeeRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var dataItem = e.Item.DataItem;
                var activeStatus = DataBinder.Eval(dataItem, "active");
                ImageButton removeButton = (ImageButton)e.Item.FindControl("RemoveButton");
            }
        }

        protected void searchBar_TextChanged(object sender, EventArgs e)
        {
            using (var db = new EngineeringClubHREntities4())
            {
                var activeEmployees = GetEmployeesData(db, true, searchBar.Text);
                ActiveEmployeeRepeater.DataSource = activeEmployees;
                ActiveEmployeeRepeater.DataBind();

                var inactiveEmployees = GetEmployeesData(db, false, searchBar.Text);
                InactiveEmployeeRepeater.DataSource = inactiveEmployees;
                InactiveEmployeeRepeater.DataBind();
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            try
            {
                // Cast to the correct type: ImageButton
                ImageButton btn = (ImageButton)sender;

                // Rest of the code remains the same
                string employeeID = btn.CommandArgument;
                Response.Redirect("CreateEmployee.aspx?employeeID=" + employeeID);
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }

        }

        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            try
            {
                ImageButton button = (ImageButton)sender;
                int employeeID = Convert.ToInt32(button.CommandArgument);

                using (var db = new EngineeringClubHREntities4())
                {
                    Employee employee = db.Employees.FirstOrDefault(emp => emp.employeeID == employeeID);
                    if (employee != null)
                    {
                        employee.active = !employee.active;
                        db.SaveChanges();
                        BindAndLoadEmployees();
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }
        }
        protected void ChangeStatusButton_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                int empID = int.Parse(btn.CommandArgument.ToString());

                using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
                {
                    Employee emp = _engineeringClubHREntities.Employees.Find(empID);
                    if (emp != null)
                    {
                        CurrentStatusValueLabel.Text = emp.employmentType;
                        NewStatusDropDown.SelectedValue = emp.employmentType;
                        SelectedEmployeeID.Value = empID.ToString();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal", "$('#changeStatusModal').modal('show');", true);
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }

        }

        protected void SaveChangesButton_Click(object sender, EventArgs e)
        {
            try
            {
                int empID = int.Parse(SelectedEmployeeID.Value);
                string newStatus = NewStatusDropDown.SelectedValue;

                using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
                {
                    Employee empToUpdate = _engineeringClubHREntities.Employees.Find(empID);
                    if (empToUpdate != null)
                    {
                        empToUpdate.employmentType = newStatus;
                        _engineeringClubHREntities.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }


            // You may want to refresh the page or just the section containing the employees.
        }



        protected void EmploymentStatusChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            RepeaterItem item = (RepeaterItem)ddl.NamingContainer;
            HiddenField empIDField = (HiddenField)item.FindControl("EmployeeIDHiddenField");
            int empID = int.Parse(empIDField.Value);

            string newStatus = ddl.SelectedValue;

            using (EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4())
            {
                Employee empToUpdate = _engineeringClubHREntities.Employees.Find(empID);
                if (empToUpdate != null)
                {
                    empToUpdate.employmentType = newStatus;
                    _engineeringClubHREntities.SaveChanges();
                }
            }
        }

    }
}
