<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ManageClients.aspx.cs" Inherits="EngineeringClubHR.ManageClients" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .buttonContainer {
            display: flex;
            justify-content: center; /* aligns the flex container's contents to the center */
            align-items: center;
        }

        .imageButtonStyle {
            margin-left: 10px; /* Adds some space between the buttons */
            height: 50px; /* Modify this to adjust the height of your image */
            width: 50px; /* Modify this to adjust the width of your image */
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

.colorBlindFriendly .card {
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

.colorBlindFriendly .input-group-text {
    background-color: #333;
    color: #FFF;
}

.colorBlindFriendly .fas.fa-search {
    color: #FFF;
}

.colorBlindFriendly .container.text-center {
    border: 1px solid #333;
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
                    <img src="Pictures/New Icons/customer-satisfaction.png" style="width: 50px; height: 50px; margin-right: 20px;" />Engineering Club Clients
                </h1>
            </div>
        </div>
            <div class="col">
       
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
                        <a href="CreateClient.aspx" class="btn btn-primary">Create Client</a>
                    </div>
                </div>
            </div>
        </div>
<div class="row mt-5">
    <div class="col">
	    <div class="input-group">
			     <asp:TextBox ID="searchBar" class="form-control" placeholder="Search for a client..." runat="server" AutoPostBack="True" OnTextChanged="searchBar_TextChanged" />
			<button type="button" class="btn btn-primary">
			     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg>
			</button>
		</div>
	</div>
</div>
        <div class="row mt-5">
            <h2 class="w-100 text-center">Active Clients</h2>
            <asp:Repeater ID="ActiveRepeater" runat="server" OnItemDataBound="ClientRepeater_ItemDataBound" OnItemCommand="ActiveRepeater_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"><%# Eval("organizationName") %></h4>
                                <h6>Contact Information</h6>
                                <p class="card-text">
                                    <%# Eval("contactPerson") %>
                                    <br />
                                    <a href="mailto:<%# Eval("contactPersonEmail") %>"><%# Eval("contactPersonEmail") %></a>
                                    <br />
                                    <%# Eval("contactPersonPhone") %>
                                </p>
                                <div class="buttonContainer">
                                    <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/Pictures/Icons/edit.png" PostBackUrl='<%# "CreateClient.aspx?clientID=" + Eval("clientID") %>' />
                                    <asp:ImageButton ImageUrl="~/Pictures/Icons/on-button.png" ID="RemoveButton" runat="server" CommandName="Remove" OnClick="RemoveButton_Click" CssClass="imageButtonStyle" CommandArgument='<%# Eval("clientID") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row mt-5">
            <h2 class="w-100 text-center">Inactive Clients</h2>
            <asp:Repeater ID="inActiveRepeater" runat="server" OnItemDataBound="ClientRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"><%# Eval("organizationName") %></h4>
                                <h6>Contact Information</h6>
                                <p class="card-text">
                                    <%# Eval("contactPerson") %>
                                    <br />
                                    <a href="mailto:<%# Eval("contactPersonEmail") %>"><%# Eval("contactPersonEmail") %></a>
                                    <br />
                                    <%# Eval("contactPersonPhone") %>
                                </p>
                                <div class="buttonContainer">
                                    <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/Pictures/Icons/edit.png" PostBackUrl='<%# "CreateClient.aspx?clientID=" + Eval("clientID") %>' />
                                    <asp:ImageButton ImageUrl="~/Pictures/Icons/off-button.png" ID="RemoveButton" runat="server" CommandName="Remove" OnClick="RemoveButton_Click" CssClass="imageButtonStyle" CommandArgument='<%# Eval("clientID") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
