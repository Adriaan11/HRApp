using EngineeringClubHR.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;

namespace EngineeringClubHR
{
    public partial class ManageExpenses : Page
    {
        private readonly ExpenseFunctions _expenseFunctions = new ExpenseFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindExpenseData();
                BindExpenseHistoryData();
            }
        }
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
        protected void EditExpense_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateExpense.aspx");
        }
        protected void ExpenseGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }
        private void BindExpenseData()
        {
            using (var context = new EngineeringClubHREntities4())
            {
                var query = (from e in context.Expenses.Where(x => x.statusID == 2 || x.statusID == 3)
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
                                 managerName = c.managerFirstName + " " + c.managerLastName
                             }).ToList();
                ExpenseGrid.DataSource = query;
                ExpenseGrid.DataBind();
            }
        }
        private void BindExpenseHistoryData()
        {
            ExpenseHistoryGrid.DataSource = _expenseFunctions.GetExpenseHistory();
            ExpenseHistoryGrid.DataBind();
        }

        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string exp = btn.CommandArgument;
            Response.Redirect("~/CreateExpense.aspx?expenseId=" + exp);
        }
        protected void btnApprove_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int expenseID = Convert.ToInt32(btn.CommandArgument);
            DateTime managerActionDate = DateTime.Now;
            _expenseFunctions.ProcessExpense(expenseID, managerActionDate, 1, "Approved", "HR Approved");
            Response.Redirect("ManageExpenses.aspx");
        }
        protected void btnDecline_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int expenseID = Convert.ToInt32(btn.CommandArgument);
            DateTime managerActionDate = DateTime.Now;
            _expenseFunctions.ProcessExpense(expenseID, managerActionDate, 4, "Rejected", "HR Declined");
            Response.Redirect("ManageExpenses.aspx");
        }
    }
}
