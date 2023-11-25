<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ManageGrievance.aspx.cs" Inherits="EngineeringClubHR.ManageGrievance" Async="true" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .clickable-row {
            cursor: pointer;
        }

            .clickable-row:hover {
                background-color: #f5f5f5; /* Change this to your desired hover color */
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

    <div class="container text-center mt-5">
        <div class="row">
            <div class="col">
                <h1 class="text-dark my-3 text-center">
                    <img src="Pictures/New Icons/bad.png" style="width: 50px; height: 50px; margin-right: 20px;" />Manage Grievance
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
                        <a href="CreateGrievance.aspx" class="btn btn-primary">Create Grievance</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col">
                <section class="manageCard">
                    <asp:DropDownList ID="DropDownListStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListStatus_SelectedIndexChanged">
                        <asp:ListItem Text="All Statuses" Value="" />
                        <asp:ListItem Text="Submitted" Value="Submitted" />
                        <asp:ListItem Text="Under Review" Value="Under Review" />
                        <asp:ListItem Text="Resolved" Value="Resolved" />
                        <asp:ListItem Text="Dismissed" Value="Dismissed" />
                        <asp:ListItem Text="Escalated" Value="Escalated" />
                    </asp:DropDownList>
                    <asp:CheckBox ID="CheckBoxShowInactive" runat="server" Text="Show Inactive Grievances" AutoPostBack="true" OnCheckedChanged="CheckBoxShowInactive_CheckedChanged" />
                    <asp:GridView ID="GrievanceGrid" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCommand="GrievanceGrid_RowCommand" OnRowDataBound="GrievanceGrid_RowDataBound"
                        AllowSorting="true">
                        <Columns>
                            <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                            <asp:BoundField DataField="GrievanceDescription" HeaderText="Description" />
                            <asp:BoundField DataField="SubmissionDate" HeaderText="Submission Date" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:BoundField DataField="PerpetratorName" HeaderText="Perpetrator" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="grid-row-content" onclick="redirectToView('<%# Eval("GrievanceID") %>');">
                                        <asp:Button ID="EditButton" runat="server" Text="Edit" CommandName="EditGrievance"
                                            CommandArgument='<%# Eval("GrievanceID") %>' CssClass="form-submit" />
                                        <asp:Button ID="AddLogButton" runat="server" Text="Add Log" CommandName="AddLog"
                                            CommandArgument='<%# Eval("GrievanceID") %>' CssClass="form-submit" />
                                        <asp:LinkButton ID="ToggleActiveButton" runat="server" Text='<%# Eval("IsActive", "{0:Active;Not Active}") %>'
                                            CommandName="ToggleActive" CommandArgument='<%# Eval("GrievanceID") %>' CssClass="form-submit" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle CssClass="grid-row" />
                    </asp:GridView>
                    <script type="text/javascript">
                        function redirectToView(grievanceID) {
                            window.location.href = "ViewGrievance.aspx?GrievanceID=" + grievanceID;
                        }
                    </script>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
