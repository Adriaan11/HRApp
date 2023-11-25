<%@ Page Title="Edit Grievance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditGrievance.aspx.cs" Inherits="EngineeringClubHR.EditGrievance" %>

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

        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            color: #2507B3;
        }

        .form-dropdown {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-color: #fff;
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
            <img src="Pictures/New Icons/bad.png" style="width: 50px; height: 50px; margin-right: 20px;" /> Edit Grievance
        </h1>
        <div class="form">
            <div class="form-field">
                <asp:Label ID="LabelGrievanceDescription" runat="server" CssClass="form-label" AssociatedControlID="TextBoxGrievanceDescription">Grievance Description:</asp:Label>
                <asp:TextBox placeholder="Enter grievance description" ID="TextBoxGrievanceDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            <div class="form-field">
                <asp:Label ID="LabelStatus" runat="server" CssClass="form-label" AssociatedControlID="DropDownListStatus">Status:</asp:Label>
                <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="form-dropdown">
                </asp:DropDownList>
            </div>
            <div class="form-field">
                <asp:Label ID="LabelPerpetrator" runat="server" CssClass="form-label" AssociatedControlID="DropDownListPerpetrator">Perpetrator:</asp:Label>
                <asp:DropDownList ID="DropDownListPerpetrator" runat="server" CssClass="form-dropdown">
                </asp:DropDownList>
            </div>
            <div class="form-field">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Update Grievance" CssClass="form-submit" OnClick="ButtonSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
