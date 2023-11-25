using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EngineeringClubHR
{
    public class Classes
    {
        public class Employees
        {
            public int employeeID { get; set; }
            public int payrollID { get; set; }
            public int managerID { get; set; }
            public int clientID { get; set; }
            public string firstName { get; set; }
            public string middleName { get; set; }
            public string lastName { get; set; }
            public string preferredName { get; set; }
            public string gender { get; set; }
            public System.DateTime dateOfBirth { get; set; }
            public string identificationNumber { get; set; }
            public string maritalStatus { get; set; }
            public string nationality { get; set; }
            public string emailAddress { get; set; }
            public string phoneNumber { get; set; }
            public string emergencyContactName { get; set; }
            public string emergencyContactPhone { get; set; }
            public string emergencyContactRelationship { get; set; }
            public string position { get; set; }
            public string jobTitle { get; set; }
            public string department { get; set; }
            public System.DateTime hireDate { get; set; }
            public Nullable<System.DateTime> terminationDate { get; set; }
            public string employmentStatus { get; set; }
            public string employmentType { get; set; }
            public int workHoursPerWeek { get; set; }
            public double salary { get; set; }
            public double hourlyRate { get; set; }
            public string address { get; set; }
            public string city { get; set; }
            public string state { get; set; }
            public string postalCode { get; set; }
            public string country { get; set; }
            public string officeLocation { get; set; }
            public string profilePicture { get; set; }
            public string password { get; set; }
        }

        public class Clients
        {
            public int EmployeeID { get; set; } // The primary key should be unique to the Client entity
                                                // Rest of the fields same as Employee
            public string FirstName { get; set; }
            public string MiddleName { get; set; }
            public string LastName { get; set; }
            public string PreferredName { get; set; }
            public string Gender { get; set; }
            public DateTime DateOfBirth { get; set; }
            public string IdentificationNumber { get; set; }
            public string MaritalStatus { get; set; }
            public string Nationality { get; set; }
            public string Email { get; set; }
            public string PhoneNumber { get; set; }
            public string EmergencyContactName { get; set; }
            public string EmergencyContactPhone { get; set; }
            public string EmergencyContactRelationship { get; set; }
            public string Position { get; set; }
            public string JobTitle { get; set; }
            public string Department { get; set; }
            public int ManagerID { get; set; }
            public DateTime HireDate { get; set; }
            public DateTime TerminationDate { get; set; }
            public string EmploymentStatus { get; set; }
            public string EmploymentType { get; set; }
            public int WorkHoursPerWeek { get; set; }
            public decimal Salary { get; set; }
            public decimal HourlyRate { get; set; }
            public string Address { get; set; }
            public string City { get; set; }
            public string State { get; set; }
            public string PostalCode { get; set; }
            public string Country { get; set; }
            public string OfficeLocation { get; set; }
            public byte[] ProfilePicture { get; set; } // assuming a binary data for picture
        }

        public class Tasks
        {
            public int TaskID { get; set; }
            public int EmployeeID { get; set; }
            public int ClientID { get; set; }
            public string Description { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
            public string Status { get; set; }
        }

        public class TimeSchedules
        {
            public int ScheduleID { get; set; }
            public int EmployeeID { get; set; }
            public DateTime StartTime { get; set; }
            public DateTime EndTime { get; set; }
        }

        public class Payrolls
        {
            public int PayrollID { get; set; }
            public int EmployeeID { get; set; }
            public decimal Salary { get; set; }
            public decimal Deductions { get; set; }
            public decimal NetPay { get; set; }
            public string PayPeriod { get; set; }
        }

        public class Leaves
        {
            public int LeaveID { get; set; }
            public int EmployeeID { get; set; }
            public string LeaveType { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
            public string Status { get; set; }
        }

        public class Expense
        {
            public int ExpenseID { get; set; }
            public int EmployeeID { get; set; }
            public string Description { get; set; }
            public decimal Amount { get; set; }
            public DateTime ExpenseDate { get; set; }
            public string Status { get; set; }
        }

        public class Approvals
        {
            public int ApprovalID { get; set; }
            public int ApproverID { get; set; }
            public string RequestType { get; set; }
            public int RequestID { get; set; }
            public string Status { get; set; }
        }

        public class TeamChats
        {
            public int ChatID { get; set; }
            public int SenderID { get; set; }
            public string Message { get; set; }
            public DateTime Timestamp { get; set; }
        }

        public class Managers
        {
            public int ManagerID { get; set; }
            public int EmployeeID { get; set; }
        }

    }
}