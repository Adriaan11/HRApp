<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ManageEmployee.aspx.cs" Inherits="EngineeringClubHR.ManageEmployee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .img-size {
            width: 50%; /* Change the size as per your requirement */
            height: auto;
        }

        .buttonContainer {
            display: flex;
            justify-content: center; /* aligns the flex container's contents to the center */
            align-items: center;
        }

        .imageButtonStyle {
            margin-left: 10px; /* Adds some space between the buttons */
            height: 50px; /* Modify this to adjust the height of your image */
            width: 50px; /* Modify this to adjust the width of your image */
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

        .btn-status-change {
            background-color: #007bff; /* Blue background */
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 16px;
            font-size: 16px;
            padding: 12px 24px;
        }

        .colorBlindFriendly .btn-status-change {
            background-color: #333;
            border-color: #333;
            color: #FFF;
        }
    </style>
    <!-- jQuery first, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
    <script type="text/javascript">
        function openModal() {
            $('#changeStatusModal').modal('show');
        }
    </script>
    <div class="container text-center mt-5">
        <div class="row">
            <div class="col">
                <h1 class="text-dark my-3 text-center">
                    <img src="Pictures/New Icons/employee.png" style="width: 50px; height: 50px; margin-right: 20px;" />Engineering Club Employees
                </h1>
            </div>
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
                    <a href="CreateEmployee.aspx" class="btn btn-primary">Create Employee</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col">
            <div class="input-group">
                <asp:TextBox ID="searchBar" class="form-control" placeholder="Search for a client..." runat="server" AutoPostBack="True" OnTextChanged="searchBar_TextChanged" />
                <button type="button" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
                </button>
            </div>
        </div>

        <div class="row mt-5">
            <h2 class="w-100 text-center">Active Employees</h2>
            <asp:Repeater ID="ActiveEmployeeRepeater" runat="server" OnItemDataBound="EmployeeRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-center"><%# Eval("empName") %> <%# Eval("empLastName") %></h4>
                                <h6 class="text-center">Contact Information</h6>
                                <p class="card-text text-center">
                                    <a href="mailto:<%# Eval("empEmail") %>"><%# Eval("empEmail") %></a>
                                    <br />
                                    <%# Eval("empPhone") %>
                                </p>
                                <h6 class="text-center">Manager</h6>
                                <p class="card-text text-center">
                                    <%# Eval("empManager") %>
                                </p>
                                <div class="buttonContainer">
                                    <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/Pictures/Icons/edit.png" CommandName="Edit" OnClick="EditButton_Click" CommandArgument='<%# Eval("empID") %>' />
                                    <asp:ImageButton ImageUrl="~/Pictures/Icons/on-button.png" ID="RemoveButton" CssClass="imageButtonStyle" runat="server" CommandName="Remove" OnClick="RemoveButton_Click" CommandArgument='<%# Eval("empID") %>' />
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <asp:Button Text="Change Employment Type" ID="ChangeStatusButton" CssClass="btn btn-outline-secondary" runat="server" CommandName="ChangeStatus" OnClick="ChangeStatusButton_Click" CommandArgument='<%# Eval("empID") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row mt-5">
            <h2 class="w-100 text-center">Inactive Employees</h2>
            <asp:Repeater ID="InactiveEmployeeRepeater" runat="server" OnItemDataBound="EmployeeRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-center"><%# Eval("empName") %> <%# Eval("empLastName") %></h4>
                                <h6 class="text-center">Contact Information</h6>
                                <p class="card-text text-center">
                                    <a href="mailto:<%# Eval("empEmail") %>"><%# Eval("empEmail") %></a>
                                    <br />
                                    <%# Eval("empPhone") %>
                                </p>
                                <h6 class="text-center">Manager</h6>
                                <p class="card-text text-center">
                                    <%# Eval("empManager") %>
                                </p>
                                <div class="buttonContainer">
                                    <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/Pictures/Icons/edit.png" CommandName="Edit" OnClick="EditButton_Click" CommandArgument='<%# Eval("empID") %>' />
                                    <asp:ImageButton ImageUrl="~/Pictures/Icons/off-button.png" ID="RemoveButton" CssClass="imageButtonStyle" runat="server" CommandName="Remove" OnClick="RemoveButton_Click" CommandArgument='<%# Eval("empID") %>' />
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <asp:Button Text="Change Employment Type" ID="ChangeStatusButton" CssClass="btn btn-outline-secondary" runat="server" CommandName="ChangeStatus" OnClick="ChangeStatusButton_Click" CommandArgument='<%# Eval("empID") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="changeStatusModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Change Employment Status</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="CurrentStatusLabel" runat="server" Text="Current Status: "></asp:Label>
                        <asp:Label ID="CurrentStatusValueLabel" runat="server"></asp:Label>
                        <br />
                        <asp:DropDownList ID="NewStatusDropDown" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Full-Time">Full-Time</asp:ListItem>
                            <asp:ListItem Value="Part-Time">Part-Time</asp:ListItem>
                        </asp:DropDownList>
                        <asp:HiddenField ID="SelectedEmployeeID" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="SaveChangesButton" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="SaveChangesButton_Click" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
