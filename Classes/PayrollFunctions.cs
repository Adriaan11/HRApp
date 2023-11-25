using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using EngineeringClubHR;
using OfficeOpenXml;
using Syncfusion.Linq;

namespace EngineeringClubHR
{
    public class PayrollFunctions
    {
        EngineeringClubHREntities4 entities = new EngineeringClubHREntities4();
        public class PayrollData
        {
            public int payrollID { get; set; }
            public string employeeName { get; set; }
            public int payPeriodStart { get; set; }
            public int totalHoursWorked { get; set; }
            public int? totalOvertimeWorked { get; set; }
            public decimal? grossPay { get; set; }
            public decimal? overtimePay { get; set; }
            public decimal? netPay { get; set; }
        }
        public class CustomEmployee
        {
            public int Id { get; set; }
            public string FullName { get; set; }
        }
        public List<PayrollData> LoadPayRollData(int month)
        {
            var payrolls = entities.Payrolls
                .Where(x => x.payPeriodStart.Value.Month == month)
                .Include(p => p.Employee)
                .ToList();
            var newList = payrolls
                .Select(a => new PayrollData
                {
                    payrollID = a.payrollID,
                    employeeName = a.Employee.firstName + " " + a.Employee.lastName,
                    payPeriodStart = month,
                    totalHoursWorked = (int)a.totalHoursWorked,
                    totalOvertimeWorked = (int)a.totalOvertimeWorked,
                    grossPay = (decimal?)(a.Employee.employmentType == "Full-Time" ? a.Employee.salary : a.Employee.hourlyRate * a.totalHoursWorked),
                    overtimePay = (a.totalOvertimeWorked != null)
                        ? (decimal?)((decimal)a.totalOvertimeWorked * a.Employee.OvertimeRate)
                        : null,
                    netPay = CalculateNetPay(a.Employee.employmentType, (decimal)a.Employee.salary, (decimal)a.Employee.hourlyRate, null, null, null, (decimal)(a.totalHoursWorked ?? 0), (decimal)(a.totalOvertimeWorked ?? 0), a.Employee.OvertimeRate ?? 0)
                })
                .ToList()
                .OrderByDescending(x => x.netPay)
                .ToList();
            return newList;
        }
        private decimal CalculateNetPay(string employmentType, decimal salary, decimal hourlyRate, decimal? additions, decimal? deductions, decimal? approvedExpenses, decimal totalHoursWorked, decimal totalOvertimeWorked, decimal overtimeRate)
        {
            decimal basicPay;
            if (employmentType == "Full-Time")
            {
                basicPay = salary;
            }
            else // Assuming other types all fall under part-time payment scheme
            {
                basicPay = hourlyRate * (totalHoursWorked - totalOvertimeWorked);
            }
            var overtimePay = totalOvertimeWorked * overtimeRate;
            var totalAdditions = additions ?? 0;
            var totalDeductions = deductions ?? 0;
            var totalApprovedExpenses = approvedExpenses ?? 0;
            var netpay = basicPay + overtimePay + totalAdditions - totalDeductions;
            return netpay;
        }
        public void ExportPayrollDataToExcel(List<PayrollData> payrollData)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial; // remember to set the license context
            // Check if there's data to export
            if (payrollData == null || payrollData.Count == 0)
            {
                // Optionally handle this case
                return;
            }

