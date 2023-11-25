using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Migrations.Model;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class CreateSchedule : System.Web.UI.Page
    {
        private string loadedScheduleID;
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
            loadedScheduleID = Request.QueryString["scheduleID"];
            using (var entities = new EngineeringClubHREntities4())
            {
                LoadDropDownData(entities);

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(loadedScheduleID))
                    {
                        LoadCalendarEvents(entities);
                    }
                }
                GridView1.DataSource = GetData();
                GridView1.DataBind();
            }
        }

        private void LoadCalendarEvents(EngineeringClubHREntities4 entities)
        {
            var events = entities.Schedulings.ToList();
            GridView1.DataSource = events;
            GridView1.DataBind();
        }

        private void LoadDropDownData(EngineeringClubHREntities4 entities1)
        {
            var client = entities1.Clients.ToList();
            DropDownClient.DataSource = client;
            DropDownClient.DataTextField = "organizationName";
            DropDownClient.DataValueField = "clientID";
            DropDownClient.DataBind();

            var employees = entities1.Employees.ToList();
            DropDownEmployee.DataSource = employees;
            DropDownEmployee.DataTextField = "FullName";
            DropDownEmployee.DataValueField = "employeeID";
            DropDownEmployee.DataBind();
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            using (var entities = new EngineeringClubHREntities4())
            {
                if (!string.IsNullOrEmpty(loadedScheduleID))
                {
                    int eventId = int.Parse(loadedScheduleID);
                    var existingItem = entities.Schedulings.FirstOrDefault(s => s.scheduleID == eventId);
                    if (existingItem != null)
                    {
                        existingItem.taskDescription = txtEventText.Text;
                        existingItem.clientID = int.Parse(DropDownClient.SelectedValue);
                        existingItem.employeeID = int.Parse(DropDownEmployee.SelectedValue);
                        existingItem.startDate = DateTime.Parse(TxtStartDateCalendar.Text);
                        existingItem.endDate = DateTime.Parse(TxtEndDateCalendar.Text);
                        existingItem.startDate += TimeSpan.Parse(TxtStartTimeCalendar.Text);
                        existingItem.endDate += TimeSpan.Parse(TxtEndTimeCalendar.Text);
                    }
                }
                else
                {
                    var newItem = new Scheduling
                    {
                        employeeID = int.Parse(DropDownEmployee.SelectedValue),
                        clientID = int.Parse(DropDownClient.SelectedValue),
                        taskDescription = txtEventText.Text,
                        startDate = DateTime.Parse(TxtStartDateCalendar.Text) + TimeSpan.Parse(TxtStartTimeCalendar.Text),
                        endDate = DateTime.Parse(TxtEndDateCalendar.Text) + TimeSpan.Parse(TxtEndTimeCalendar.Text)
                    };

                    entities.Schedulings.Add(newItem);
                }
                entities.SaveChanges();
                LoadCalendarEvents(entities);
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

        private void BindGridDataView()
        {
            using (var entities = new EngineeringClubHREntities4())
            {
                GridView1.DataSource = GetData();
                GridView1.DataBind();
            }
        }

        private void DeleteEvent(int eventID)
        {
            using (var entities = new EngineeringClubHREntities4())
            {
                var deleteThisOne = entities.Schedulings.FirstOrDefault(s => s.scheduleID == eventID);
                if (deleteThisOne != null)
                {
                    entities.Schedulings.Remove(deleteThisOne);
                    entities.SaveChanges();
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eventID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            DeleteEvent(eventID);
            BindGridDataView();
        }
        protected void DropDownClient_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}