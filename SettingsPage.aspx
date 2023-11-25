<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SettingsPage.aspx.cs" Inherits="EngineeringClubHR.SettingsPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .holiday-grid th, .holiday-grid td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .holiday-grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .holiday-grid tr:hover {
            background-color: #ddd;
        }

        .holiday-grid th {
            padding-top: 12px;
            padding-bottom: 12px;
            background-color: #007BFF; /* Adjusted to Bootstrap's primary blue */
            color: white;
        }

        .input[type="radio"] {
            border: none;
            outline: none;
        }
    </style>
    <main aria-labelledby="title">
        <h1 class="text-dark my-3 text-center">
            <img src="Pictures/New Icons/technology.png" style="width: 50px; height: 50px; margin-right: 20px;" />Settings
        </h1>
        <div class="container leaveCon mb-5">
            <h4 for="leaveType">Leave Type:</h4>
            <div class="row">
                <div class="col-md-4">
                    <asp:DropDownList ID="DDLleaveType" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-8">
                    <button type="button" class="btn btn-success" id="addLeaveBtn" data-toggle="modal" data-target="#leaveForm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
                    </button>
                </div>
                <div class="col-md-2 col-sm-6">
                    <asp:Button runat="server" ID="deleteLeaveBtn" CssClass="btn btn-danger" Text="Delete Leave Type" OnClick="deleteLeaveBtn_Click" />
                </div>
            </div>
            <section class="modal" id="leaveForm">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Enter new leave type</h3>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">&times;</button>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="txtNewLeaveType" runat="server" CssClass="form-control" placeholder="New Leave Type"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="addingLeaveBtn" CssClass="btn btn-primary" Text="Add Leave Type" OnClick="addingLeaveBtn_Click" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- New Public Holiday Section -->
        <div class="container holidayCon">
            <h4 for="holiday">Public Holidays:</h4>
            <asp:GridView ID="HolidayGridView" runat="server" AutoGenerateColumns="False"
                CssClass="holiday-grid"
                DataKeyNames="HolidayName"
                OnRowEditing="HolidayGridView_RowEditing"
                OnRowUpdating="HolidayGridView_RowUpdating"
                OnRowCancelingEdit="HolidayGridView_RowCancelingEdit"
                OnRowDeleting="HolidayGridView_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="HolidayName" HeaderText="Holiday Name" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("HolidayDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("HolidayDate","{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <button type="button" class="btn btn-success mt-3" id="addHolidayBtn" data-toggle="modal" data-target="#holidayForm">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                </svg>
            </button>
            <section class="modal" id="holidayForm">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Enter new public holiday</h3>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">&times;</button>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="txtNewHoliday" runat="server" CssClass="form-control" placeholder="New Holiday"></asp:TextBox>
                            <asp:TextBox ID="txtHolidayDate" runat="server" CssClass="form-control" placeholder="Date (YYYY-MM-DD)" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="addingHolidayBtn" CssClass="btn btn-primary" Text="Add Holiday" OnClick="addingHolidayBtn_Click" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div class="container promotionCon mb-5">
            <h4 for="promotion">Promotion and Demotion:</h4>
            <div class="row">
                <div class="col-md-4">
                    <asp:DropDownList ID="DDLEmployeeToPromote" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-8">
                    <asp:Button runat="server" ID="promoteBtn" CssClass="btn btn-success" Text="Promote to Manager" OnClick="promoteBtn_Click" />
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="DDLManagerToDemote" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-8">
                    <asp:Button runat="server" ID="demoteBtn" CssClass="btn btn-danger" Text="Demote to Employee" OnClick="demoteBtn_Click" />
                </div>
            </div>
        </div>
        <div style="margin: 20px;">
            <h2>Employee Manager Assignment</h2>
            <asp:Repeater ID="rptEmployees" runat="server">
                <HeaderTemplate>
                    <table style="width: 100%; border-collapse: collapse; background-color: aliceblue" class="table table-striped table-bordered table-hover">
                        <tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <td style="border: 1px solid #ccc; padding: 10px;">
                        <asp:RadioButton ID="rbSelectEmployee" runat="server" GroupName="Employees" />
                        <span style="margin-left: 10px;"><%# Eval("firstName") %></span>
                    </td>
                    <%# (Container.ItemIndex + 1) % 4 == 0 ? "</tr><tr>" : "" %>
                    <asp:HiddenField ID="HiddenFieldEmployeeId" runat="server" Value='<%# Eval("employeeID") %>' />
                </ItemTemplate>
                <FooterTemplate>
                    </tr>
            </table>
                </FooterTemplate>
            </asp:Repeater>

            &nbsp;&nbsp;<br />
            <div class="container ManagersCon mb-5">
                <h4 for="ddlManagers">Select Manager:</h4>
                <div class="row">
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlManagers" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-2 col-sm-6">
                        <asp:Button ID="btnAssign" runat="server" Text="Assign Manager" OnClick="btnAssign_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
        <div class="container genderCon mb-5">
            <h4 for="gender">Manage Genders:</h4>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtNewGender" runat="server" CssClass="form-control" Placeholder="Enter new gender"></asp:TextBox>
                </div>
                <!-- Button to add a new gender -->
                <div class="col-md-2 col-sm-8">
                    <asp:Button runat="server" ID="btnAddGender" CssClass="btn btn-success" Text="Add Gender" OnClick="btnAddGender_Click" />
                </div>
                <!-- Dropdown to pull existing genders -->
                <div class="col-md-4">
                    <asp:DropDownList ID="DDLExistingGenders" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <!-- Button to delete a selected gender -->
                <div class="col-md-2 col-sm-8">
                    <asp:Button runat="server" ID="btnDeleteGender" CssClass="btn btn-danger" Text="Delete Gender" OnClick="btnDeleteGender_Click" />
                </div>
                <!-- Text field to enter a new gender -->

            </div>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label alert alert-danger d-none" Visible="false"></asp:Label>
    </main>
</asp:Content>
