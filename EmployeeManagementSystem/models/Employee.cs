using System;
using System.ComponentModel.DataAnnotations;

namespace EmployeeManagementSystem.Models
{
    public class Employee
    {
        public int EmployeeId { get; set; }

        [Required]
        public string EmployeeName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        public string MobileNumber { get; set; }

        public string Department { get; set; }

        public string Designation { get; set; }

        [DataType(DataType.Date)]
        public DateTime? DateOfJoining { get; set; }

        public decimal? Salary { get; set; }

        public string Status { get; set; }
    }
}