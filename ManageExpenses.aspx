<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ManageExpenses.aspx.cs" Inherits="EngineeringClubHR.ManageExpenses" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .img-size {
            width: 50px;
            height: 50px;
        }

        .buttonContainer {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .manageCard {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
        }

        .btn-approve {
            background-color: #28a745;
            color: white;
            border: none;
        }

        .btn-decline {
            background-color: #dc3545;
            color: white;
            border: none;
        }

        .btn-edit {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            border-collapse: collapse;
        }

            .table th,
            .table td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }

            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }

            .table tbody + tbody {
                border-top: 2px solid #dee2e6;
            }

        .status-approved {
            color: blue;
            font-weight: bold;
            background-color: #e0f7ff; /* Background color for highlighting */
        }

        .status-rejected {
            color: red;
            font-weight: bold;
            background-color: #ffe0e0; /* Background color for highlighting */
        }

        .status-applied {
            font-weight: bold;
            background-color: #e0ffe0; /* Background color for highlighting */
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

            .colorBlindFriendly .manageCard {
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
                    <img src="Pictures/New Icons/expenses.png" style="width: 50px; height: 50px; margin-right: 20px;" />Manage Expenses
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
                        <a href="CreateExpense.aspx" class="btn btn-primary">Create Expense</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col">
                <section class="manageCard">
                    <asp:GridView ID="ExpenseGrid" runat="server" AutoGenerateColumns="false" CssClass="table">
                        <Columns>
                            <asp:BoundField DataField="FullName" HeaderText="Employee" />
                            <asp:BoundField DataField="managerName" HeaderText="Manager" />
                            <asp:BoundField DataField="expenseDescription" HeaderText="Description" />
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# "R " + String.Format("{0:N2}", Eval("amount")) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("FormattedExpenseDate") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnApprove" runat="server" OnClick="btnApprove_Click" CommandArgument='<%# Eval("expenseID") %>'
                                        ImageUrl="~/Pictures/Icons/check.png" CssClass="imageButtonStyle" />
                                    <asp:ImageButton ID="btnDecline" runat="server" OnClick="btnDecline_Click" CommandArgument='<%# Eval("expenseID") %>'
                                        ImageUrl="~/Pictures/Icons/cross.png" CssClass="imageButtonStyle" />
                                    <asp:ImageButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" CommandArgument='<%# Eval("expenseID") %>'
                                        ImageUrl="~/Pictures/Icons/edit.png" CssClass="imageButtonStyle" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </section>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col">
                <h3>Expense History</h3>
                <section class="manageCard">
                    <asp:GridView ID="ExpenseHistoryGrid" runat="server" AutoGenerateColumns="false" CssClass="table">
                        <Columns>
                            <asp:BoundField DataField="FullName" HeaderText="Employee" />
                            <asp:BoundField DataField="expenseDescription" HeaderText="Description" />
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblHistoryAmount" runat="server" Text='<%# "R " + String.Format("{0:N2}", Eval("amount")) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblHistoryDate" runat="server" Text='<%# Eval("FormattedExpenseDate") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="expenseStatusDescription" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
