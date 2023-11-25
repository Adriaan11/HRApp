using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EngineeringClubHR
{
    public partial class CreateTasks : Page
    {
        private readonly string[] priority = { "High", "Medium", "Low" };
        private readonly string[] status = { "Open", "Not Started", "In Progress", "Completed" };
        private string loadedTaskid;

        protected void Page_Load(object sender, EventArgs e)
        {
            loadedTaskid = Request.QueryString["taskid"];
            if (!IsPostBack)
            {
                using (var entities = new EngineeringClubHREntities4())
                {
                    LoadDropdowns(entities);
                }

                if (!string.IsNullOrEmpty(loadedTaskid))
                {
                    using (var entities = new EngineeringClubHREntities4())
                    {
                        LoadTaskDetails(loadedTaskid, entities);
                        BtnCreate.Text = "Update";
                    }
                }
            }
        }

        private void LoadDropdowns(EngineeringClubHREntities4 entities)
        {
            LoadClients(entities);
            LoadEmployees(entities);
            LoadStatusLevel();
            LoadPriority();
        }

        private void LoadTaskDetails(string taskId, EngineeringClubHREntities4 entities)
        {
            var task = entities.Tasks.FirstOrDefault(t => t.TaskId.ToString() == taskId);
            if (task == null) return;

            var client = entities.Clients.FirstOrDefault(c => c.clientID == task.ClientID);
            if (client == null) return;

            DateTime dueDate;
            DateTime.TryParse(task.DueDate.ToString(), out dueDate);

            TitleTextBox.Text = task.Title;
            DescriptionTextBox.Text = task.Description;
            TxtDueDateCalender.Text = dueDate.ToString("yyyy-MM-dd");
            DropDownClient.SelectedValue = client.clientID.ToString();
            DropDownPriority.SelectedValue = task.PriorityLevel;
            DropDownStatus.SelectedValue = task.Status;
            AssignToDropDown.SelectedValue = task.AssignedTo.ToString();
            CreateOnBehaldDropDown.SelectedValue = task.CreatedBy.ToString();
        }

        private void LoadClients(EngineeringClubHREntities4 entities)
        {
            var clients = entities.Clients.ToList();
            BindDropdown(DropDownClient, clients, "organizationName", "clientID");
        }

        private void LoadEmployees(EngineeringClubHREntities4 entities)
        {
            var employees = entities.Employees.ToList();
            BindDropdown(AssignToDropDown, employees, "FullName", "employeeID");
            BindDropdown(CreateOnBehaldDropDown, employees, "FullName", "employeeID");
        }

        private void LoadStatusLevel()
        {
            DropDownStatus.DataSource = status;
            DropDownStatus.DataBind();
        }

        private void LoadPriority()
        {
            DropDownPriority.DataSource = priority;
            DropDownPriority.DataBind();
        }

        private void BindDropdown(DropDownList dropdown, object dataSource, string textField, string valueField)
        {
            dropdown.DataSource = dataSource;
            dropdown.DataTextField = textField;
            dropdown.DataValueField = valueField;
            dropdown.DataBind();
        }

        private void SaveTask()
        {
            using (var entities = new EngineeringClubHREntities4())
            {
                if (!string.IsNullOrEmpty(loadedTaskid))
                {
                    var existingTask = entities.Tasks.FirstOrDefault(t => t.TaskId.ToString() == loadedTaskid);
                    if (existingTask != null)
                    {
                        UpdateExistingTask(existingTask);
                    }
                }
                else
                {
                    CreateNewTask(entities);
                }

                entities.SaveChanges();
                Response.Redirect("ManageTasks.aspx");
            }
        }

        private void UpdateExistingTask(Task existingTask)
        {
            existingTask.Title = TitleTextBox.Text;
            existingTask.Description = DescriptionTextBox.Text;
            existingTask.ClientID = Convert.ToInt32(DropDownClient.SelectedValue);
            existingTask.PriorityLevel = DropDownPriority.SelectedValue;
            existingTask.Status = DropDownStatus.SelectedValue;
            existingTask.AssignedTo = Convert.ToInt32(AssignToDropDown.SelectedValue);
            existingTask.CreatedBy = Convert.ToInt32(CreateOnBehaldDropDown.SelectedValue);
            existingTask.DueDate = DateTime.Parse(TxtDueDateCalender.Text);
        }

        private void CreateNewTask(EngineeringClubHREntities4 entities)
        {
            var newTask = new Task
            {
                Title = TitleTextBox.Text,
                Description = DescriptionTextBox.Text,
                ClientID = Convert.ToInt32(DropDownClient.SelectedValue),
                PriorityLevel = DropDownPriority.SelectedValue,
                Status = DropDownStatus.SelectedValue,
                AssignedTo = Convert.ToInt32(AssignToDropDown.SelectedValue),
                CreatedBy = Convert.ToInt32(CreateOnBehaldDropDown.SelectedValue),
                DueDate = DateTime.Parse(TxtDueDateCalender.Text)
            };

            entities.Tasks.Add(newTask);
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            SaveTask();
        }


        protected void DropDownClient_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void DropDownPriority_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CreateOnBehaldDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AssignToDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        // ... The rest of your event handlers and methods remain unchanged.
    }
}
