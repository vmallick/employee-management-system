<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Add Employee</title>

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

        .form-card {
            background: white;
            padding: 30px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        .form-title {
            font-size: 19px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #1f2937;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #374151;
        }

        .required {
            color: #dc2626;
        }

        .form-control {
            width: 100%;
            height: 42px;
            padding: 10px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            background-color: white;
        }

        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37,99,235,0.10);
        }

        .button-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e5e7eb;
        }

        .add-button {
            display: inline-block;
            padding: 11px 22px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .add-button:hover {
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
            text-decoration: none;
            font-size: 14px;
        }

        .back-button:hover {
            background-color: #e5e7eb;
        }

        @media screen and (max-width: 768px) {

            .container {
                width: 95%;
                margin: 20px auto;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-card {
                padding: 20px;
            }

            .add-button,
            .back-button {
                width: 100%;
                text-align: center;
                margin: 5px 0;
            }

        }

    </style>

</head>

<body>

    <div class="container">

        <div class="page-header">

            <h2>Add Employee</h2>

            <p>
                Enter the employee details to create a new employee record.
            </p>

        </div>

        <div class="form-card">

            <div class="form-title">
                Employee Information
            </div>

            <form method="post"
                  action="/Employee/Create">

                <div class="form-grid">

                    <!-- Employee Name -->

                    <div class="form-group">

                        <label>
                            Employee Name
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="EmployeeName"
                               class="form-control"
                               placeholder="Enter employee name"
                               required />

                    </div>


                    <!-- Email -->

                    <div class="form-group">

                        <label>
                            Email
                            <span class="required">*</span>
                        </label>

                        <input type="email"
                               name="Email"
                               class="form-control"
                               placeholder="Enter email address"
                               required />

                    </div>


                    <!-- Mobile -->

                    <div class="form-group">

                        <label>
                            Mobile
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="MobileNumber"
                               class="form-control"
                               placeholder="Enter mobile number"
                               required />

                    </div>


                    <!-- Department -->

                    <div class="form-group">

                        <label>
                            Department
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="Department"
                               class="form-control"
                               placeholder="Enter department"
                               required />

                    </div>


                    <!-- Designation -->

                    <div class="form-group">

                        <label>
                            Designation
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="Designation"
                               class="form-control"
                               placeholder="Enter designation"
                               required />

                    </div>


                    <!-- Date Of Joining -->

                    <div class="form-group">

                        <label>
                            Date Of Joining
                            <span class="required">*</span>
                        </label>

                        <input type="date"
                               name="DateOfJoining"
                               class="form-control"
                               required />

                    </div>


                    <!-- Salary -->

                    <div class="form-group">

                        <label>
                            Salary
                            <span class="required">*</span>
                        </label>

                        <input type="number"
                               name="Salary"
                               class="form-control"
                               placeholder="Enter salary"
                               step="0.01"
                               required />

                    </div>


                    <!-- Status -->

                    <div class="form-group">

                        <label>
                            Status
                            <span class="required">*</span>
                        </label>

                        <select name="Status"
                                class="form-control">

                            <option value="Active">
                                Active
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>

                </div>


                <!-- Buttons -->

                <div class="button-section">

                    <button type="submit"
                            class="add-button">
                        + Add Employee
                    </button>

                    <a href="/Employee/Index"
                       class="back-button">
                        ← Back to List
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>