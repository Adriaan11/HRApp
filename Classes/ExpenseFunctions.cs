using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static EngineeringClubHR.ManageExpenses;

namespace EngineeringClubHR.Classes
{
    public class ExpenseFunctions
    {
        public class EmployeeViewModel
        {
            public string FullName { get; set; }
            public int empID { get; set; }
            public string empName { get; set; }
            public string empMiddelName { get; set; }
            public string empSurname { get; set; }
            public int expenseID { get; set; }
            public int? approverEmpID { get; set; }
            public decimal? amount { get; set; }
            public DateTime? expenseDate { get; set; }
            public string FormattedExpenseDate
            {
                get
                {
                    return expenseDate?.ToString("dd MMMM yyyy");
                }
            }
            public string expenseDescription { get; set; }
            public int expenseStatus { get; set; }
            public string expenseStatusDescription { get; set; }
            public int? managerID { get; set; }
            public string managerName { get; set; }
        }
        public class ExpenseHistoryViewModel
        {
            public int ID { get; set; }
            public int EmployeeID { get; set; }
            public string EmployeeFullName { get; set; }
            public int ManagerID { get; set; }
            public string ManagerFullName { get; set; }
            public string ApplicationType { get; set; }
            public int LeaveOrExpenseID { get; set; }
            public DateTime ApplicationDate { get; set; }
            public int ApprovalStatusID { get; set; }
            public string ApprovalStatus { get; set; }
            public DateTime? ManagerActionDate { get; set; }
            public string Comments { get; set; }
        }
        public List<EmployeeViewModel> GetExpenseData()
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var query = from e in context.Expenses
                            join a in context.Employees on e.employeeID equals a.employeeID
                            join b in context.Status on e.statusID equals b.statusID
                            join c in context.Managers on e.approverID equals c.employeeID
                            select new EmployeeViewModel
                            {
                                expenseID = e.expenseID,
                                empID = a.employeeID,
                                approverEmpID = e.approverID,
                                expenseDescription = e.description,
                                amount = e.amount,
                                expenseDate = e.expenseDate,
                                expenseStatus = b.statusID,
                                empName = a.firstName,
                                empMiddelName = a.middleName,
                                empSurname = a.lastName,
                                FullName = a.firstName + " " + a.middleName + " " + a.lastName,
                                managerID = c.employeeID,
                                managerName = c.managerFirstName + " " + c.managerLastName,
                                expenseStatusDescription = b.statusDescription
                            };
                return query.ToList(); // Materialize here
            }
        }
        public void UpdateExpenseAndWorkflow(EngineeringClubHREntities4 context, Expense expense, int statusID, string approvalStatus, string comments, DateTime managerActionDate)
        {
            if (expense == null) throw new ArgumentNullException(nameof(expense));

            expense.statusID = statusID;

            var employee = context.Employees.FirstOrDefault(x => x.employeeID == expense.employeeID);
            if (employee == null) throw new Exception("Employee not found.");

            var manager = context.Managers.FirstOrDefault(x => x.employeeID == expense.approverID);
            if (manager == null) throw new Exception("Manager not found.");

            if (expense.expenseID > 0)
            {
                var updatedExpense = context.WorkflowTables.Where(x => x.LeaveOrExpenseID == expense.expenseID).Select(x => x).FirstOrDefault();
                if (updatedExpense == null) throw new Exception("Workflow entry not found.");

                var newExpense = context.Expenses.Find(expense.expenseID);
                if (newExpense == null) throw new Exception("Expense not found.");

                updatedExpense.ApplicationDate = managerActionDate;
                updatedExpense.ApprovalStatus = approvalStatus;
                updatedExpense.Comments = comments;
                updatedExpense.ApprovalStatusID = statusID;

                newExpense.expenseDate = managerActionDate;
                newExpense.statusID = statusID;

                context.SaveChanges();
            }
            else
            {
                var workflow = new WorkflowTable // Assuming you have a class for the workflow table
                {
                    EmployeeID = employee.employeeID,
                    EmployeeFirstName = employee.firstName,
                    EmployeeLastName = employee.lastName,
                    ManagerID = manager.managerID,
                    ManagerFirstName = manager.managerFirstName,
                    ManagerLastName = manager.managerLastName,
                    ApplicationType = "Expense",
                    LeaveOrExpenseID = expense.expenseID,
                    ApplicationDate = expense.expenseDate ?? DateTime.Now,
                    ApprovalStatusID = statusID,
                    ApprovalStatus = approvalStatus,
                    ManagerActionDate = managerActionDate,
                    Comments = comments
                };
                context.WorkflowTables.Add(workflow);
                context.SaveChanges();
            }
        }

        public void ProcessExpense(int expenseID, DateTime managerActionDate, int statusID, string approvalStatus, string comments)
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var expense = context.Expenses.FirstOrDefault(x => x.expenseID == expenseID);
                if (expense != null)
                {

                    UpdateExpenseAndWorkflow(context, expense, statusID, approvalStatus, comments, managerActionDate);
                }
            }
        }
        public List<EmployeeViewModel> GetExpenseHistory()
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var query = from e in context.Expenses
                            join a in context.Employees on e.employeeID equals a.employeeID
                            join b in context.Status on e.statusID equals b.statusID
                            where b.statusDescription == "Approved" || b.statusDescription == "Rejected"
                            select new EmployeeViewModel
                            {
                                expenseID = e.expenseID,
                                empID = a.employeeID,
                                approverEmpID = e.approverID,
                                expenseDescription = e.description,
                                amount = e.amount,
                                expenseDate = e.expenseDate,
                                expenseStatus = (int)e.statusID,
                                expenseStatusDescription = b.statusDescription,
                                FullName = a.firstName + " " + (a.middleName ?? "") + " " + a.lastName // handle null middle names
                            };

                return query.ToList();
            }
        }
        public List<ExpenseHistoryViewModel> GetExpenseHistoryWorkflow()
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var query = from w in context.WorkflowTables
                            where w.ApplicationType == "Expense"
                            select new ExpenseHistoryViewModel
                            {
                                ID = w.ID,
                                EmployeeID = w.EmployeeID,
                                EmployeeFullName = w.EmployeeFirstName + " " + w.EmployeeLastName,
                                ManagerID = (int)w.ManagerID,
                                ManagerFullName = w.ManagerFirstName + " " + w.ManagerLastName,
                                ApplicationType = w.ApplicationType,
                                LeaveOrExpenseID = (int)w.LeaveOrExpenseID,
                                ApplicationDate = (DateTime)w.ApplicationDate,
                                ApprovalStatusID = (int)w.ApprovalStatusID,
                                ApprovalStatus = w.ApprovalStatus,
                                ManagerActionDate = w.ManagerActionDate,
                                Comments = w.Comments
                            };
                return query.ToList();
            }
        }
        public class HistoryWorkflowViewModel
        {
            public int ExpenseID { get; set; }
            public string EmployeeFullName { get; set; }
            public string ManagerFullName { get; set; }
            public string ApplicationType { get; set; }
            public DateTime ApplicationDate { get; set; }
            public string Action { get; set; }
            public DateTime ActionDate { get; set; }
        }
        public List<HistoryWorkflowViewModel> GetLeaveAndExpenseHistory(string leaveOrExpense)
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var expenseList = context.WorkflowTables.ToList().Where(x => x.ApplicationType == leaveOrExpense);
                var historyData = (from w in expenseList
                                   select new
                                   {
                                       ExpenseID = w.LeaveOrExpenseID,
                                       EmployeeFullName = w.EmployeeFirstName + " " + w.EmployeeLastName,
                                       ManagerFullName = w.ManagerFirstName + " " + w.ManagerLastName,
                                       ApplicationType = w.ApplicationType,
                                       ApplicationDate = (DateTime)w.ApplicationDate,
                                       ApprovalStatus = w.ApprovalStatus,
                                       EmployeeFirstName = w.EmployeeFirstName,
                                       ActionDate = (DateTime)(w.ManagerActionDate ?? w.ApplicationDate),
                                   })
                                    .ToList(); // Fetching the data first

                return historyData.Select(x => new HistoryWorkflowViewModel
                {
                    ExpenseID = (int)x.ExpenseID,
                    EmployeeFullName = x.EmployeeFullName,
                    ManagerFullName = x.ManagerFullName,
                    ApplicationType = x.ApplicationType,
                    ApplicationDate = x.ApplicationDate,
                    Action = GetActionMessage(x.ApprovalStatus, x.EmployeeFirstName, x.ManagerFullName, (int)x.ExpenseID, leaveOrExpense), // Calling method outside LINQ query
                    ActionDate = x.ActionDate,
                    // Map other fields to the ViewModel here
                })
                        .ToList();
            }
        }
        private string GetActionMessage(string approvalStatus, string employeeName, string managerFullName, int leaveOrExpenseID, string leaveOrExpense)
        {
            string actionMessage = string.Empty;
            string url = $"ExpenseHistory.aspx?id={leaveOrExpenseID}";
            switch (approvalStatus)
            {
                case "In Progress":
                case "Pending":
                    actionMessage = $"{managerFullName} <a href=\"{url}\" class=\"status-applied\">APPLIED</a> for an {leaveOrExpense}.";
                    break;
                case "Approved":
                    actionMessage = $"{managerFullName} <a href=\"{url}\" class=\"status-approved\">APPROVED</a> {employeeName}'s {leaveOrExpense} request.";
                    break;
                case "Rejected":
                    actionMessage = $"{managerFullName} <a href=\"{url}\" class=\"status-rejected\">REJECTED</a> {employeeName}'s {leaveOrExpense} request.";
                    break;
                case "HR Rejected":
                    actionMessage = $"HR <a href=\"{url}\" class=\"status-rejected\">REJECTED</a> {employeeName}'s {leaveOrExpense} request.";
                    break;
                case "HR Approved":
                    actionMessage = $"HR <a href=\"{url}\" class=\"status-approved\">APPROVED</a> {employeeName}'s {leaveOrExpense} request.";
                    break;
                default:
                    break;
            }
            return actionMessage;
        }
    }
}