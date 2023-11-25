using Microsoft.CodeAnalysis.CSharp.Syntax;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EngineeringClubHR.PayrollFunctions;

namespace EngineeringClubHR
{
    public partial class ManagePayrolls : System.Web.UI.Page
    {
        private readonly EngineeringClubHREntities4 entities = new EngineeringClubHREntities4();
        private readonly PayrollFunctions functions = new PayrollFunctions();
        private readonly int currentMonth = DateTime.Now.Month;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateMonthsDropdown();
                PopulateYearsDropdown();
                BindEmployeeData();
                LoadPayRollData(currentMonth);
            }
        }

        private void PopulateMonthsDropdown()
        {
            for (int i = 1; i <= 12; i++)
            {
                string month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(i);
                MonthDropDownList.Items.Add(new ListItem(month, i.ToString()));
                empHoursMonthDropdown.Items.Add(new ListItem(month, i.ToString()));
            }
        }

        private void PopulateYearsDropdown()
        {
            List<int> years = GenerateListOfYears();

            YearDropDownList.DataSource = years;
            YearDropDownList.DataBind();

            empHoursYearDropdown.DataSource = years;
            empHoursYearDropdown.DataBind();


            empHoursYearDropdown.SelectedValue = DateTime.Now.Year.ToString();
            YearDropDownList.SelectedValue = DateTime.Now.Year.ToString();
        }

        private List<int> GenerateListOfYears()
        {
            int currentYear = DateTime.Now.Year;
            return Enumerable.Range(currentYear - 50, 51).ToList();
        }

        private void BindEmployeeData()
        {
            employeeList.DataSource = functions.GetEmployees();
            employeeList.DataTextField = "FullName";
            employeeList.DataValueField = "Id";
            employeeList.DataBind();



        }

        private void LoadPayRollData(int month)
        {
            var newList = functions.LoadPayRollData(month);
            PayrollListView.DataSource = newList;
            PayrollListView.DataBind();
        }

        protected void BUTTEXPORTEXCEL_Click(object sender, EventArgs e)
        {
            int selectedMonth = MonthDropDownList.SelectedIndex + 1;

            var payrollData = functions.LoadPayRollData(selectedMonth);
            functions.ExportPayrollDataToExcel(payrollData);
        }

        protected void ButtonGeneratePayroll_Click(object sender, EventArgs e)
        {
            int selectedMonth = MonthDropDownList.SelectedIndex + 1;
            int selectedYear = Int32.Parse(YearDropDownList.SelectedValue);

            bool hasExistingRecordsForMonth = entities.Payrolls
                .Any(x => x.payPeriodEnd.Value.Month == selectedMonth && x.payPeriodEnd.Value.Year == selectedYear);

            if (!hasExistingRecordsForMonth)
            {
                functions.GeneratePayrollEntries(selectedMonth, selectedYear);
                LoadPayRollData(selectedMonth);
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int selectedEmployeeId = int.Parse(employeeList.SelectedValue);
            int selectedMonth = int.Parse(empHoursMonthDropdown.SelectedValue);
            int selectedYear = Int32.Parse(empHoursYearDropdown.SelectedValue);

            var payRollData = entities.Payrolls.FirstOrDefault(x => x.employeeID == selectedEmployeeId && x.payPeriodStart.Value.Month == selectedMonth && x.payPeriodStart.Value.Year == selectedYear);

            if (payRollData != null)
            {
                payRollData.totalHoursWorked = Double.Parse(totalHoursWorked.Text);
                payRollData.totalOvertimeWorked = Double.Parse(totalOvertimeWorked.Text);
                entities.SaveChanges();
            }

            LoadPayRollData(selectedMonth);
        }

        protected void LoadButton_Click(object sender, EventArgs e)
        {
            int selectedEmployeeId = int.Parse(employeeList.SelectedValue);
            int selectedMonth = int.Parse(empHoursMonthDropdown.SelectedValue);
            int selectedYear = Int32.Parse(empHoursYearDropdown.SelectedValue);

            var payRollData = entities.Payrolls.FirstOrDefault(x => x.employeeID == selectedEmployeeId && x.payPeriodStart.Value.Month == selectedMonth && x.payPeriodStart.Value.Year == selectedYear);

            if (payRollData != null)
            {
                totalHoursWorked.Text = payRollData.totalHoursWorked.ToString();
                totalOvertimeWorked.Text = payRollData.totalOvertimeWorked.ToString();
            }
            else
            {
                totalHoursWorked.Text = string.Empty;
                totalOvertimeWorked.Text = string.Empty;
            }

            LoadPayRollData(selectedMonth);
        }

        protected void ButtonLoadPayroll_Click(object sender, EventArgs e)
        {
            int month = Convert.ToInt32(MonthDropDownList.SelectedValue);
            LoadPayRollData(month);
        }

        protected void ButtonDeletePayroll_Click(object sender, EventArgs e)
        {
            int selectedMonth = Convert.ToInt32(MonthDropDownList.SelectedValue);
            int selectedYear = Convert.ToInt32(YearDropDownList.SelectedValue);

            var payrollData = entities.Payrolls
                .Where(x => x.payPeriodEnd.Value.Month == selectedMonth && x.payPeriodEnd.Value.Year == selectedYear)
                .ToList();

            foreach (var item in payrollData)
            {
                entities.Payrolls.Remove(item);
            }

            entities.SaveChanges();
            LoadPayRollData(selectedMonth);
        }
    }
}