            // Get the month number from the first item in payrollData
            int monthNumber = payrollData[0].payPeriodStart;
            // Get the month name from the month number
            string monthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(monthNumber);
            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("Payroll Data");
                // Header
                worksheet.Cells[1, 1].Value = "Employee Name";
                worksheet.Cells[1, 2].Value = "Pay Period Start";
                worksheet.Cells[1, 3].Value = "Total Hours Worked";
                worksheet.Cells[1, 4].Value = "Total Overtime Worked";
                worksheet.Cells[1, 5].Value = "Gross Pay";
                worksheet.Cells[1, 6].Value = "Additions";
                worksheet.Cells[1, 7].Value = "Deductions";
                worksheet.Cells[1, 8].Value = "Overtime Pay";
                worksheet.Cells[1, 9].Value = "Net Pay";
                // Data
                for (int i = 0; i < payrollData.Count; i++)
                {
                    worksheet.Cells[i + 2, 1].Value = payrollData[i].employeeName;
                    worksheet.Cells[i + 2, 2].Value = payrollData[i].payPeriodStart;
                    worksheet.Cells[i + 2, 3].Value = payrollData[i].totalHoursWorked;
                    worksheet.Cells[i + 2, 4].Value = payrollData[i].totalOvertimeWorked;
                    worksheet.Cells[i + 2, 5].Value = payrollData[i].grossPay;
                    worksheet.Cells[i + 2, 8].Value = payrollData[i].overtimePay;
                    worksheet.Cells[i + 2, 9].Value = payrollData[i].netPay;
                }
                // Auto fit columns
                worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns();
                // Save the Excel package to a MemoryStream
                using (var memoryStream = new MemoryStream())
                {
                    package.SaveAs(memoryStream);
                    // Clear all content output from the buffer stream
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    HttpContext.Current.Response.AddHeader("content-disposition", $"attachment; filename={monthName}PayrollExportData.xlsx");
                    // Write the Excel file to the response
                    HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                    // End the response, to avoid appending any extra data
                    HttpContext.Current.Response.End();
                }
            }
        }
        private List<Leave> GetApprovedLeaveRecords(int employeeId, DateTime startDate, DateTime endDate)
        {
            // Placeholder for the list of leave records. Replace with database call.
            var leaveRecords = entities.Leaves.ToList();
            {
                // Example leave records - replace these with your actual database query results
                // Add more leave records as needed for the example...
            };

            // Filter the records based on the employeeId, status, and whether the leave period falls within the start and end dates.
            return leaveRecords
                .Where(lr => lr.employeeID == employeeId && lr.statusID == 1 &&
                             lr.startDate < endDate && lr.endDate > startDate)
                .ToList();
        }
        public int GetApprovedLeaveHours(int employeeId, DateTime startDate, DateTime endDate)
        {
            var approvedLeaveRecords = GetApprovedLeaveRecords(employeeId, startDate, endDate);
            int totalLeaveHours = 0;

            foreach (var leave in approvedLeaveRecords)
            {
                // Adjust the start and end date in case the leave period extends beyond the current month.
                // Use GetValueOrDefault() to convert from DateTime? to DateTime.
                var leaveStart = (leave.startDate.GetValueOrDefault() < startDate) ? startDate : leave.startDate.GetValueOrDefault();
                var leaveEnd = (leave.endDate.GetValueOrDefault() > endDate) ? endDate : leave.endDate.GetValueOrDefault();

                for (DateTime date = leaveStart; date <= leaveEnd; date = date.AddDays(1))
                {
                    // Only add hours for weekdays.
                    if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday)
                    {
                        totalLeaveHours += 8;
                    }
                }
            }

            return totalLeaveHours;
        }


        public int GetWorkHoursCountOfMonth(int year, int month, int employeeId)
        {
            DateTime startDate = new DateTime(year, month, 1);
            DateTime endDate = startDate.AddMonths(1).AddDays(-1);
            int workHoursCount = 0;

            for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday)
                {
                    workHoursCount += 8;
                }
            }

            // Deduct the approved leave hours from the total work hours of the month.
            int approvedLeaveHours = GetApprovedLeaveHours(employeeId, startDate, endDate);
            workHoursCount -= approvedLeaveHours;

            return workHoursCount;
        }

        public void GeneratePayrollEntries(int month, int year)
        {
            var employees = entities.Employees.ToList();
            int newPayrollId = entities.Payrolls.Any()
                               ? entities.Payrolls.OrderByDescending(p => p.payrollID).First().payrollID + 1
                               : 1;

            foreach (var employee in employees)
            {
                int workhours = GetWorkHoursCountOfMonth(year, month, employee.employeeID);

                var payrollEntry = new Payroll
                {
                    payrollID = newPayrollId++,
                    employeeID = employee.employeeID,
                    payPeriodStart = new DateTime(year, month, 1),
                    payPeriodEnd = new DateTime(year, month, DateTime.DaysInMonth(year, month)),
                    totalHoursWorked = workhours,
                    totalOvertimeWorked = 0
                };

                entities.Payrolls.Add(payrollEntry);
            }
            entities.SaveChanges();
        }

        public List<CustomEmployee> GetEmployees()
        {
            return entities.Employees
                           .Select(e => new CustomEmployee
                           {
                               Id = e.employeeID,
                               FullName = e.firstName + " " + e.lastName
                           })
                           .ToList();
        }
        public static int GetWeekCountOfMonth(int year, int month)
        {
            // Get the first day of the month.
            DateTime firstDayOfMonth = new DateTime(year, month, 1);
            // Calculate the first Sunday of the month to align with the week starting on Sunday.
            int deltaToFirstSunday = (int)DayOfWeek.Sunday - (int)firstDayOfMonth.DayOfWeek;
            DateTime firstSunday = firstDayOfMonth.AddDays(deltaToFirstSunday);
            // Get the last day of the month.
            DateTime lastDayOfMonth = new DateTime(year, month, DateTime.DaysInMonth(year, month));
            // Calculate the last Sunday of the month to align with the week ending on Saturday.
            int deltaToLastSunday = (int)DayOfWeek.Sunday - (int)lastDayOfMonth.DayOfWeek;
            DateTime lastSunday = lastDayOfMonth.AddDays(deltaToLastSunday);
            // Calculate the number of weeks by counting days and dividing by 7.
            int result = (int)Math.Ceiling((lastSunday - firstSunday).TotalDays / 7.0) + 1;
            return result;
        }
        public List<PayrollData> GetPayrollsByAvailableMonths()
        {
            int currMonth = DateTime.Now.Month;
            int currYear = DateTime.Now.Year;
            var payrolls = entities.Payrolls
                .Where(x => x.payPeriodStart.Value.Month <= currMonth && x.payPeriodStart.Value.Year == currYear || x.payPeriodStart.Value.Month > currMonth && x.payPeriodStart.Value.Year == currYear - 1)
                .OrderByDescending(a => a.payPeriodStart.Value.Year)
                .ThenByDescending(a => a.payPeriodStart.Value.Month)
                .Include(p => p.Employee)
                .ToList();
            var newList = payrolls
                .Select(a => new PayrollData
                {
                    employeeName = a.Employee.firstName + " " + a.Employee.lastName,
                    payPeriodStart = a.payPeriodStart.Value.Month,
                    totalHoursWorked = (int)a.totalHoursWorked,
                    totalOvertimeWorked = (int)a.totalOvertimeWorked,
                    grossPay = (decimal?)(a.Employee.employmentType == "Full-Time" ? a.Employee.salary : a.Employee.hourlyRate * a.totalHoursWorked),
                    overtimePay = (a.totalOvertimeWorked != null)
                        ? (decimal?)((decimal)a.totalOvertimeWorked * a.Employee.OvertimeRate)
                        : null,
                    netPay = CalculateNetPay(a.Employee.employmentType, (decimal)a.Employee.salary, (decimal)a.Employee.hourlyRate, null, null, null, (decimal)(a.totalHoursWorked ?? 0), (decimal)(a.totalOvertimeWorked ?? 0), a.Employee.OvertimeRate ?? 0)
                })
                .ToList()
                .OrderByDescending(x => x.netPay)
                .ToList();
            return newList;
        }
    }
}