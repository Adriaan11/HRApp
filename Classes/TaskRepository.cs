using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EngineeringClubHR.Classes
{
    public class TaskRepository
    {
        private readonly EngineeringClubHREntities4 _engineeringClubHREntities;

        public TaskRepository(EngineeringClubHREntities4 engineeringClubHREntities)
        {
            _engineeringClubHREntities = engineeringClubHREntities;
        }

        public List<TaskViewModel> GetTasks()
        {
            List<TaskViewModel> taskList = (from a in _engineeringClubHREntities.Tasks
                                            join b in _engineeringClubHREntities.Employees on a.AssignedTo equals b.employeeID into taskWithEmployee
                                            from b in taskWithEmployee.DefaultIfEmpty()
                                            join c in _engineeringClubHREntities.Clients on a.ClientID equals c.clientID into taskWithClient
                                            from c in taskWithClient.DefaultIfEmpty()
                                            select new TaskViewModel
                                            {
                                                Client = c != null ? c.organizationName : "No Client",
                                                TaskID = a.TaskId,
                                                Title = a.Title,
                                                Description = a.Description,
                                                AssignedTo = b != null ? b.firstName + " " + b.lastName : "Not Assigned",
                                                PriorityLevel = a.PriorityLevel,
                                                Status = a.Status
                                            }).ToList();
            return taskList;
        }
    }

}