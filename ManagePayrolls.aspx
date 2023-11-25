<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ManagePayrolls.aspx.cs" Inherits="EngineeringClubHR.ManagePayrolls" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main class="container my-5">

        <!-- Header Section -->
        <div class="text-center mb-4">
            <h1 class="text-dark my-3 text-center">
                <img src="Pictures/New Icons/payroll.png" style="width: 50px; height: 50px; margin-right: 20px;" />Manage Payroll
            </h1>
        </div>

        <!-- Edit Payroll Card -->
        <div class="card mt-4 mb-4" id="editPayroll">
            <div class="card-header bg-light">
                <h3>Edit Employee Payroll Hours</h3>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <h5>Select Month and Year</h5>
                    <div>
                        <asp:DropDownList ID="empHoursMonthDropdown" runat="server"></asp:DropDownList>
                        <asp:DropDownList ID="empHoursYearDropdown" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <!-- Employee Selection -->
                <div class="form-group">
                    <label for="employeeList">Select Employee:</label>
                    <asp:DropDownList ID="employeeList" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <!-- Load Payroll Details Button -->
                <div class="mb-3">
                    <asp:Button Text="Load Employee Hours" ID="LoadButton" CssClass="btn btn-info" runat="server" OnClick="LoadButton_Click" />
                </div>

                <!-- Worked Hours Input -->
                <div class="form-group">
                    <label for="totalHoursWorked">Total Hours Worked:</label>
                    <asp:TextBox ID="totalHoursWorked" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <!-- Overtime Input -->
                <div class="form-group">
                    <label for="totalOvertimeWorked">Total Overtime Worked:</label>
                    <asp:TextBox ID="totalOvertimeWorked" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <!-- Save Changes Button -->
                <div>
                    <asp:Button Text="Save Changes" ID="SaveButton" CssClass="btn btn-success" runat="server" OnClick="SaveButton_Click" />
                </div>
            </div>
        </div>

        <!-- Payroll Actions Panel -->
        <div class="card mb-4">
            <div class="card-header bg-light">
                <h3>Payroll Actions</h3>
            </div>
            <div class="card-body d-flex justify-content-between">
                <div>
                    <asp:Button Text="Generate Payroll" ID="ButtonGeneratePayroll" CssClass="btn btn-primary mx-2" runat="server" OnClick="ButtonGeneratePayroll_Click" />
                    <asp:Button Text="Export to Excel" ID="BUTTEXPORTEXCEL" CssClass="btn btn-warning mx-2" runat="server" OnClick="BUTTEXPORTEXCEL_Click" />
                    <asp:Button Text="Load Payroll Details" ID="ButtonLoadPayroll" CssClass="btn btn-info" runat="server" OnClick="ButtonLoadPayroll_Click" />
                    <asp:Button Text="Delete Payroll" ID="ButtonDeletePayroll" CssClass="btn btn-danger mx-2" runat="server" OnClick="ButtonDeletePayroll_Click" />

                </div>
                <div>
                    <asp:DropDownList ID="MonthDropDownList" runat="server"></asp:DropDownList>
                    <asp:DropDownList ID="YearDropDownList" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Payrolls Card -->
        <div class="card mt-4" id="managePayrolls">
            <div class="card-header bg-light">
                <h3>Payroll Overview</h3>
            </div>
            <div class="card-body">
                <asp:ListView ID="PayrollListView" runat="server">
                    <LayoutTemplate>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Employee</th>
                                    <th>Pay Period</th>
                                    <th>Total Hours Worked</th>
                                    <th>Total Overtime Worked</th>
                                    <th>Overtime Pay</th>
                                    <th>Gross Pay</th>
                                    <th>Net Pay</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("employeeName") %></td>
                            <td><%# System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName((int)Eval("payPeriodStart")) %></td>
                            <td><%# Eval("totalHoursWorked") %></td>
                            <td><%# Eval("totalOvertimeWorked") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "overtimePay", "{0:C}") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "grossPay", "{0:C}") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "netPay", "{0:C}") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </main>
</asp:Content>
