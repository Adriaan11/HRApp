using EngineeringClubHR.Classes;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class CreateExpense : System.Web.UI.Page
    {
        private const int PendingStatusId = 3;
        private EngineeringClubHREntities4 _context;
        public string _expenseIdQueryString;

        protected void Page_Init(object sender, EventArgs e)
        {
            _context = new EngineeringClubHREntities4();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployees();
                LoadExpenseDetailsIfPresent();
            }
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            _context.Dispose();
        }

        private void LoadExpenseDetailsIfPresent()
        {
            btnAddExpense.Text = "Update Expense";
            _expenseIdQueryString = Request.QueryString["expenseId"];
            if (string.IsNullOrEmpty(_expenseIdQueryString)) return;

            if (int.TryParse(_expenseIdQueryString, out int expenseId))
            {
                LoadExpenseDetails(expenseId);
            }
        }

        private void LoadExpenseDetails(int expenseId)
        {
            Expense expense = _context.Expenses.Find(expenseId);
            if (expense == null) return;

            ddlEmployees.SelectedValue = expense.employeeID.ToString();
            txtExpenseDescription.Text = expense.description;
            txtAmount.Text = TryParseDecimalToInt(expense.amount)?.ToString() ?? "";
            txtExpenseDate.Text = expense.expenseDate?.ToString("yyyy-MM-dd");
        }

        private int? TryParseDecimalToInt(decimal? amount)
        {
            if (amount.HasValue)
            {
                int roundedAmount = (int)Math.Floor(amount.Value);
                return roundedAmount;
            }
            return null;
        }

        private void LoadEmployees()
        {
            var employees = _context.Employees.ToList();
            ddlEmployees.DataSource = employees;
            ddlEmployees.DataTextField = "FullName";
            ddlEmployees.DataValueField = "employeeID";
            ddlEmployees.DataBind();
        }

        protected void btnAddExpense_Click(object sender, EventArgs e)
        {
            if (int.TryParse(ddlEmployees.SelectedValue, out int employeeID))
            {
                try
                {
                    CreateAndSaveExpense(employeeID);
                    lblMessage.Text = "Expense added successfully!";
                    Response.Redirect("ManageExpenses.aspx");
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
                lblMessage.Text = "Invalid employee ID!";
            }
        }

        private void CreateAndSaveExpense(int employeeID)
        {
            {
                _expenseIdQueryString = Request.QueryString["expenseId"];

                if (_expenseIdQueryString != null)
                {
                    if (int.TryParse(_expenseIdQueryString, out int parsedExpenseId))
                    {
                        Expense expense = _context.Expenses.Find(parsedExpenseId);

                        if (expense != null)
                        {
                            // Existing expense update logic
                            expense.employeeID = employeeID;
                            expense.description = txtExpenseDescription.Text;

                            // Remove decimal points from the amount
                            if (decimal.TryParse(txtAmount.Text, out decimal parsedAmount))
                            {
                                int roundedAmount = (int)Math.Floor(parsedAmount);
                                expense.amount = new decimal(roundedAmount);
                            }

                            expense.expenseDate = DateTime.Parse(txtExpenseDate.Text);
                            expense.statusID = PendingStatusId;
                            expense.approverID = GetApproverIDForEmployee(employeeID);

                            WorkflowTable workflow = _context.WorkflowTables.FirstOrDefault(x => x.LeaveOrExpenseID == expense.expenseID);

                            if (workflow != null)
                            {
                                workflow.ManagerActionDate = DateTime.Now.Date;
                                workflow.Comments = "Expense Edited by HR";
                            }
                            else
                            {
                                // Handle scenario when workflow is null, perhaps create a new workflow entry
                            }

                            _context.SaveChanges();
                        }
                        else
                        {
                            // Handle scenario when expense is null, perhaps notify user or log an error
                        }
                    }
                    else
                    {
                        // Handle scenario when the expenseId cannot be parsed to int
                    }
                }
                else
                {
                    // New expense creation logic
                    Expense newExpense = new Expense
                    {
                        employeeID = employeeID,
                        description = txtExpenseDescription.Text,

                        // Remove decimal points from the amount
                        amount = decimal.TryParse(txtAmount.Text, out decimal parsedNewAmount)
                                 ? new decimal((int)Math.Floor(parsedNewAmount))
                                 : new decimal(0),

                        expenseDate = DateTime.Parse(txtExpenseDate.Text),
                        statusID = PendingStatusId,
                        approverID = GetApproverIDForEmployee(employeeID)
                    };

                    _context.Expenses.Add(newExpense);
                    _context.SaveChanges();
                    AddExpenseToWorkflowTable(newExpense);
                }

                lblMessage.Text = "Expense added successfully!";
                Response.Redirect("ManageExpenses.aspx");
            }
        }



        private int GetApproverIDForEmployee(int employeeID)
        {
            // This assumes that the manager is always present, consider adding null checks
            var employee = _context.Employees.First(x => x.employeeID == employeeID);
            return _context.Managers.First(x => x.managerID == employee.managerID).employeeID;
        }

        private void AddExpenseToWorkflowTable(Expense expense)
        {
            var workflow = CreateWorkflowEntryForExpense(expense);
            _context.WorkflowTables.Add(workflow);
            _context.SaveChanges();
        }

        private WorkflowTable CreateWorkflowEntryForExpense(Expense expense)
        {
            var employee = _context.Employees.Find(expense.employeeID);
            var manager = _context.Managers.Find(employee.managerID);
            int updateExpenseID = _context.Expenses.OrderByDescending(x => x.expenseID).Select(x => x.expenseID).FirstOrDefault();

            return new WorkflowTable
            {
                EmployeeID = employee.employeeID,
                EmployeeFirstName = employee.firstName,
                EmployeeLastName = employee.lastName,
                ManagerID = manager.managerID,
                ManagerFirstName = manager.managerFirstName,
                ManagerLastName = manager.managerLastName,
                ApplicationType = "Expense",
                LeaveOrExpenseID = updateExpenseID,
                ApplicationDate = DateTime.Now,
                ApprovalStatusID = PendingStatusId,
                ApprovalStatus = "Pending",
                ManagerActionDate = DateTime.Now,
                Comments = "Expense under review"
            };
        }
    }
}
