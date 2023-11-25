<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ContactUs.aspx.cs" Inherits="EngineeringClubHR.ContactUs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="container mt-4">
        <div class="row justify-content-center align-items-center mb-3">
            <div class="col-lg-8 text-center">
                <h1 class="text-dark my-3 text-center">
                    <img src="Pictures/New Icons/contact.png" style="width: 50px; height: 50px; margin-right: 20px;" />Contact Us
                </h1>

                <h3>Although this started as a university project, our team has put in a great deal of passion and effort to make this application what it is today.
                </h3>

                <asp:Repeater ID="rptContacts" runat="server">
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <asp:Image ID="imgContact" runat="server" ImageUrl='<%# Eval("ImageSrc") %>' CssClass="card-img img-fluid img-thumbnail" Style="max-height: 300px; object-fit: cover;" />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Name") %></h5>
                                        <p class="card-text">
                                            <small class="text-muted">Email: 
                                <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a>
                                            </small>
                                        </p>
                                        <p class="card-text"><small class="text-muted">Role: <%# Eval("Role") %></small></p>
                                        <p class="card-text"><%# Eval("Bio") %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </main>
</asp:Content>
