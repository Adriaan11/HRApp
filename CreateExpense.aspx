<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CreateExpense.aspx.cs" Inherits="EngineeringClubHR.CreateExpense" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form-container {
            max-width: 500px;
            margin: auto;
        }

        .form-label {
            font-weight: bold;
        }
    </style>
    <div class="container mt-5">
        <div class="row">
            <div class="col">
                        <h1 class="text-dark my-3 text-center">
            <img src="Pictures/New Icons/expenses.png" style="width: 50px; height: 50px; margin-right: 20px;" />Create Expense
        </h1>
                <div class="form-container">
                    <!-- Label to display messages -->
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-success" />

                    <!-- DropDownList for Employees -->
                    <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="form-control mb-3"></asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="rfvEmployees"
                        ControlToValidate="ddlEmployees"
                        InitialValue=""
                        ErrorMessage="Employee selection is required"
                        runat="server"
                        ForeColor="Red" />

                    <!-- TextBox for Expense Description -->
                    <asp:TextBox ID="txtExpenseDescription" runat="server" CssClass="form-control mb-3" Placeholder="Expense Description"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvExpenseDescription"
                        ControlToValidate="txtExpenseDescription"
                        ErrorMessage="Expense Description is required"
                        runat="server"
                        ForeColor="Red" />

                    <!-- TextBox for Amount -->
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control mb-3" Placeholder="Amount"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvAmount"
                        ControlToValidate="txtAmount"
                        ErrorMessage="Amount is required"
                        runat="server"
                        ForeColor="Red" />
                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator21"
                        ControlToValidate="txtAmount"
                        ErrorMessage="Only numbers allowed"
                        ValidationExpression="^[0-9.,]+$"
                        runat="server"
                        Display="Dynamic"
                        ForeColor="Red" />


                    <!-- TextBox for Expense Date -->
                    <asp:TextBox ID="txtExpenseDate" runat="server" CssClass="form-control mb-3" Placeholder="Expense Date" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvExpenseDate"
                        ControlToValidate="txtExpenseDate"
                        ErrorMessage="Expense Date is required"
                        runat="server"
                        CssClass="text-danger" />

                    <asp:Button ID="btnAddExpense" runat="server" Text="Add Expense" CssClass="btn btn-primary btn-block" OnClick="btnAddExpense_Click" />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    function attachInputValidation() {
        var idNumberTextBox = document.getElementById('<%= txtAmount.ClientID %>');

        if (idNumberTextBox) {
            idNumberTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= rfvAmount.ClientID %>'), true);
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator21.ClientID %>'), true);
            });
        }
    }

    window.onload = function () {
        attachInputValidation();
    };
    </script>
</asp:Content>
