<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageLeave.aspx.cs" Inherits="EngineeringClubHR.ManageLeave" Async="true" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .imageButtonStyle {
            padding: 30px;
            height: 100px;
            width: 100px;
        }

        .colorBlindFriendly {
            background-color: #FCFCFC;
            color: #000;
        }

            .colorBlindFriendly .btn-primary {
                background-color: #000;
                border-color: #000;
                color: #FFF; /* Text color */
            }

            .colorBlindFriendly .btn-info {
                background-color: #333;
                border-color: #333;
                color: #FFF;
            }

            .colorBlindFriendly .card {
                background-color: #EEE;
                color: #333;
            }

            .colorBlindFriendly .card-body {
                background-color: #DDD;
            }

            .colorBlindFriendly .form-control {
                background-color: #FFF;
                color: #000;
            }

            .colorBlindFriendly h1, .colorBlindFriendly h2, .colorBlindFriendly h4, .colorBlindFriendly h6 {
                color: #000;
            }

            .colorBlindFriendly .input-group-text {
                background-color: #333;
                color: #FFF;
            }

            .colorBlindFriendly .fas.fa-search {
                color: #FFF;
            }
    </style>
    <script type="text/javascript">
        function toggleColorBlindFriendly() {
            const body = document.querySelector('body');
            if (body.classList.contains('colorBlindFriendly')) {
                body.classList.remove('colorBlindFriendly');
            } else {
                body.classList.add('colorBlindFriendly');
            }
        }
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <div class="container text-center mt-5">
        <div class="row">
            <div class="col">
                <h1 class="text-dark my-3 text-center">
                    <img src="Pictures/New Icons/leave.png" style="width: 50px; height: 50px; margin-right: 20px;" />ManageLeave

                </h1>
            </div>
        </div>
        <div class="buttonsforbtns mb-5">
            <div class="row align-items-center">
                <div class="col-auto">
                    <asp:Button Text="Toggle Colorblind Friendly" ID="Button1" CssClass="btn btn-info btn-block btn-lg" runat="server" OnClientClick="toggleColorBlindFriendly(); return false;" />
                </div>
                <div class="col"></div>
                <div class="col-auto d-flex justify-content-end">
                    <div class="btn-group" role="group" aria-label="ButtonsPages">
                        <a href="TeamPage.aspx" class="btn btn-primary">Open Chat</a>
                        <a href="CreateLeave.aspx" class="btn btn-primary">Add Leave</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col">
            <div class="input-group">
                <asp:TextBox ID="searchBar" class="form-control" placeholder="Search for a Leave Request..." runat="server" AutoPostBack="True" OnTextChanged="searchBar_TextChanged" />
                <button type="button" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
                </button>
            </div>
        </div>
        <div class="row mt-5">
            <h2 class="w-100 text-center">Outstanding Leave</h2>
            <asp:Repeater ID="OutstandingLeaveRepeater" runat="server" OnItemDataBound="OutstandingLeaveRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                        <div class="card border-info">
                            <div class="card-header bg-info text-white">
                                <h4 class="card-title"><%# Eval("EmployeeName") %></h4>
                            </div>
                            <div class="card-body">
                                <h6 class="font-weight-bold text-uppercase mt-4">Leave Information</h6>
                                <h6 class="font-weight-bold text-uppercase mt-4">Start</h6>
                                <p class="card-text"><%# ((DateTime)Eval("LeaveStart")).ToString("dd MMMM yyyy") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">End</h6>
                                <p class="card-text"><%# ((DateTime)Eval("LeaveEnd")).ToString("dd MMMM yyyy") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Total Working Days</h6>
                                <p class="card-text"><%# Eval("TotalDays") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Type</h6>
                                <p class="card-text"><%# Eval("LeaveType") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Status</h6>
                                <p class="card-text"><%# Eval("Status") %></p>
                                <%--                                <h6 class="font-weight-bold text-uppercase mt-4">Manager</h6>
                                <p class="card-text"><%# Eval("approverName") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Comments</h6>
                                <p class="card-text"><%# Eval("comments") %></p>--%>
                            </div>

                            <div>
                                <asp:ImageButton ID="BtnApprove" runat="server" ImageUrl="~/Pictures/Icons/check.png" OnClick="BtnApprove_Click" Visible='<%# Eval("Status").ToString() != "Approved" %>' CssClass="imageButtonStyle" />
                                <asp:ImageButton ID="BtnReject" runat="server" ImageUrl="~/Pictures/Icons/cross.png" OnClick="BtnReject_Click" Visible='<%# Eval("Status").ToString() != "Rejected" %>' CssClass="imageButtonStyle" />
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/Pictures/Icons/edit.png" OnClick="BtnEdit_Click" CssClass="imageButtonStyle" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row mt-5">
            <h2 class="w-100 text-center">Leave History</h2>
            <asp:Repeater ID="LeaveHistoryRepeater" runat="server" OnItemDataBound="OutstandingLeaveRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                        <div class="card border-info">
                            <div class="card-header bg-info text-white">
                                <h4 class="card-title"><%# Eval("EmployeeName") %></h4>
                            </div>
                            <div class="card-body">
                                <h6 class="font-weight-bold text-uppercase mt-4">Leave Information</h6>
                                <h6 class="font-weight-bold text-uppercase mt-4">Start</h6>
                                <p class="card-text"><%# ((DateTime)Eval("LeaveStart")).ToString("dd MMMM yyyy") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">End</h6>
                                <p class="card-text"><%# ((DateTime)Eval("LeaveEnd")).ToString("dd MMMM yyyy") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Total Working Days</h6>
                                <p class="card-text"><%# Eval("TotalDays") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Type</h6>
                                <p class="card-text"><%# Eval("LeaveType") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Status</h6>
                                <p class="card-text"><%# Eval("Status") %></p>
                                <%--                                <h6 class="font-weight-bold text-uppercase mt-4">Manager</h6>
                                <p class="card-text"><%# Eval("approverName") %></p>
                                <h6 class="font-weight-bold text-uppercase mt-4">Comments</h6>
                                <p class="card-text"><%# Eval("comments") %></p>--%>
                            </div>
                            <div>
                                <asp:ImageButton ID="BtnApprove" runat="server" ImageUrl="~/Pictures/Icons/arrow-up.png" OnClick="BtnApprove_Click" Visible="false" />
                                <asp:ImageButton ID="BtnReject" runat="server" ImageUrl="~/Pictures/Icons/arrow-up.png" OnClick="BtnReject_Click" Visible="false" />
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/Pictures/Icons/edit.png" OnClick="BtnEdit_Click" CssClass="imageButtonStyle" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
