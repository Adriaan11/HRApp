using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using EngineeringClubHR.Classes;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Semantics;
using Microsoft.SqlServer.Server;
using Newtonsoft.Json;
using Syncfusion.DocIO.DLS;
using Syncfusion.JavaScript.Models;
using Syncfusion.JavaScript.Web;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Diagnostics;
using System.Drawing.Drawing2D;
using System.Globalization;
using System.Linq;
using System.Net.Configuration;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace EngineeringClubHR
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public List<WorkflowDto> workFlowList;
        EngineeringClubHREntities4 _db = new EngineeringClubHREntities4();
        static List<PayrollFunctions.PayrollData> payrollList;
        private static int grievanceCurrentPageIndex;
        private static int grievancePageTotal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dictionary<string, object> htmlAttributesPrev = new Dictionary<string, object>();
                Dictionary<string, object> htmlAttributesNext = new Dictionary<string, object>();
                htmlAttributesPrev.Add("data-identifier", "previous");
                GrievancesPreviousBtn.HtmlAttributes = htmlAttributesPrev;
                htmlAttributesNext.Add("data-identifier", "next");
                GrievancesNextBtn.HtmlAttributes = htmlAttributesNext;


                workFlowList = GetDto();
                Session["workFlowList"] = workFlowList;

                LoadLeave();

                //grievances
                ManageGrievance manageGrievance = new ManageGrievance();
                int pageSize;
                List<ManageGrievance.GrievanceViewModel> grievances = manageGrievance.GetActionableGrievances(0, 3, out pageSize);

                GrievancesRepeater.DataSource = grievances;
                GrievancesRepeater.DataBind();
                GrievancesPreviousBtn.Enabled = false;
                optionsDropdown.SelectedIndex = 0;



                PayrollFunctions payrollFunctions = new PayrollFunctions();
                payrollList = payrollFunctions.GetPayrollsByAvailableMonths();

                List<String> months = payrollList.Select(x => (CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(x.payPeriodStart))).ToList();
                months = months.Distinct().ToList();

                String[,] payrollData = GetDropDownData(months);
                var datalist = new List<object>();
                for (int i = 0; i < payrollData.GetLength(0); i++)
                {
                    datalist.Add(new { Name = payrollData[i, 0], Value = payrollData[i, 1] });
                }
                PayrollDateDropdown.DataSource = datalist;
                PayrollDateDropdown.DataTextField = "Name";
                PayrollDateDropdown.DataValueField = "Value";
                PayrollDateDropdown.DataBind();

                PayrollDateDropdown.Items.Add(new DropDownListItem());

                PayrollDateDropdown.SelectedIndex = 0;
                PayrollDropdown.SelectedIndex = 0;
            }
            string script = @"
                                window.onload = function() {
                                chartChangeBtn_Click();
                                chartChangeBtn2_Click();
                                };
                                ";
            ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);


        }
        public List<WorkflowDto> GetDto()
        {
            List<WorkflowDto> dto = new List<WorkflowDto>();
            foreach (var record in _db.WorkflowTables)
            {
                dto.Add(new WorkflowDto(record));
            }
            return dto;
        }

        [System.Web.Services.WebMethod]
        public static string changeGraphic(int selectedOption)
        {
            var workFlowList = SessionManager.Instance.WorkFlowList;
            var newResult = ChartConfig.changeChart(selectedOption, workFlowList);
            var json = JsonConvert.SerializeObject(newResult);
            return json;
        }

        [System.Web.Services.WebMethod]
        public static string changePayroll(int selectedOption, int selectedMonth)
        {
            ChartDataWrapper wrapper = new ChartDataWrapper();
            wrapper.ChartType = "pie";
            wrapper.AxesDataList = new List<axesData>();
            switch (selectedOption)
            {
                case 1:
                    {
                        foreach (var payroll in payrollList)
                        {
                            if (payroll.payPeriodStart == selectedMonth)
                            {
                                wrapper.AxesDataList.Add(new axesData());
                                wrapper.AxesDataList.Last().xName = payroll.employeeName;
                                wrapper.AxesDataList.Last().yName = payroll.totalHoursWorked;
                            }
                        }
                        break;
                    }
                case 2:
                    {
                        foreach (var payroll in payrollList)
                        {
                            if (payroll.payPeriodStart == selectedMonth)
                            {
                                wrapper.AxesDataList.Add(new axesData());
                                wrapper.AxesDataList.Last().xName = payroll.employeeName;
                                wrapper.AxesDataList.Last().yName = payroll.totalOvertimeWorked;
                            }
                        }
                        break;
                    }
                case 3:
                    {
                        foreach (var payroll in payrollList)
                        {
                            if (payroll.payPeriodStart == selectedMonth)
                            {
                                wrapper.AxesDataList.Add(new axesData());
                                wrapper.AxesDataList.Last().xName = payroll.employeeName;
                                wrapper.AxesDataList.Last().yName = payroll.overtimePay;
                            }
                        }
                        break;
                    }
                case 4:
                    {
                        foreach (var payroll in payrollList)
                        {
                            if (payroll.payPeriodStart == selectedMonth)
                            {
                                wrapper.AxesDataList.Add(new axesData());
                                wrapper.AxesDataList.Last().xName = payroll.employeeName;
                                wrapper.AxesDataList.Last().yName = payroll.grossPay;
                            }
                        }
                        break;
                    }
                case 5:
                    {
                        foreach (var payroll in payrollList)
                        {
                            if (payroll.payPeriodStart == selectedMonth)
                            {
                                wrapper.AxesDataList.Add(new axesData());
                                wrapper.AxesDataList.Last().xName = payroll.employeeName;
                            }
                        }
                        break;
                    }
                case 6:
                    {
                        foreach (var payroll in payrollList)
                        {
                            if (payroll.payPeriodStart == selectedMonth)
                            {
                                wrapper.AxesDataList.Add(new axesData());
                                wrapper.AxesDataList.Last().xName = payroll.employeeName;
                            }
                        }
                        break;
                    }
                case 7:
                    {
                        foreach (var payroll in payrollList)
                        {
                            if (payroll.payPeriodStart == selectedMonth)
                            {
                                wrapper.AxesDataList.Add(new axesData());
                                wrapper.AxesDataList.Last().xName = payroll.employeeName;
                                wrapper.AxesDataList.Last().yName = payroll.netPay;
                            }
                        }
                        break;
                    }
                default: { break; }
            }
            var json = JsonConvert.SerializeObject(wrapper);
            return json;

        }
        private static String[,] GetDropDownData(List<String> months)
        {
            String[,] arr = new string[months.Count, 2];
            for (int i = 0; i < months.Count; i++)
            {
                arr[i, 0] = months[i]; // month name
                DateTime dt = DateTime.ParseExact(months[i], "MMMM", CultureInfo.CurrentCulture);
                arr[i, 1] = "" + dt.Month;
            }
            return arr;


        }
        protected void GrievanceRowCommand(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "EditGrievance")
            {
                int grievanceID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("EditGrievance.aspx?GrievanceID=" + grievanceID);

                // Redirect to the edit page or perform the editing logic here
            }
            if (e.CommandName == "AddLog")
            {
                int grievanceID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("CreateGrievanceLog.aspx?GrievanceID=" + grievanceID);
            }
        }
        protected void LeaveRowCommand(object sender, CommandEventArgs e)
        {
            System.Web.UI.WebControls.ImageButton btn = (System.Web.UI.WebControls.ImageButton)sender;
            int leaveId = int.Parse(btn.CommandArgument);
            ManageLeave ml = new ManageLeave();
            switch (e.CommandName)
            {
                case "Approve": { ml.ApproveLeave(Convert.ToInt32(e.CommandArgument)); } break;
                case "Reject": { ml.RejectLeave(Convert.ToInt32(e.CommandArgument)); } break;
                case "Edit": { ml.CancelLeave(Convert.ToInt32(e.CommandArgument)); } break;
                default: { } break;
            }
            LoadLeave();
        }

        public class LeaveViewModel
        {
            public int LeaveID { get; set; }
            public string EmployeeName { get; set; }
            public DateTime? LeaveStart { get; set; }
            public DateTime? LeaveEnd { get; set; }
            public string LeaveType { get; set; }
            public string Status { get; set; }
            public int? StatusID { get; set; }
            public string ApproverName { get; set; }
            public DateTime? ManagerActionDate { get; set; }
            public string Comments { get; set; }
            public double TotalDays { get; set; }
        }
        private List<LeaveViewModel> FetchLeaves()
        {
            try
            {
                // Step 1: Retrieve all necessary data from the database
                var leaves = (from l in _db.Leaves
                              join e in _db.Employees on l.employeeID equals e.employeeID into ej
                              from e in ej.DefaultIfEmpty()
                              join w in _db.WorkflowTables on l.leaveID equals w.LeaveOrExpenseID into wj
                              from w in wj.DefaultIfEmpty()
                              join s in _db.Status on l.statusID equals s.statusID into sj
                              from s in sj.DefaultIfEmpty()
                              select new
                              {
                                  l,
                                  e,
                                  w,
                                  s
                              }).ToList();

                // Step 2: Perform the calculation on the in-memory data
                var publicHolidays = _db.PublicHolidays.Select(ph => ph.HolidayDate).ToList();
                var leaveViewModels = leaves.Select(l => new LeaveViewModel
                {
                    LeaveID = l.l.leaveID,
                    EmployeeName = l.e != null ? l.e.firstName + " " + l.e.lastName : "N/A",
                    LeaveStart = l.l.startDate,
                    LeaveEnd = l.l.endDate,
                    LeaveType = l.l.leaveType,
                    StatusID = l.l.statusID,
                    Status = l.s != null ? l.s.statusDescription : "N/A",
                    ApproverName = l.w != null ? l.w.ManagerFirstName + " " + l.w.ManagerLastName : "N/A",
                    ManagerActionDate = l.w != null ? l.w.ManagerActionDate : null,
                    Comments = l.w != null ? l.w.Comments : "N/A",
                    TotalDays = CalculateWorkingDays(l.l.startDate, l.l.endDate, publicHolidays) // Call the method here
                }).ToList();

                return leaveViewModels;
            }
            catch (Exception ex)
            {
                // Log the exception
                // You may also choose to return a default value or throw the exception back to the caller
                return new List<LeaveViewModel>();
            }
        }
        private double CalculateWorkingDays(DateTime? start, DateTime? end, List<DateTime> publicHolidays)
        {
            if (!start.HasValue || !end.HasValue)
            {
                return 0;
            }

            double workingDays = 0;
            for (var date = start.Value; date <= end.Value; date = date.AddDays(1))
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday && !publicHolidays.Contains(date))
                {
                    workingDays++;
                }
            }
            return workingDays;
        }

        private void LoadLeave()
        {
            ManageLeave manageLeave = new ManageLeave();
            List<LeaveViewModel> outstandingLeaves = FetchLeaves().Where(l => l.StatusID != 1 && l.StatusID != 4 && l.StatusID != 5).ToList();
            OutstandingLeaveRepeater.DataSource = outstandingLeaves;
            OutstandingLeaveRepeater.DataBind();
        }

        public void DisplayGrievances(int change)
        {
            GrievancesPreviousBtn.Enabled = true;
            GrievancesNextBtn.Enabled = true;


            ManageGrievance manageGrievance = new ManageGrievance();
            int pageCount;
            const int pageSize = 3;

            grievanceCurrentPageIndex += change;

            List<ManageGrievance.GrievanceViewModel> grievances = manageGrievance.GetActionableGrievances(grievanceCurrentPageIndex, pageSize, out pageCount);

            grievancePageTotal = pageCount;

            if (grievanceCurrentPageIndex == 0)
            {
                GrievancesPreviousBtn.Enabled = false;
            }
            else if (grievanceCurrentPageIndex == pageCount - 1)
            {
                GrievancesNextBtn.Enabled = false;
            }

            GrievancesRepeater.DataSource = grievances;
            GrievancesRepeater.DataBind();



        }
        protected void GrievanceNext(object sender, EventArgs e)
        {
            DisplayGrievances(1);
        }
        protected void GrievancePrevious(object sender, EventArgs e)
        {
            DisplayGrievances(-1);
        }



    }
}
