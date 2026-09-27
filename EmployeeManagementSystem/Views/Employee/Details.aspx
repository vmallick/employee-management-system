<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="EmployeeManagementSystem.Models" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Employee Details</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f7fb;
            color: #333;
        }

        .container {
            width: 92%;
            max-width: 1000px;
            margin: 40px auto;
        }

        .page-header {
            background: #2563eb;
            color: white;
            padding: 25px 30px;
            border-radius: 10px 10px 0 0;
        }

        .page-header h2 {
            margin: 0 0 8px 0;
            font-size: 26px;
        }

        .page-header p {
            margin: 0;
            font-size: 14px;
            opacity: 0.9;
        }

        .details-card {
            background-color: white;
            padding: 30px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
        }

        .details-title {
            font-size: 19px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #1f2937;
        }

        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px 30px;
        }

        .detail-item {
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 15px;
            background-color: #f9fafb;
        }

        .detail-label {
            display: block;
            font-size: 13px;
            font-weight: bold;
            color: #6b7280;
            margin-bottom: 7px;
        }

        .detail-value {
            font-size: 15px;
            color: #111827;
            word-break: break-word;
        }

        .status-active {
            display: inline-block;
            padding: 5px 12px;
            background-color: #dcfce7;
            color: #166534;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .status-inactive {
            display: inline-block;
            padding: 5px 12px;
            background-color: #fee2e2;
            color: #991b1b;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .button-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e5e7eb;
        }

        .edit-button {
            display: inline-block;
            padding: 11px 22px;
            background-color: #2563eb;
            color: white;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
        }

        .edit-button:hover {
            background-color: #1d4ed8;
        }

        .back-button {
            display: inline-block;
            padding: 10px 20px;
            margin-left: 10px;
            background-color: #f3f4f6;
            color: #374151;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #e5e7eb;
        }

        @media screen and (max-width: 768px) {

            .container {
                width: 95%;
                margin: 20px auto;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

            .details-card {
                padding: 20px;
            }

            .edit-button,
            .back-button {
                width: 100%;
                text-align: center;
                margin: 5px 0;
            }

        }

    </style>

</head>

<body>

<%
    Employee employee = Model as Employee;
%>

<div class="container">

    <!-- Header -->

    <div class="page-header">

        <h2>Employee Details</h2>

        <p>
            View complete employee information.
        </p>

    </div>


    <!-- Details Card -->

    <div class="details-card">

        <div class="details-title">
            Employee Information
        </div>


        <div class="details-grid">


            <!-- Employee ID -->

            <div class="detail-item">

                <span class="detail-label">
                    Employee ID
                </span>

                <span class="detail-value">
                    <%= employee.EmployeeId %>
                </span>

            </div>


            <!-- Employee Name -->

            <div class="detail-item">

                <span class="detail-label">
                    Employee Name
                </span>

                <span class="detail-value">
                    <%= employee.EmployeeName %>
                </span>

            </div>


            <!-- Email -->

            <div class="detail-item">

                <span class="detail-label">
                    Email
                </span>

                <span class="detail-value">
                    <%= employee.Email %>
                </span>

            </div>


            <!-- Mobile -->

            <div class="detail-item">

                <span class="detail-label">
                    Mobile
                </span>

                <span class="detail-value">
                    <%= employee.MobileNumber %>
                </span>

            </div>


            <!-- Department -->

            <div class="detail-item">

                <span class="detail-label">
                    Department
                </span>

                <span class="detail-value">
                    <%= employee.Department %>
                </span>

            </div>


            <!-- Designation -->

            <div class="detail-item">

                <span class="detail-label">
                    Designation
                </span>

                <span class="detail-value">
                    <%= employee.Designation %>
                </span>

            </div>


            <!-- Date Of Joining -->

            <div class="detail-item">

                <span class="detail-label">
                    Date Of Joining
                </span>

                <span class="detail-value">

                    <%= employee.DateOfJoining.HasValue
                        ? employee.DateOfJoining.Value.ToString("dd-MM-yyyy")
                        : "" %>

                </span>

            </div>


            <!-- Salary -->

            <div class="detail-item">

                <span class="detail-label">
                    Salary
                </span>

                <span class="detail-value">
                   ₹ <%= Convert.ToDecimal(employee.Salary).ToString("N2") %>
                </span>

            </div>


            <!-- Status -->

            <div class="detail-item">

                <span class="detail-label">
                    Status
                </span>

                <span class="detail-value">

                    <% if (employee.Status == "Active")
                       { %>

                        <span class="status-active">
                            Active
                        </span>

                    <% }
                       else
                       { %>

                        <span class="status-inactive">
                            Inactive
                        </span>

                    <% } %>

                </span>

            </div>


        </div>


        <!-- Buttons -->

        <div class="button-section">

            <a href="<%= Url.Action("Edit", "Employee",
                        new { id = employee.EmployeeId }) %>"
               class="edit-button">

                ✎ Edit Employee

            </a>


            <a href="<%= Url.Action("Index", "Employee") %>"
               class="back-button">

                ← Back to List

            </a>

        </div>

    </div>

</div>

</body>
</html>