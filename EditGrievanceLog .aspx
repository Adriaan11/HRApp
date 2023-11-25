<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditGrievanceLog.aspx.cs" Inherits="EngineeringClubHR.EditGrievanceLog" MasterPageFile="~/Site.Master" %>

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

    <a href="ViewGrievance.aspx?GrievanceID=<%=Request.QueryString["GrievanceID"]%>" class="back-button">&#8592; Back</a>

    <div class="form-container">
        <h2 class="form-title">Edit Grievance Log</h2>
        <div class="form">
            <div class="form-field">
                <asp:Label ID="LabelLogDescription" runat="server" CssClass="form-label" AssociatedControlID="TextBoxLogDescription">Log Description:</asp:Label>
                <asp:TextBox placeholder="Enter log description" ID="TextBoxLogDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4" required></asp:TextBox>
            </div>
            <!-- Add other form fields here if needed -->
            <div class="form-field">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Update Log" CssClass="form-submit" OnClick="ButtonSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
