using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class SchedulingWeekView : System.Web.UI.Page
    {
        private string scheduleRepeatingID;
        public class EventSchedulingModel
        {
            public int ScheduleID { get; set; }
            public string EmployeeName { get; set; }
            public string ClientName { get; set; }
            public DateTime? StartDate { get; set; }
            public DateTime? EndDate { get; set; }
            public TimeSpan? StartTime { get; set; }
            public TimeSpan? EndTime { get; set; }
            public string TaskDescription { get; set; }
            public string TypeOfTask { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            scheduleRepeatingID = Request.QueryString["scheduleID"];
            if (!IsPostBack)
            {
                DayPilotCalendar1.DataSource = GetData();
                DayPilotCalendar1.DataBind();
            }
        }


        protected DataTable GetData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("startDate", typeof(DateTime));
            dt.Columns.Add("endDate", typeof(DateTime));
            dt.Columns.Add("taskDescription", typeof(string));
            dt.Columns.Add("scheduleID", typeof(string));

            using (var context = new EngineeringClubHREntities4())
            {
                var query = (from s in context.Schedulings
                             join e in context.Employees on s.employeeID equals e.employeeID
                             join c in context.Clients on s.clientID equals c.clientID
                             select new EventSchedulingModel
                             {
                                 ScheduleID = s.scheduleID,
                                 EmployeeName = e.firstName,
                                 TaskDescription = s.taskDescription,
                                 StartDate = s.startDate,
                                 EndDate = s.endDate,
                             }).ToList();

                foreach (var item in query)
                {
                    DataRow row = dt.NewRow();
                    row["startDate"] = item.StartDate; 
                    row["endDate"] = item.EndDate; 
                    row["taskDescription"] = item.TaskDescription;
                    row["scheduleID"] = item.ScheduleID.ToString();

                    dt.Rows.Add(row);
                }
            }
            return dt;
        }

        protected void DropDownClient_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DropDownEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DropDownDays_SelectedIndexChanged(object sender, EventArgs e)
        {
        }


        #region DayPilot Calendar
        protected void DayPilotCalendar1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
        {
            var entities = new EngineeringClubHREntities4();
            switch (e.Command)
            {
                case "refresh":
                    DayPilotCalendar1.DataSource = entities;
                    DayPilotCalendar1.DataBind();
                    DayPilotCalendar1.Update();
                    DayPilotCalendar1.UpdateWithMessage("Refreshed.");

                    break;
                case "previous":
                    DayPilotCalendar1.StartDate = DayPilotCalendar1.StartDate.AddDays(-DayPilotCalendar1.Days);
                    DayPilotCalendar1.Update();
                 
                    break;
                case "next":
                    DayPilotCalendar1.StartDate = DayPilotCalendar1.StartDate.AddDays(DayPilotCalendar1.Days);
                    DayPilotCalendar1.Update();
                    break;
                case "today":
                    DayPilotCalendar1.StartDate = (DayPilotCalendar1.Days == 7) ? DayPilot.Utils.Week.FirstDayOfWeek(DateTime.Today) : DateTime.Today;
                    DayPilotCalendar1.Update();
                    break;
            }
        }
        #endregion
    }
}