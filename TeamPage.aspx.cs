using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class TeamPage : System.Web.UI.Page
    {
        public class ChatMessageViewModel
        {
            public string CssClass { get; set; }
            public string Message { get; set; }
            public DateTime Timestamp { get; set; }
            public string EmployeeName { get; set; }
        }

        private List<ChatMessageViewModel> _chatMessages = new List<ChatMessageViewModel>();
        private readonly EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTeamMessages();
                UsersInChat_ItemDataBound();
            }

        }

        public List<ChatMessageViewModel> GetMessages()
        {
            var teamMessages = (from m in _engineeringClubHREntities.TeamChats
                                join e in _engineeringClubHREntities.Employees on m.senderID equals e.employeeID
                                select new ChatMessageViewModel
                                {
                                    CssClass = m.senderID == 1 ? "sent" : "received", // Assuming '1' is the current user's ID
                                    Message = m.message,
                                    Timestamp = m.timestamp,
                                    EmployeeName = e.firstName + " " + e.lastName
                                }).ToList();
            return teamMessages;
        }

        protected void UsersInChat_ItemDataBound()
        {
            try
            {
                using (var context = new EngineeringClubHREntities4())
                {
                    var employees = context.Employees.ToList();

                    UsersInChat.DataSource = employees;
                    UsersInChat.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            string message = messageInput.Text;

            if (!string.IsNullOrEmpty(message))
            {
                using (var context = new EngineeringClubHREntities4())
                {
                    context.TeamChats.Add(new TeamChat
                    {
                        senderID = 1,
                        message = message,
                        timestamp = DateTime.Now

                    });
                    context.SaveChanges();
                }

                BindTeamMessages();

                messageInput.Text = " ";
            }


        }

        protected void BindTeamMessages()
        {

            using (var context = new EngineeringClubHREntities4())
            {
                var chatMessages = GetMessages();
                ChatRepeater.DataSource = chatMessages;
                ChatRepeater.DataBind();
            }
        }

        protected void ChatRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}