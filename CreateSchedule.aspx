<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateSchedule.aspx.cs" Inherits="EngineeringClubHR.CreateSchedule" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="calendarButtons">
        <div class="row align-items-center">
            <div class="col"></div>
            <div class="col-auto d-flex justify-content-end">
                <div class="btn-group" role="group" aria-label="ButtonsCalendarView">
                    <a href="SchedulingWeekView.aspx" class="btn btn-secondary">Weeks</a>
                    <a href="CalendarMonths.aspx" class="btn btn-secondary">Months</a>
                </div>
            </div>
        </div>
    </div>

    <div class="row gx-3 gy-2 align-items-center">
        <div class="col-lg-8 offset-lg-3">
        <h1 class="text-dark my-3 text-center">
            <img src="Pictures/New Icons/calendar.png" style="width: 50px; height: 50px; margin-right: 20px;" />Create Event
        </h1>
            <div class="m-3 lg-2">
                <label for="Task description" style="font-weight: bold; font-size: 16px;">Task Description:</label>
                <asp:TextBox ID="txtEventText" runat="server" placeholder="Task Description" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEventText" ControlToValidate="txtEventText" ErrorMessage="Task Description is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="m-3">
                <label for="Client Drop Down" style="font-weight: bold; font-size: 16px;">Select Client:</label>
                <asp:DropDownList ID="DropDownClient" OnSelectedIndexChanged="DropDownClient_SelectedIndexChanged" runat="server" required="true" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvClient" ControlToValidate="DropDownClient" InitialValue="" ErrorMessage="Client selection is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="m-3">
                <label for="Employee Drop Down" style="font-weight: bold; font-size: 16px;">Select Employee:</label>
                <asp:DropDownList ID="DropDownEmployee" OnSelectedIndexChanged="DropDownEmployee_SelectedIndexChanged" runat="server" required="true" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEmployee" ControlToValidate="DropDownEmployee" InitialValue="" ErrorMessage="Employee selection is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="m-3">
                <div class="row">
                    <div class="col-md-4 form-group">
                        <label for="TxtStartDateCalendar" class="font-weight-bold font-size-16">Start date:</label>
                        <asp:TextBox ID="TxtStartDateCalendar" runat="server" CssClass="form-control mb-3" Placeholder="Start date" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStartDate" ControlToValidate="TxtStartDateCalendar" ErrorMessage="Start date is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="TxtStartTimeCalendar" class="font-weight-bold font-size-16">Start time:</label>
                        <asp:TextBox ID="TxtStartTimeCalendar" runat="server" CssClass="form-control mb-3" Placeholder="Start time" TextMode="Time"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStartTime" ControlToValidate="TxtStartTimeCalendar" ErrorMessage="Start time is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="m-3">
                <div class="row">
                    <div class="col-md-4 form-group">
                        <label for="TxtEndDateCalendar" class="font-weight-bold font-size-16">End date:</label>
                        <asp:TextBox ID="TxtEndDateCalendar" runat="server" CssClass="form-control mb-3" Placeholder="End date" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEndDate" ControlToValidate="TxtEndDateCalendar" ErrorMessage="End date is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="TxtEndTimeCalendar" class="font-weight-bold font-size-16">End time:</label>
                        <asp:TextBox ID="TxtEndTimeCalendar" runat="server" CssClass="form-control mb-3" Placeholder="End time" TextMode="Time"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEndTime" ControlToValidate="TxtEndTimeCalendar" ErrorMessage="End time is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="m-3">
        <asp:Button ID="btnAddEvent" runat="server" Text="Add Event" OnClick="btnAddEvent_Click" CssClass="btn btn-primary" />
    </div>


    <div class="m-3">
        <h2 class="text-dark my-2 col-12">Event List</h2>
        <div class="card">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="scheduleID"
                OnRowDeleting="GridView1_RowDeleting"
                CssClass="table table-striped table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="scheduleID" ReadOnly="true" ItemStyle-CssClass="d-none d-md-table-cell" />
                    <asp:BoundField DataField="taskDescription" HeaderText="Event Description" ItemStyle-CssClass="d-none d-md-table-cell" />
                    <asp:BoundField DataField="startDate" HeaderText="From" ItemStyle-CssClass="d-none d-md-table-cell" />
                    <asp:BoundField DataField="endDate" HeaderText="To" ItemStyle-CssClass="d-none d-md-table-cell" />
                    <asp:CommandField ShowDeleteButton="true" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-danger btn-sm" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
