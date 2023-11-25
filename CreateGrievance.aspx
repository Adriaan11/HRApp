<%@ Page Title="CreateGrievance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateGrievance.aspx.cs" Inherits="EngineeringClubHR.CreateGrievance" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form-container {
            max-width: 600px;
            padding: 20px;
            text-align: center;
            margin: auto;
        }

        .form-title {
            color: #2507B3;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-field {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-label {
            display: block;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .form-select,
        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-submit {
            background-color: #2507B3;
            color: #fff;
            cursor: pointer;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .form-submit:hover {
            background-color: #1b0566;
        }
    </style>

    <div class="form-container">
        <h1 class="text-dark my-3 text-center">
            <img src="Pictures/New Icons/bad.png" style="width: 50px; height: 50px; margin-right: 20px;" />File A Grievance
        </h1>
        <div class="form">
             <div class="form-field">
                    <asp:Label AssociatedControlID="employeeSelect" CssClass="form-label" Text="Grievance Victim Name" runat="server" />
                    <asp:DropDownList ID="employeeSelect" runat="server" CssClass="form-control">
                 </asp:DropDownList>
            </div>
            <div class="form-field">
                <asp:Label AssociatedControlID="employeeSelect" CssClass="form-label" Text="Grievance Actor Name" runat="server" />
                <asp:DropDownList ID="grievanceEmployeeSelect" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <div class="form-field">
                <asp:Label ID="LabelGrievanceTitle" runat="server" CssClass="form-label" AssociatedControlID="TextBoxGrievanceTitle">Grievance Title:</asp:Label>
                <asp:TextBox placeholder="Harassment" ID="TextBoxGrievanceTitle" runat="server" CssClass="form-input" required></asp:TextBox>
            </div>
            <div class="form-field">
                <asp:Label ID="LabelDescription" runat="server" CssClass="form-label" AssociatedControlID="TextBoxDescription">Description:</asp:Label>
                <asp:TextBox placeholder="Tries to speak to me even when im busy and follows me around" ID="TextBoxDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4" required></asp:TextBox>
            </div>
            <div class="form-field">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit Grievance" CssClass="form-submit" onclick="ButtonSubmit_Click" CommandArgument='<%# Eval("employeeID") %>'/>
            </div>
            <div class="form-field">
                <asp:Label ID="LabelResult" runat="server" CssClass="form-label" AssociatedControlID="TextBoxDescription"></asp:Label>
             </div>
        </div>
            </div>
    </div>
</asp:Content>