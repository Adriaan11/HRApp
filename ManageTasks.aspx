<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageTasks.aspx.cs" Inherits="EngineeringClubHR.ManageTasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .priority-high {
            background-color: #f8d7da; /* red */
            color: #721c24;
        }

        .priority-medium {
            background-color: #fff3cd; /* yellow */
            color: #856404;
        }

        .priority-low {
            background-color: #d4edda; /* green */
            color: #155724;
        }

        .priority-blue {
            background-color: #b8d8eb; /* blue */
            color: #0c345d;
        }

        .card * {
            color: black;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
            margin: 10px; /* added margin */
            padding: 10px; /* added padding */
        }

            .card:hover {
                box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
            }

        .card-header {
            font-weight: bold;
            font-size: 1.2em;
        }

        .card-body p {
            border-top: 1px solid #ccc;
            padding: 10px 0;
        }

        .fas {
            margin-right: 5px;
        }

        .btn {
            border-radius: 5px;
        }

        .btn-search:before {
            content: "\f002"; /* FontAwesome Search Icon */
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            margin-right: 5px;
        }

        .btn-edit:before {
            content: "\f044"; /* FontAwesome Edit Icon */
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            margin-right: 5px;
        }

        .btn-remove:before {
            content: "\f2ed"; /* FontAwesome Trash Icon */
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            margin-right: 5px;
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
    <div class="container text-center mt-5">
        <div class="row">
            <div class="col">
                <h1 class="text-dark my-3 text-center">
                    <img src="Pictures/New Icons/planning.png" style="width: 50px; height: 50px; margin-right: 20px;" />Engineering Club Tasks
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
                        <a href="CreateClient.aspx" class="btn btn-primary">Create Task</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col">
                <div class="input-group">
                    <asp:TextBox ID="searchBar" class="form-control" placeholder="Search for a Task..." runat="server" AutoPostBack="True" OnTextChanged="searchBar_TextChanged" />
                    <button type="button" class="btn btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-4">
                <h3 class="text-center">High Priority</h3>
                <asp:Repeater ID="HighPriorityTaskRepeater" runat="server" OnItemDataBound="TaskRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="card mb-4 pb-4 priority-high" id="CardDiv" runat="server">
                            <div class="card-body">
                                <h4 class="card-title"><%# Eval("Title") %></h4>
                                <p class="card-text">
                                    <strong>Description:</strong> <%# Eval("Description") %>
                                </p>
                                <p class="card-text">
                                    <strong>Assigned To:</strong> <%# Eval("AssignedTo") %>
                                </p>
                                <p class="card-text">
                                    <strong>Status:</strong> <%# Eval("Status") %>
                                </p>
                                <p class="card-text">
                                    <strong>Client:</strong> <%# Eval("Client") %>
                                </p>
                            </div>
                            <div class="card-footer">
                                <asp:Button Text="Edit Task" ID="EditButton" CssClass="btn btn-primary mr-2 btn-edit" runat="server" OnClick="EditButton_Click" CommandName="Edit" CommandArgument='<%# Eval("TaskID") %>' />
                                <asp:Button Text="Change Status" ID="ChangeStatusButton" CssClass="btn btn-secondary btn-change-status" runat="server" CommandName="ChangeStatus" CommandArgument='<%# Eval("TaskID") %>' OnClientClick="showChangeStatusModal(); return false;" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-4">
                <h3 class="text-center">Medium Priority</h3>
                <asp:Repeater ID="MediumPriorityTaskRepeater" runat="server" OnItemDataBound="TaskRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="card mb-4 pb-4 priority-medium" id="CardDiv" runat="server">
                            <div class="card-body">
                                <h4 class="card-title"><%# Eval("Title") %></h4>
                                <p class="card-text">
                                    <strong>Client:</strong> <%# Eval("Client") %>
                                </p>
                                <p class="card-text">
                                    <strong>Description:</strong> <%# Eval("Description") %>
                                </p>
                                <p class="card-text">
                                    <strong>Assigned To:</strong> <%# Eval("AssignedTo") %>
                                </p>
                                <p class="card-text">
                                    <strong>Status:</strong> <%# Eval("Status") %>
                                </p>
                                <p class="card-text">
                                    <strong>Client:</strong> <%# Eval("Client") %>
                                </p>
                            </div>
                            <div class="card-footer">
                                <asp:Button Text="Edit Task" ID="EditButton" CssClass="btn btn-primary mr-2 btn-edit" runat="server" OnClick="EditButton_Click" CommandName="Edit" CommandArgument='<%# Eval("TaskID") %>' />
                                <asp:Button Text="Change Status" ID="ChangeStatusButton" CssClass="btn btn-secondary btn-change-status" runat="server" CommandName="ChangeStatus" CommandArgument='<%# Eval("TaskID") %>' OnClientClick="showChangeStatusModal(); return false;" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-4">
                <h3 class="text-center">Low Priority</h3>
                <asp:Repeater ID="LowPriorityTaskRepeater" runat="server" OnItemDataBound="TaskRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="card mb-4 pb-4 priority-low" id="CardDiv" runat="server">
                            <div class="card-body">
                                <h4 class="card-title"><%# Eval("Title") %></h4>
                                <p class="card-text">
                                    <strong>Client:</strong> <%# Eval("Client") %>
                                </p>
                                <p class="card-text">
                                    <strong>Description:</strong> <%# Eval("Description") %>
                                </p>
                                <p class="card-text">
                                    <strong>Assigned To:</strong> <%# Eval("AssignedTo") %>
                                </p>
                                <p class="card-text">
                                    <strong>Status:</strong> <%# Eval("Status") %>
                                </p>
                                <p class="card-text">
                                    <strong>Client:</strong> <%# Eval("Client") %>
                                </p>
                            </div>
                            <div class="card-footer">
                                <asp:Button Text="Edit Task" ID="EditButton" CssClass="btn btn-primary mr-2 btn-edit" runat="server" OnClick="EditButton_Click" CommandName="Edit" CommandArgument='<%# Eval("TaskID") %>' />
                                <asp:Button Text="Change Status" ID="ChangeStatusButton" CssClass="btn btn-secondary btn-change-status" runat="server" CommandName="ChangeStatus" CommandArgument='<%# Eval("TaskID") %>' OnClientClick="showChangeStatusModal(); return false;" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="modal fade" id="changeStatusModal" tabindex="-1" role="dialog" aria-labelledby="changeStatusModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="changeStatusModalLabel">Change Status</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="statusButtons">
                            <!-- Add your form or other content here -->
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <h3 class="text-center">Completed</h3>
                <asp:Repeater ID="CompletedTaskRepeater" runat="server" OnItemDataBound="TaskRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="card mb-4 pb-4 priority-blue" id="CardDiv" runat="server">
                            <div class="card-body">
                                <h4 class="card-title"><%# Eval("Title") %></h4>
                                <p class="card-text">
                                    <strong>Client:</strong> <%# Eval("Client") %>
                                </p>
                                <p class="card-text">
                                    <strong>Description:</strong> <%# Eval("Description") %>
                                </p>
                                <p class="card-text">
                                    <strong>Assigned To:</strong> <%# Eval("AssignedTo") %>
                                </p>
                                <p class="card-text">
                                    <strong>Status:</strong> <%# Eval("Status") %>
                                </p>
                                <p class="card-text">
                                    <strong>Client:</strong> <%# Eval("Client") %>
                                </p>
                            </div>
                            <div class="card-footer">
                                <asp:Button Text="Edit Task" ID="EditButton" CssClass="btn btn-primary mr-2 btn-edit" runat="server" OnClick="EditButton_Click" CommandName="Edit" CommandArgument='<%# Eval("TaskID") %>' />
                                <asp:Button Text="Change Status" ID="ChangeStatusButton" CssClass="btn btn-secondary btn-change-status" runat="server" CommandName="ChangeStatus" CommandArgument='<%# Eval("TaskID") %>' OnClientClick="showChangeStatusModal(); return false;" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
