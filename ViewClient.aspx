<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewClient.aspx.cs" Inherits="EngineeringClubHR.ViewClient" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mainContent">
        <h1 style="color: #2507B3">
            <img src="Pictures/New Icons/customer-satisfaction.png" style="width: 50px; height: 50px; margin-right: 50px;" />View Client</h1>
        <formview>
            <form class="col-lg-5 px-lg-4" id="form1">
                <div class="createForm">
                    <!-- Client Name -->
                    <div class="createInputs">
                        <text>Client Name: </text>
                        <asp:TextBox Style="width: 400px;" runat="server" required="true" CssClass=" border-0 shadow" placeholder="Kingsmead College"></asp:TextBox>
                    </div>
                    <!-- Organization Type -->
                    <div class="createInputs">
                        <text>Organization Type: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="School"></asp:TextBox>
                    </div>
                    <!-- Firstname -->
                    <div class="createInputs">
                        <text>Firstname: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="Andy"></asp:TextBox>
                    </div>
                    <!-- Middlename -->
                    <div class="createInputs">
                        <text>Middlename: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="Don"></asp:TextBox>
                    </div>
                    <!-- Lastname -->
                    <div class="createInputs">
                        <text>Lastname: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="Proud"></asp:TextBox>
                    </div>
                    <!-- Email -->
                    <div class="createInputs">
                        <text>Email: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="andykmead@gmail.com"></asp:TextBox>
                    </div>
                    <!-- Phone number -->
                    <div class="createInputs">
                        <text>Phone number: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="082 908 8907"></asp:TextBox>
                    </div>
                    <!-- Address -->
                    <div class="createInputs">
                        <text>Address: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="Entrance in Tottenham Avenue, Opposite the Rosebank Gautrain Station, 132 Oxford Rd, Rosebank"></asp:TextBox>
                    </div>
                    <!-- City -->
                    <div class="createInputs">
                        <text>City: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="Johannesburg"></asp:TextBox>
                    </div>
                    <!-- Postal Code -->
                    <div class="createInputs">
                        <text>Postal Code: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="2121"></asp:TextBox>
                    </div>
                    <!-- Country -->
                    <div class="createInputs">
                        <text>Country: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="South Africa"></asp:TextBox>
                    </div>
                    <!-- Industry -->
                    <div class="createInputs">
                        <text>Industry: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow"></asp:TextBox>
                    </div>
                    <!-- Contact Person -->
                    <div class="createInputs">
                        <text>Contact Person: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="Snow White"></asp:TextBox>
                    </div>
                    <!-- Contact Person Email -->
                    <div class="createInputs">
                        <text>Contact Person Email: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="kingsenquiry@gmail.com"></asp:TextBox>
                    </div>
                    <!-- Contact Person Number -->
                    <div class="createInputs">
                        <text>Contact Person Number: </text>
                        <asp:TextBox Style="width: 400px" runat="server" required="true" CssClass=" border-0 shadow" placeholder="011 111 1111"></asp:TextBox>
                    </div>
                    <!-- submit form -->
                    <asp:Button Text="Create" BackColor="#2507B3" CssClass="btn btn-primary" Height="40px" Width="300px" runat="server" />
                </div>
            </form>
        </formview>
    </main>
</asp:Content>
