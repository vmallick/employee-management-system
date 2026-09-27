using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using EmployeeManagementSystem.DAL;
using EmployeeManagementSystem.Models;

namespace EmployeeManagementSystem.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly EmployeeRepository repository;

        public EmployeeController()
        {
            repository = new EmployeeRepository();
        }


        // =========================================================
        // EMPLOYEE LIST + SEARCH + PAGINATION
        // =========================================================

        public ActionResult Index(
            int page = 1,
            string employeeName = "",
            string email = "")
        {
            // Page size
            int pageSize = 5;

            // Get all employees from database
            List<Employee> employees = repository.GetAllEmployees();


            // =====================================================
            // SEARCH BY EMPLOYEE NAME
            // =====================================================

            if (!string.IsNullOrWhiteSpace(employeeName))
            {
                employees = employees
                    .Where(e =>
                        e.EmployeeName != null &&
                        e.EmployeeName.IndexOf(
                            employeeName,
                            StringComparison.OrdinalIgnoreCase) >= 0)
                    .ToList();
            }


            // =====================================================
            // SEARCH BY EMAIL
            // =====================================================

            if (!string.IsNullOrWhiteSpace(email))
            {
                employees = employees
                    .Where(e =>
                        e.Email != null &&
                        e.Email.IndexOf(
                            email,
                            StringComparison.OrdinalIgnoreCase) >= 0)
                    .ToList();
            }


            // =====================================================
            // TOTAL EMPLOYEES AFTER FILTER
            // =====================================================

            int totalEmployees = employees.Count;


            // =====================================================
            // TOTAL PAGES
            // =====================================================

            int totalPages = (int)Math.Ceiling(
                (double)totalEmployees / pageSize
            );


            // At least 1 page
            if (totalPages == 0)
            {
                totalPages = 1;
            }


            // =====================================================
            // INVALID PAGE HANDLING
            // =====================================================

            if (page < 1)
            {
                page = 1;
            }

            if (page > totalPages)
            {
                page = totalPages;
            }


            // =====================================================
            // PAGINATION
            // =====================================================

            employees = employees
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();


            // =====================================================
            // SEND DATA TO VIEW
            // =====================================================

            ViewBag.CurrentPage = page;

            ViewBag.TotalPages = totalPages;

            ViewBag.TotalEmployees = totalEmployees;

            ViewBag.EmployeeName = employeeName;

            ViewBag.Email = email;


            return View(employees);
        }


        // =========================================================
        // VIEW EMPLOYEE DETAILS
        // =========================================================

        public ActionResult Details(int id)
        {
            Employee employee = repository.GetEmployeeById(id);

            if (employee == null)
            {
                return HttpNotFound();
            }

            return View(employee);
        }


        // =========================================================
        // CREATE - GET
        // =========================================================

        [HttpGet]
        public ActionResult Create()
        {
            Employee employee = new Employee();

            employee.Status = "Active";

            return View(employee);
        }


        // =========================================================
        // CREATE - POST
        // =========================================================

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Employee employee)
        {
            if (ModelState.IsValid)
            {
                repository.AddEmployee(employee);

                return RedirectToAction("Index");
            }

            return View(employee);
        }


        // =========================================================
        // EDIT - GET
        // =========================================================

        [HttpGet]
        public ActionResult Edit(int id)
        {
            Employee employee = repository.GetEmployeeById(id);

            if (employee == null)
            {
                return HttpNotFound();
            }

            return View(employee);
        }


        // =========================================================
        // EDIT - POST
        // =========================================================

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Employee employee)
        {
            if (ModelState.IsValid)
            {
                repository.UpdateEmployee(employee);

                return RedirectToAction("Index");
            }

            return View(employee);
        }


        // =========================================================
        // DELETE
        // =========================================================

        [HttpGet]
        public ActionResult Delete(int id)
        {
            Employee employee = repository.GetEmployeeById(id);

            if (employee == null)
            {
                return HttpNotFound();
            }

            repository.DeleteEmployee(id);

            return RedirectToAction("Index");
        }
    }
}