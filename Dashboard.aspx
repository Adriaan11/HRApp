<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EngineeringClubHR.Dashboard" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=20.4460.0.44, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Content/ej/web/default-theme/ej.web.all.min.css" rel="stylesheet" />
    <h1 class="text-dark my-3 text-center">
        <img src="Pictures/New Icons/dashboard.png" style="width: 50px; height: 50px; margin-right: 20px;" />Dashboard
    </h1>
    <main class="container text-center mt-5">
        <script src="Scripts/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="Scripts/ej/web/ej.web.all.min.js"></script>
        <script type="text/javascript" src="Scripts/chartUpdate.js"></script>


        <div class="container">
            <div class="row">

                <div class="col-md-8">
                    <h2>Workflow Summary</h2>
                    <ej:Chart ID="SyncfusionChart" runat="server" SeriesType="Column">
                        <Series></Series>
                    </ej:Chart>
                </div>


                <div class="col-md-4">

                    <div class="row">
                        <div class="col-12 mt-5">
                            <h2 class="mb-5">Chart options</h2>
                            <ej:DropDownList ID="optionsDropdown" runat="server" ShowRoundedCorner="true" Width="100%" BackColor="DarkGray">
                                <Items>
                                    <ej:DropDownListItem Text="Filter by manager group by application type" Value="1" Category="FilterData"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Filter by manager group by date" Value="2" Category="Filter Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Filter by employee group by application type" Value="3" Category="Filter Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Filter by employee group by date" Value="4" Category="Filter Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Sort by employees' involvement" Value="5" Category="Sort All Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Sort by managers' involvement" Value="6" Category="Sort All Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Sort by application types" Value="7" Category="Sort All Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Sort by date" Value="8" Category="Sort All Data"></ej:DropDownListItem>
                                </Items>
                            </ej:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mt-5">
                            <ej:Button ID="chartChangeBtn" runat="server" Text="Adjust Graphics" Type="Button" ClientSideOnClick="chartChangeBtn_Click"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Second row-->
            <!-- OUTSTANDING LEAVE -->
            <div class="row">
                <h2 class="mb-5">Outstanding Leave</h2>
                <asp:Repeater ID="OutstandingLeaveRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                            <div class="card border-info">
                                <div class="card-header bg-info text-white">
                                    <h4 class="card-title"><%# Eval("EmployeeName") %></h4>
                                </div>
                                <div class="card-body">
                                    <h6 class="font-weight-bold text-uppercase mt-4">Leave Information</h6>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Start</h6>
                                    <p class="card-text"><%# Eval("LeaveStart") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">End</h6>
                                    <p class="card-text"><%# Eval("LeaveEnd") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Type</h6>
                                    <p class="card-text"><%# Eval("LeaveType") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Status</h6>
                                    <p class="card-text"><%# Eval("Status") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Manager</h6>
                                    <p class="card-text"><%# Eval("approverName") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Comments</h6>
                                    <p class="card-text"><%# Eval("comments") %></p>
                                </div>
                                <div>
                                    <asp:ImageButton ID="BtnApprove" runat="server" ImageUrl="~/Pictures/Icons/check.png" Visible='<%# Eval("Status").ToString() != "Approved" %>' CssClass="imageButtonStyle" CommandName="Approve" CommandArgument='<%# Eval("leaveID") %>' OnCommand="LeaveRowCommand" />
                                    <asp:ImageButton ID="BtnReject" runat="server" ImageUrl="~/Pictures/Icons/cross.png" Visible='<%# Eval("Status").ToString() != "Rejected" %>' CssClass="imageButtonStyle" CommandName="Reject" CommandArgument='<%# Eval("leaveID") %>' OnCommand="LeaveRowCommand" />
                                    <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/Pictures/Icons/edit.png" CssClass="imageButtonStyle" CommandName="Edit" CommandArgument='<%# Eval("leaveID") %>' OnCommand="LeaveRowCommand" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- Third row-->
            <!-- GRIEVANCES -->
            <div class="row">
                <h2 class="mb-5">Actionable Grievances</h2>

                <div class="d-flex align-items-center justify-content-center mb-4">
                    <ej:Button ID="GrievancesPreviousBtn" runat="server" Text="Previous" Type="Button" OnClick="GrievancePrevious"></ej:Button>
                    <ej:Button ID="GrievancesNextBtn" runat="server" Text="Next" Type="Button" OnClick="GrievanceNext"></ej:Button>
                </div>

                <asp:Repeater ID="GrievancesRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                            <div class="card border-info">
                                <div class="card-header bg-info text-white">
                                    <h4 class="card-title"><%# Eval("EmployeeName") %></h4>
                                </div>
                                <div class="card-body">
                                    <h6 class="font-weight-bold text-uppercase mt-4">Grievance Information</h6>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Description</h6>
                                    <p class="card-text"><%# Eval("GrievanceDescription") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Submission Date</h6>
                                    <p class="card-text"><%# Eval("SubmissionDate") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Status</h6>
                                    <p class="card-text"><%# Eval("Status") %></p>
                                    <h6 class="font-weight-bold text-uppercase mt-4">Perpetrator</h6>
                                    <p class="card-text"><%# Eval("PerpetratorName") %></p>
                                </div>
                                <div>
                                    <asp:Button ID="EditButton" runat="server" Text="Edit" CommandName="EditGrievance"
                                        CommandArgument='<%# Eval("GrievanceID") %>' OnCommand="GrievanceRowCommand" CssClass="form-submit mb-2" />
                                    <asp:Button ID="AddLogButton" runat="server" Text="Add Log" CommandName="AddLog"
                                        CommandArgument='<%# Eval("GrievanceID") %>' OnCommand="GrievanceRowCommand" CssClass="form-submit mb-2" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>


            <!-- Fourth row-->
            <!-- PAYROLL -->

            <div class="row">
                <div class="col-md-8">
                    <h2>Payroll Summary</h2>
                    <ej:Chart ID="PayrollChart" runat="server" Theme="Bootstrap">
                        <Series></Series>
                    </ej:Chart>
                </div>


                <div class="col-md-4">

                    <div class="row">
                        <div class="col-12 mt-5">
                            <h2 class="mb-5">Pay Period</h2>
                            <ej:DropDownList ID="PayrollDateDropdown" runat="server" ShowRoundedCorner="true" Width="100%" BackColor="DarkGray">
                            </ej:DropDownList>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 mt-15">
                            <h2 class="mb-5">Chart options</h2>
                            <ej:DropDownList ID="PayrollDropdown" runat="server" ShowRoundedCorner="true" Width="100%" BackColor="DarkGray">
                                <Items>
                                    <ej:DropDownListItem Text="Total Hours" Value="1" Category="FilterData"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Total Overtime hours" Value="2" Category="Filter Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Overtime pay (R)" Value="3" Category="Filter Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Gross pay (R)" Value="4" Category="Filter Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Additions (R)" Value="5" Category="Sort All Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Deductions (R)" Value="6" Category="Sort All Data"></ej:DropDownListItem>
                                    <ej:DropDownListItem Text="Net Pay (R)" Value="7" Category="Sort All Data"></ej:DropDownListItem>
                                </Items>
                            </ej:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mt-5">
                            <ej:Button ID="Button1" runat="server" Text="Adjust Graphics" Type="Button" ClientSideOnClick="chartChangeBtn2_Click"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>


        </div>


    </main>
</asp:Content>
