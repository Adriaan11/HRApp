
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
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

    public class LeaveEqualityComparer : IEqualityComparer<LeaveViewModel>
    {
        public bool Equals(LeaveViewModel x, LeaveViewModel y)
        {
            if (x == null && y == null)
                return true;

            if (x == null || y == null)
                return false;

            return x.LeaveID == y.LeaveID && x.EmployeeName == y.EmployeeName; // Adjust this to your needs
        }

        public int GetHashCode(LeaveViewModel obj)
        {
            return obj.LeaveID.GetHashCode(); // Adjust this to your needs
        }
    }

    public partial class ManageLeave : Page
    {
        private readonly EngineeringClubHREntities4 _db = new EngineeringClubHREntities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var leaves = FetchLeaves();
                LoadLeaves(leaves);
            }
        }

        protected void LoadLeaves(List<LeaveViewModel> leaveViewModels)
        {
            var distinctLeaves = leaveViewModels.Distinct(new LeaveEqualityComparer()).ToList();
            BindLeavesToRepeater(OutstandingLeaveRepeater, distinctLeaves.Where(x => x.StatusID == 2 || x.StatusID == 3));
            BindLeavesToRepeater(LeaveHistoryRepeater, distinctLeaves.Where(x => x.StatusID == 1 || x.StatusID == 4 || x.StatusID == 5).OrderByDescending(x => x.ManagerActionDate).Take(5));
        }

        private void BindLeavesToRepeater(Repeater repeater, IEnumerable<LeaveViewModel> leaves)
        {
            repeater.DataSource = leaves;
            repeater.DataBind();
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
        protected void BtnApprove_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int leaveId = int.Parse(btn.CommandArgument);
            ApproveLeave(leaveId);
            LoadLeaves(FetchLeaves());
        }

        protected void BtnReject_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int leaveId = int.Parse(btn.CommandArgument);
            RejectLeave(leaveId);
            LoadLeaves(FetchLeaves());
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int leaveId = int.Parse(btn.CommandArgument);
            CancelLeave(leaveId);
            LoadLeaves(FetchLeaves());
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string leaveId = btn.CommandArgument;
            Response.Redirect("~/CreateLeave.aspx?leaveId=" + leaveId);
        }

        public void ApproveLeave(int leaveId)
        {
            var leave = _db.Leaves.FirstOrDefault(x => x.leaveID == leaveId);
            var workflow = _db.WorkflowTables.FirstOrDefault(x => x.LeaveOrExpenseID == leaveId);
            if (leave != null)
            {
                leave.statusID = 1;
                workflow.ManagerActionDate = DateTime.Now;
                workflow.Comments = "HR Approved";
                // Set the ID corresponding to "Approved"
                _db.SaveChanges();
            }
        }

        public void RejectLeave(int leaveId)
        {
            var leave = _db.Leaves.FirstOrDefault(x => x.leaveID == leaveId);
            var workflow = _db.WorkflowTables.FirstOrDefault(x => x.LeaveOrExpenseID == leaveId);

            if (leave != null)
            {
                leave.statusID = 4; // Set the ID corresponding to "Rejected"
                workflow.ManagerActionDate = DateTime.Now;
                workflow.Comments = "HR Rejected";
                _db.SaveChanges();
            }
        }

        public void CancelLeave(int leaveId)
        {
            var leave = _db.Leaves.FirstOrDefault(x => x.leaveID == leaveId);
            if (leave != null)
            {
                leave.statusID = 5; // Set the ID corresponding to "Cancelled"
                _db.SaveChanges();
            }
        }

        protected void OnApproveButtonClick(object sender, EventArgs e)
        {
            // Approval logic
        }

        protected void OnRejectButtonClick(object sender, EventArgs e)
        {
            // Rejection logic
        }

        protected void OnEditButtonClick(object sender, EventArgs e)
        {
            // Edit logic
        }

        protected void OutstandingLeaveRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LeaveViewModel leave = (LeaveViewModel)e.Item.DataItem;

                ImageButton approveButton = (ImageButton)e.Item.FindControl("BtnApprove");
                ImageButton rejectButton = (ImageButton)e.Item.FindControl("BtnReject");
                ImageButton editButton = (ImageButton)e.Item.FindControl("BtnEdit");

                approveButton.CommandArgument = leave.LeaveID.ToString();
                rejectButton.CommandArgument = leave.LeaveID.ToString();
                editButton.CommandArgument = leave.LeaveID.ToString();



                approveButton.Click += (s, args) =>
                {
                    // approve logic
                };

                rejectButton.Click += (s, args) =>
                {
                    // reject logic
                };

                editButton.Click += (s, args) =>
                {
                    // edit logic
                };


            }
        }

        protected void BtnOpenChat_Click(object sender, EventArgs e)
        {

        }

        protected void BtnAddLeave_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateLeave.aspx");

        }

        protected void searchBar_TextChanged(object sender, EventArgs e)
        {

        }

        // ... Other methods and classes inside ManageLeave class remain unchanged
    }
}
