<%@ Page Title="Create Grievance Log" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateGrievanceLog.aspx.cs" Inherits="EngineeringClubHR.CreateGrievanceLog" %>

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

        .log-section {
        max-width: 600px;
        padding: 20px;
        margin: auto;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .log-title {
        font-size: 24px;
        font-weight: bold;
        color: #2507B3;
        margin-bottom: 20px;
    }

    .log-item {
        margin-bottom: 15px;
    }

    .log-date {
        font-weight: bold;
        color: #333;
        margin-bottom: 5px;
    }

    .log-description {
        font-size: 14px;
        color: #333;
    }
    </style>
    <div class="log-section">
        <h2 class="log-title">Grievance Logs</h2>
          <asp:ListView ID="ListViewGrievanceLogs" runat="server">
              <ItemTemplate>
              <div class="log-item">
                <asp:Label ID="LabelLogDate" runat="server" Text='<%# Eval("LogDate", "{0:MM/dd/yyyy HH:mm:ss}") %>' CssClass="log-date"></asp:Label>
                <asp:Label ID="LabelLogDescription" runat="server" Text='<%# Eval("LogDescription") %>' CssClass="log-description"></asp:Label>
            </div>
            </ItemTemplate>
      </asp:ListView>
    </div>
    <div class="form-container">
        <h2 class="form-title">Add Grievance Log</h2>
        <div class="form">
            <div class="form-field">
                <asp:Label ID="LabelLogDescription" runat="server" CssClass="form-label" AssociatedControlID="TextBoxLogDescription">Log Description:</asp:Label>
                <asp:TextBox placeholder="Enter log description" ID="TextBoxLogDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4" required></asp:TextBox>
            </div>
            <div class="form-field">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit Grievance Log" CssClass="form-submit" OnClick="ButtonSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
