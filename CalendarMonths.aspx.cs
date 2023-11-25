using DayPilot.Utils;
using DayPilot.Web.Ui.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public class EventData
    {
        public int ScheduleID { get; set; }
        public string EmployeeName { get; set; }
        public string ClientName { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string TaskDescription { get; set; }
        public string TypeOfTask { get; set; }
    }
    public partial class CalendarMonths : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page.IsPostBack))
            {
                // String.Empty;
                //  RecurrenceRule rule = RecurrenceRule.FromDateTime(str,DateTime.Now).Daily().Times(5);
                //load and getdata and bind
                //  str = rule.Encode();
                GetData();
            }
        }
        private List<Scheduling> GetSchedulings()
        {
            List<Scheduling> schedulings = new List<Scheduling>();
            using (var context = new EngineeringClubHREntities4())
            {
                schedulings = context.Schedulings.ToList();

            }
            return schedulings;
        }

        private List<Scheduling> GetTodaysSchedule()
        {
            List<Scheduling> schedulings = GetSchedulings();
            using (var entities = new EngineeringClubHREntities4())
            {
                DateTime today = DateTime.Now;

                List<Scheduling> todaySched = schedulings.Where(scDate => scDate.startDate == today).ToList();
            }

            return schedulings;
        }
        private void GetData()
        {


            using (var context = new EngineeringClubHREntities4())
            {
                List<Scheduling> schedulings = GetTodaysSchedule();
                var query = (from s in context.Schedulings
                             join e in context.Employees on s.employeeID equals e.employeeID
                             join c in context.Clients on s.clientID equals c.clientID
                             select new EventData
                             {
                                 ScheduleID = s.scheduleID,
                                 TaskDescription = s.taskDescription,
                                 StartDate = s.startDate,
                                 EndDate = s.endDate,
                             }).ToList();
                //  DataTable dt = new DataTable();

                DayPilotMonth1.DataSource = query;
                DayPilotMonth1.DataBind();
                //  return query;
            }
        }

        #region DayPilot Month
        protected void DayPilotMonth1_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.Month.BeforeCellRenderEventArgs e)
        {
            e.CssClass = Week.WeekNrISO8601(e.Start) % 2 == 0 ? "even" : "odd";
        }
        protected void DayPilotMonth1_EventClick(object sender, EventClickEventArgs e)
        {
        }
        //protected void DayPilotMonth1_BeforeHeaderRender(object sender, BeforeHeaderRenderEventArgs e)
        //{

        //}
        protected void DayPilotMonth1_TimeRangeMenuClick(object sender, TimeRangeMenuClickEventArgs e)
        {

        }
        protected void DayPilotMonth1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
        {

            switch (e.Command)
            {
                case "previous":
                    DayPilotMonth1.StartDate = DayPilotMonth1.StartDate.AddMonths(-1);
                    //   DayPilotMonth1.DataSource = GetData();
                    // DayPilotMonth1.DataBind();
                    DayPilotMonth1.Update();
                    break;
                case "next":
                    DayPilotMonth1.StartDate = DayPilotMonth1.StartDate.AddMonths(1);
                    //  DayPilotMonth1.DataSource = GetData();
                    //  DayPilotMonth1.DataBind();
                    DayPilotMonth1.Update();
                    break;
                case "navigate":
                    DayPilotMonth1.StartDate = (DateTime)e.Data["start"];
                    // DayPilotMonth1.DataSource = GetData();
                    //  DayPilotMonth1.DataBind();
                    DayPilotMonth1.Update();
                    break;
                case "filter":
                    //  DayPilotMonth1.DataSource = GetData();
                    //  DayPilotMonth1.DataBind();
                    DayPilotMonth1.Update();
                    break;
                case "refresh":
                    //   DayPilotMonth1.DataSource = GetData();
                    //   DayPilotMonth1.DataBind();
                    DayPilotMonth1.UpdateWithMessage("Refreshed.");
                    break;
            }

        }


        #endregion
    }
}