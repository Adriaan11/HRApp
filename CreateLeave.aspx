<%@ Page Title="Create Leave" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateLeave.aspx.cs" Inherits="EngineeringClubHR.CreateLeave" Async="true" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main class="mainContent container-fluid">
        <h1 class="text-dark my-3 text-center">
            <img src="Pictures/New Icons/leave.png" style="width: 50px; height: 50px; margin-right: 20px;" />Create Leave
        </h1>
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-8">
                <div class="row">
                    <!-- Employee Selection -->
                    <div class="col-md-6 form-group">
                        <label for="employeeID" style="font-weight: bold; font-size: 16px;">Employee:</label>
                        <asp:DropDownList ID="DDLemployee" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvEmployee"
                            ControlToValidate="DDLemployee"
                            InitialValue=""
                            ErrorMessage="Employee selection is required"
                            runat="server"
                            CssClass="text-danger" />
                    </div>
                    <!-- Leave Type -->
                    <div class="col-md-6 form-group">
                        <label for="leaveType" style="font-weight: bold; font-size: 16px;">Leave Type:</label>
                        <asp:DropDownList ID="DDLleaveType" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvLeaveType"
                            ControlToValidate="DDLleaveType"
                            InitialValue=""
                            ErrorMessage="Leave type is required"
                            runat="server"
                            CssClass="text-danger" />
                    </div>
                    <!-- Start Date -->
                    <div class="col-md-6 form-group">
                        <label for="startDate" style="font-weight: bold; font-size: 16px;">Start Date:</label>
                        <asp:TextBox ID="TextBoxstartDate" runat="server" CssClass="form-control mb-3" Placeholder="Expense Date" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvStartDate"
                            ControlToValidate="TextBoxstartDate"
                            ErrorMessage="Start Date is required"
                            runat="server"
                            CssClass="text-danger" />
                    </div>
                    <!-- End Date -->
                    <div class="col-md-6 form-group">
                        <label for="endDate" style="font-weight: bold; font-size: 16px;">End Date:</label>
                        <asp:TextBox ID="TxtendDate" runat="server" CssClass="form-control mb-3" Placeholder="Expense Date" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvEndDate"
                            ControlToValidate="TxtendDate"
                            ErrorMessage="End Date is required"
                            runat="server"
                            CssClass="text-danger" />
                    </div>
                    <!-- Comments -->
                    <div class="col-md-6 form-group">
                        <label for="CommentTextBox" style="font-weight: bold; font-size: 16px;">Comments:</label>
                        <asp:TextBox ID="CommentTextBox" runat="server" Placeholder="Comments" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvComments"
                            ControlToValidate="CommentTextBox"
                            ErrorMessage="Comments are required"
                            runat="server"
                            CssClass="text-danger" />
                    </div>
                </div>

            </div>

            <div class="col-md-12 mt-3 d-flex justify-content-center">
                <!-- Submit button -->
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </main>
</asp:Content>
