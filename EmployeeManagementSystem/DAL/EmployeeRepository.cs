using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EmployeeManagementSystem.Models;
namespace EmployeeManagementSystem.DAL
{
    public class EmployeeRepository
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;


        // GET ALL EMPLOYEES
        public List<Employee> GetAllEmployees()
        {
            List<Employee> employees = new List<Employee>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Employees";

                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Employee employee = new Employee();

                    employee.EmployeeId = Convert.ToInt32(reader["EmployeeId"]);
                    employee.EmployeeName = reader["EmployeeName"].ToString();
                    employee.Email = reader["Email"].ToString();
                    employee.MobileNumber = reader["MobileNumber"].ToString();
                    employee.Department = reader["Department"].ToString();
                    employee.Designation = reader["Designation"].ToString();

                    if (reader["DateOfJoining"] != DBNull.Value)
                    {
                        employee.DateOfJoining =
                            Convert.ToDateTime(reader["DateOfJoining"]);
                    }

                    employee.Salary = Convert.ToDecimal(reader["Salary"]);
                    employee.Status = reader["Status"].ToString();

                    employees.Add(employee);
                }
            }

            return employees;
        }


        // GET EMPLOYEE BY ID
        public Employee GetEmployeeById(int id)
        {
            Employee employee = null;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query =
                    "SELECT * FROM Employees WHERE EmployeeId = @EmployeeId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@EmployeeId", id);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    employee = new Employee();

                    employee.EmployeeId = Convert.ToInt32(reader["EmployeeId"]);
                    employee.EmployeeName = reader["EmployeeName"].ToString();
                    employee.Email = reader["Email"].ToString();
                    employee.MobileNumber = reader["MobileNumber"].ToString();
                    employee.Department = reader["Department"].ToString();
                    employee.Designation = reader["Designation"].ToString();

                    if (reader["DateOfJoining"] != DBNull.Value)
                    {
                        employee.DateOfJoining =
                            Convert.ToDateTime(reader["DateOfJoining"]);
                    }

                    employee.Salary = Convert.ToDecimal(reader["Salary"]);
                    employee.Status = reader["Status"].ToString();
                }
            }

            return employee;
        }


        // ADD EMPLOYEE
        public void AddEmployee(Employee employee)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO Employees
                    (
                        EmployeeName,
                        Email,
                        MobileNumber,
                        Department,
                        Designation,
                        DateOfJoining,
                        Salary,
                        Status
                    )
                    VALUES
                    (
                        @EmployeeName,
                        @Email,
                        @MobileNumber,
                        @Department,
                        @Designation,
                        @DateOfJoining,
                        @Salary,
                        @Status
                    )";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@EmployeeName", employee.EmployeeName);
                cmd.Parameters.AddWithValue("@Email", employee.Email);
                cmd.Parameters.AddWithValue("@MobileNumber", employee.MobileNumber);
                cmd.Parameters.AddWithValue("@Department", employee.Department);
                cmd.Parameters.AddWithValue("@Designation", employee.Designation);

                cmd.Parameters.AddWithValue(
                    "@DateOfJoining",
                    employee.DateOfJoining.HasValue
                        ? (object)employee.DateOfJoining.Value
                        : DBNull.Value
                );

                cmd.Parameters.AddWithValue("@Salary", employee.Salary);
                cmd.Parameters.AddWithValue("@Status", employee.Status);

                con.Open();

                cmd.ExecuteNonQuery();
            }
        }


        // UPDATE EMPLOYEE
        public void UpdateEmployee(Employee employee)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    UPDATE Employees
                    SET
                        EmployeeName = @EmployeeName,
                        Email = @Email,
                        MobileNumber = @MobileNumber,
                        Department = @Department,
                        Designation = @Designation,
                        DateOfJoining = @DateOfJoining,
                        Salary = @Salary,
                        Status = @Status
                    WHERE EmployeeId = @EmployeeId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                cmd.Parameters.AddWithValue("@EmployeeName", employee.EmployeeName);
                cmd.Parameters.AddWithValue("@Email", employee.Email);
                cmd.Parameters.AddWithValue("@MobileNumber", employee.MobileNumber);
                cmd.Parameters.AddWithValue("@Department", employee.Department);
                cmd.Parameters.AddWithValue("@Designation", employee.Designation);

                cmd.Parameters.AddWithValue(
                    "@DateOfJoining",
                    employee.DateOfJoining.HasValue
                        ? (object)employee.DateOfJoining.Value
                        : DBNull.Value
                );

                cmd.Parameters.AddWithValue("@Salary", employee.Salary);
                cmd.Parameters.AddWithValue("@Status", employee.Status);

                con.Open();

                cmd.ExecuteNonQuery();
            }
        }


        // DELETE EMPLOYEE
        public void DeleteEmployee(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM dbo.Employees WHERE EmployeeId = @EmployeeId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeId", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

    }
}