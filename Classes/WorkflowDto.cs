using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace EngineeringClubHR
{
    public class WorkflowDto
    {

        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public string EmployeeFullName { get; set; }
        public int? ManagerID { get; set; }
        public string ManagerFullName { get; set; }
        public string ApplicationType { get; set; }
        public int? LeaveOrExpenseID { get; set; }
        public DateTime? ApplicationDate { get; set; }
        public int? ApprovalStatusID { get; set; }
        public string ApprovalStatus { get; set; }
        public DateTime? ManagerActionDate { get; set; }
        public string Comments { get; set; }

        public WorkflowDto(WorkflowTable table)
        {
            ID = table.ID;
            EmployeeID = table.EmployeeID;
            EmployeeFullName = $"{table.EmployeeFirstName} {table.EmployeeLastName}";
            ManagerID = table.ManagerID;
            ManagerFullName = $"{table.ManagerFirstName} {table.ManagerLastName}";
            ApplicationType = table.ApplicationType;
            LeaveOrExpenseID = table.LeaveOrExpenseID;
            ApplicationDate = table.ApplicationDate;
            ApprovalStatusID = table.ApprovalStatusID;
            ApprovalStatus = table.ApprovalStatus;
            ManagerActionDate = table.ManagerActionDate;
            Comments = table.Comments;

        }
    }


    [Serializable]
    public class axesData
    {
        public object xName { get; set; }
        public object yName { get; set; }
    }
    [Serializable]
    public class SeriesData
    {
        public List<axesData> allSeries { get; set; }
        public object Name { get; set; }
    }

    [Serializable]
    public class ChartDataWrapper
    {
        public List<SeriesData> SeriesDataList { get; set; }
        public List<axesData> AxesDataList { get; set; }
        public string ChartType { get; set; }  //  "pie" or "column"
    }






}
