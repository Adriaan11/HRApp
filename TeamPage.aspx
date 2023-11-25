<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamPage.aspx.cs" Inherits="EngineeringClubHR.TeamPage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        .timestampCSS {
            color: #2507B3;
            text-align: right;
            font-size: 10px;
        }

        .employeeInChat {
            color: #2507B3;
            font-size: 12px;
        }
    </style>

    <main aria-labelledby="title">
        <div class="container mt-5">
            <div class="row">
                <!-- Chat window (left-hand side) -->
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-header">
                            <h5>Team Chat</h5>
                        </div>
                        <div class="card-body">
                            <!-- Chat messages will be dynamically added here -->
                            <div class="chat-messages" id="chatMessages">
                                <asp:Repeater ID="ChatRepeater" runat="server" OnItemCommand="ChatRepeater_ItemCommand">
                                    <ItemTemplate>
                                        <div class="media <%# Eval("CssClass") %>">
                                            <div class="media-body">
                                               <!-- <p class="employeeInChat"><%# Eval("EmployeeName") %></p> -->
                                                <div class="bg-light rounded py-2 px-3 mb-2">
                                                    <p class="text-small mb-0 text-dark"><%# Eval("Message") %></p>
                                                </div>
                                                <div class="media-body">
                                                    <p class="timestampCSS"><%# Eval("Timestamp", "{0:HH:mm}") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="card-footer">
                            <!-- Chat input -->
                            <div class="input-group">
                                <asp:TextBox runat="server" type="text" class="form-control" ID="messageInput" placeholder="Type your message..." />
                                <asp:Button ID="sendButton" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="sendButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- User list (right-hand side) -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h5>Employees</h5>
                        </div>
                        <div class="card-body">
                            <asp:Repeater ID="UsersInChat" runat="server">
                                <ItemTemplate>
                                    <div class="d-block my-2 border-bottom">
                                        <h4><%# Eval("firstName") %> <%# Eval("lastName") %></h4>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</asp:Content>


