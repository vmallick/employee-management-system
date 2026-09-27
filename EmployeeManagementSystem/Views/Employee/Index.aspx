<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="EmployeeManagementSystem.Models" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Employee Management System</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f4f7fb, #eef2f7);
            color: #2d3748;
        }

        .container {
            width: 94%;
            max-width: 1450px;
            margin: 45px auto;
        }

        /* ================= HEADER ================= */

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .title-section h2 {
            margin: 0;
            font-size: 30px;
            color: #1f2937;
            letter-spacing: -0.5px;
        }

        .title-section p {
            margin: 7px 0 0 0;
            color: #718096;
            font-size: 14px;
        }

        .add-button {
            display: inline-block;
            padding: 12px 20px;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            color: white;
            text-decoration: none;
            border-radius: 7px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(34, 197, 94, 0.25);
            transition: 0.2s;
        }

        .add-button:hover {
            background: linear-gradient(135deg, #16a34a, #15803d);
            transform: translateY(-1px);
        }

        /* ================= FILTER ================= */

        .filter-card {
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 12px;
            border: 1px solid #edf0f4;
            box-shadow: 0 5px 20px rgba(31, 41, 55, 0.06);
        }

        .filter-title {
            margin: 0 0 15px 0;
            font-size: 16px;
            font-weight: bold;
            color: #334155;
        }

        .filter-form {
            display: flex;
            align-items: flex-end;
            gap: 18px;
            flex-wrap: wrap;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .filter-group label {
            font-size: 13px;
            font-weight: 600;
            color: #475569;
        }

        .filter-group input {
            width: 280px;
            height: 40px;
            padding: 0 12px;
            border: 1px solid #d9dee7;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        .filter-group input:focus {
            border-color: #1677ff;
            box-shadow: 0 0 0 3px rgba(22, 119, 255, 0.10);
        }

        .filter-group input::placeholder {
            color: #a0aec0;
        }

        .filter-actions {
            display: flex;
            gap: 8px;
        }

        .search-button {
            height: 40px;
            padding: 0 18px;
            border: none;
            border-radius: 6px;
            background: linear-gradient(135deg, #1677ff, #0066e6);
            color: white;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .search-button:hover {
            background: linear-gradient(135deg, #0066e6, #0056c7);
        }

        .clear-button {
            height: 40px;
            padding: 11px 18px;
            border-radius: 6px;
            background-color: #f1f5f9;
            color: #475569;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            border: 1px solid #e2e8f0;
        }

        .clear-button:hover {
            background-color: #e2e8f0;
        }

        /* ================= TABLE ================= */

        .table-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(31, 41, 55, 0.08);
            overflow: hidden;
            border: 1px solid #edf0f4;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #f8fafc;
            color: #475569;
            font-size: 14px;
            font-weight: 600;
            padding: 16px 14px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
            white-space: nowrap;
        }

        td {
            padding: 16px 14px;
            font-size: 14px;
            border-bottom: 1px solid #edf0f4;
            color: #334155;
        }

        tbody tr {
            transition: 0.15s;
        }

        tbody tr:hover {
            background-color: #f8fbff;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        /* ================= STATUS ================= */

        .status-active {
            display: inline-block;
            padding: 5px 11px;
            border-radius: 20px;
            background-color: #dcfce7;
            color: #15803d;
            font-size: 12px;
            font-weight: bold;
        }

        .status-inactive {
            display: inline-block;
            padding: 5px 11px;
            border-radius: 20px;
            background-color: #fee2e2;
            color: #b91c1c;
            font-size: 12px;
            font-weight: bold;
        }

        /* ================= ACTIONS ================= */

        .action-buttons {
            display: flex;
            align-items: center;
            gap: 13px;
        }

        .action-buttons a {
            text-decoration: none;
            font-size: 17px;
            transition: 0.2s;
        }

        .view-button {
            color: #22a06b;
        }

        .view-button:hover {
            color: #15803d;
            transform: scale(1.15);
        }

        .edit-button {
            color: #1677ff;
        }

        .edit-button:hover {
            color: #0056c7;
            transform: scale(1.15);
        }

        .delete-button {
            color: #ef5350;
        }

        .delete-button:hover {
            color: #c62828;
            transform: scale(1.15);
        }

        /* ================= BOTTOM ================= */

        .bottom-section {
            margin-top: 22px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .employee-count {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 16px;
        }

        .employee-count strong {
            color: #334155;
        }

        /* ================= PAGINATION ================= */

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 6px;
        }

        .pagination a,
        .pagination span {
            min-width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 500;
        }

        .pagination a {
            background-color: white;
            color: #475569;
            border: 1px solid #e2e8f0;
            transition: 0.2s;
        }

        .pagination a:hover {
            background-color: #eff6ff;
            color: #1677ff;
            border-color: #bfdbfe;
        }

        .pagination .active {
            background: linear-gradient(135deg, #1677ff, #0066e6);
            color: white;
            border-color: #1677ff;
            box-shadow: 0 4px 10px rgba(22, 119, 255, 0.25);
        }

        .pagination .disabled {
            background-color: #f1f5f9;
            color: #cbd5e1;
            border: 1px solid #e2e8f0;
        }

        /* ================= EMPTY ================= */

        .empty-message {
            text-align: center;
            padding: 45px;
            color: #94a3b8;
            font-size: 15px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {

            .container {
                width: 97%;
            }

            .table-card {
                overflow-x: auto;
            }

            table {
                min-width: 1000px;
            }

            .page-header {
                gap: 15px;
            }

        }

    </style>

</head>

<body>

<div class="container">

    <!-- ================= HEADER ================= -->

    <div class="page-header">

        <div class="title-section">

            <h2>Employee Management System</h2>

            <p>
                Manage and view all employees
            </p>

        </div>

        <a href="<%= Url.Action("Create", "Employee") %>"
           class="add-button">
            + Add Employee
        </a>

    </div>


    <!-- ================= SEARCH / FILTER ================= -->

    <div class="filter-card">

        <div class="filter-title">
            Search Employees
        </div>

        <form method="get"
              action="<%= Url.Action("Index", "Employee") %>"
              class="filter-form">

            <!-- Employee Name -->

            <div class="filter-group">

                <label>
                    Employee Name
                </label>

                <input type="text"
                       name="employeeName"
                       value="<%= ViewBag.EmployeeName %>"
                       placeholder="Search employee name..." />

            </div>


            <!-- Email -->

            <div class="filter-group">

                <label>
                    Email
                </label>

                <input type="text"
                       name="email"
                       value="<%= ViewBag.Email %>"
                       placeholder="Search email..." />

            </div>


            <!-- Buttons -->

            <div class="filter-actions">

                <button type="submit"
                        class="search-button">
                    🔍 Search
                </button>

                <a href="<%= Url.Action("Index", "Employee") %>"
                   class="clear-button">
                    Clear
                </a>

            </div>

        </form>

    </div>


    <!-- ================= TABLE ================= -->

    <div class="table-card">

        <table>

            <thead>

                <tr>

                    <th>Employee Name</th>

                    <th>Email</th>

                    <th>Mobile</th>

                    <th>Department</th>

                    <th>Designation</th>

                    <th>Date Of Joining</th>

                    <th>Salary</th>

                    <th>Status</th>

                    <th>Action</th>

                </tr>

            </thead>


            <tbody>

            <%
                IEnumerable<EmployeeManagementSystem.Models.Employee> employees =
                    Model as IEnumerable<EmployeeManagementSystem.Models.Employee>;

                bool hasEmployees = false;

                if (employees != null)
                {
                    foreach (EmployeeManagementSystem.Models.Employee employee in employees)
                    {
                        hasEmployees = true;
            %>

                <tr>

                    <!-- Employee Name -->

                    <td>

                        <strong>
                            <%= employee.EmployeeName %>
                        </strong>

                    </td>


                    <!-- Email -->

                    <td>
                        <%= employee.Email %>
                    </td>


                    <!-- Mobile -->

                    <td>
                        <%= employee.MobileNumber %>
                    </td>


                    <!-- Department -->

                    <td>
                        <%= employee.Department %>
                    </td>


                    <!-- Designation -->

                    <td>
                        <%= employee.Designation %>
                    </td>


                    <!-- Date Of Joining -->

                    <td>

                        <%= employee.DateOfJoining.HasValue
                            ? employee.DateOfJoining.Value.ToString("dd-MM-yyyy")
                            : "" %>

                    </td>


                    <!-- Salary -->

                    <td>

                        ₹ <%= Convert.ToDecimal(employee.Salary).ToString("N2") %>

                    </td>


                    <!-- Status -->

                    <td>

                        <%
                            if (employee.Status != null &&
                                employee.Status.ToString()
                                    .Equals("Active", StringComparison.OrdinalIgnoreCase))
                            {
                        %>

                            <span class="status-active">
                                Active
                            </span>

                        <%
                            }
                            else
                            {
                        %>

                            <span class="status-inactive">
                                <%= employee.Status %>
                            </span>

                        <%
                            }
                        %>

                    </td>


                    <!-- Actions -->

                    <td>

                        <div class="action-buttons">

                            <!-- View -->

                            <a href="<%= Url.Action("Details", "Employee",
                                        new { id = employee.EmployeeId }) %>"
                               class="view-button"
                               title="View Employee">
                                👁
                            </a>


                            <!-- Edit -->

                            <a href="<%= Url.Action("Edit", "Employee",
                                        new { id = employee.EmployeeId }) %>"
                               class="edit-button"
                               title="Edit Employee">
                                ✏
                            </a>


                            <!-- Delete -->

                            <a href="<%= Url.Action("Delete", "Employee",
                                        new { id = employee.EmployeeId }) %>"
                               class="delete-button"
                               title="Delete Employee"
                               onclick="return confirm('Are you sure you want to delete this employee?');">
                                🗑
                            </a>

                        </div>

                    </td>

                </tr>

            <%
                    }
                }

                if (!hasEmployees)
                {
            %>

                <tr>

                    <td colspan="9"
                        class="empty-message">

                        No employees found.

                    </td>

                </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>


    <!-- ================= PAGINATION ================= -->

    <div class="bottom-section">

        <div class="employee-count">

            Total Employees:
            <strong>
                <%= ViewBag.TotalEmployees %>
            </strong>

        </div>


        <div class="pagination">

            <%
                int currentPage = ViewBag.CurrentPage;
                int totalPages = ViewBag.TotalPages;

                // ================= PREVIOUS =================

                if (currentPage > 1)
                {
            %>

                <a href="<%= Url.Action("Index", "Employee",
                            new
                            {
                                page = currentPage - 1,
                                employeeName = ViewBag.EmployeeName,
                                email = ViewBag.Email
                            }) %>"
                   title="Previous Page">

                    &laquo;

                </a>

            <%
                }
                else
                {
            %>

                <span class="disabled">
                    &laquo;
                </span>

            <%
                }


                // ================= PAGE NUMBERS =================

                for (int i = 1; i <= totalPages; i++)
                {
            %>

                <a href="<%= Url.Action("Index", "Employee",
                            new
                            {
                                page = i,
                                employeeName = ViewBag.EmployeeName,
                                email = ViewBag.Email
                            }) %>"
                   class="<%= i == currentPage ? "active" : "" %>">

                    <%= i %>

                </a>

            <%
                }


                // ================= NEXT =================

                if (currentPage < totalPages)
                {
            %>

                <a href="<%= Url.Action("Index", "Employee",
                            new
                            {
                                page = currentPage + 1,
                                employeeName = ViewBag.EmployeeName,
                                email = ViewBag.Email
                            }) %>"
                   title="Next Page">

                    &raquo;

                </a>

            <%
                }
                else
                {
            %>

                <span class="disabled">
                    &raquo;
                </span>

            <%
                }
            %>

        </div>

    </div>

</div>

</body>
</html>