using EngineeringClubHR.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public class TaskViewModel
    {
        public int TaskID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string AssignedTo { get; set; }
        public string PriorityLevel { get; set; }
        public string Status { get; set; }
        public string Client { get; set; }
    }
    public partial class ManageTasks : Page
    {
        private readonly EngineeringClubHREntities4 _engineeringClubHREntities = new EngineeringClubHREntities4();
        private List<TaskViewModel> tasks = new List<TaskViewModel>();
        private const string HighPriority = "High";
        private const string MediumPriority = "Medium";
        private const string LowPriority = "Low";
        protected void Page_Load(object sender, EventArgs e)
        {

            tasks = loadTasksMethod();
            LoadTasks(tasks);
        }

        private void LoadTasks(List<TaskViewModel> taskViewModels)
        {
            BindData(HighPriorityTaskRepeater, taskViewModels.Where(task => task.PriorityLevel == "High" && task.Status != "Completed"));
            BindData(MediumPriorityTaskRepeater, taskViewModels.Where(task => task.PriorityLevel == "Medium" && task.Status != "Completed"));
            BindData(LowPriorityTaskRepeater, taskViewModels.Where(task => task.PriorityLevel == "Low" && task.Status != "Completed"));
            BindData(CompletedTaskRepeater, taskViewModels.Where(task => task.Status == "Completed"));
        }

        private List<TaskViewModel> loadTasksMethod()
        {
            TaskRepository taskRepository = new TaskRepository(_engineeringClubHREntities);
            List<TaskViewModel> taskList = taskRepository.GetTasks();
            return taskList;
        }

        private static void BindData(Repeater repeater, IEnumerable<TaskViewModel> tasks)
        {
            repeater.DataSource = tasks;
            repeater.DataBind();
        }
        protected void CREATETASKS_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateTasks.aspx");
        }

        protected void TaskRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var task = (TaskViewModel)e.Item.DataItem;
                var cardDiv = (HtmlGenericControl)e.Item.FindControl("CardDiv");

                if (cardDiv != null)
                {
                    if (task.Status == "Completed")
                    {
                        cardDiv.Attributes["class"] += " priority-blue";
                    }
                    else
                    {
                        switch (task.PriorityLevel)
                        {
                            case "High":
                                cardDiv.Attributes["class"] += " priority-high";
                                break;
                            case "Medium":
                                cardDiv.Attributes["class"] += " priority-medium";
                                break;
                            case "Low":
                                cardDiv.Attributes["class"] += " priority-low";
                                break;
                        }
                    }
                }
            }
        }

        protected void CREATETASKS_Click1(object sender, EventArgs e)
        {
            Response.Redirect("CreateTasks.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string taskID = btn.CommandArgument;
            Response.Redirect("CreateTasks.aspx?taskid=" + taskID);
        }

        protected void searchBar_TextChanged(object sender, EventArgs e)
        {
            TextBox searchBar = (TextBox)sender;
            string searchText = searchBar.Text.ToLower();

            // Filter tasks based on search text
            var filteredTasks = tasks.Where(task => task.Title.ToLower().Contains(searchText)
                                                   || task.Description.ToLower().Contains(searchText)
                                                   || task.AssignedTo.ToLower().Contains(searchText)
                                                   || task.PriorityLevel.ToLower().Contains(searchText)
                                                   || task.Status.ToLower().Contains(searchText)
                                                   || task.Client.ToLower().Contains(searchText)).ToList();

            // Load the filtered tasks
            LoadTasks(filteredTasks);
        }
    }
}
