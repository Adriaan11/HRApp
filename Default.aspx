<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/EmptySite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EngineeringClubHR._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main style="background-image: url('Pictures/Picture1.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center center; background-attachment: fixed">
        <formview>
        <form id="LoginForm">
            <div class=" page-item d-flex align-items-center">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
                            <div class="pr-lg-5">
                                <img src="Pictures/EC2_1.png" alt="EngineeringClubLogo" class="img-fluid" />
                                <img src="Pictures/EC2_0_1.png" alt ="EngineeringClubName" class="img-fluid" />
                            </div>
                        </div>
                        <div class="col-lg-5 px-lg-4">
                            <h1 class="text-base text-uppercase mb-4" style="color:#2507B3">Login Here</h1>
                            <h2 class="mb-4">Welcome Back!</h2>
                            <div class="form-group mb-4">
                                <h4 class="mb-7" style="color:#2507B3" >Username</h4>
                                <asp:TextBox runat="server" required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Username"></asp:TextBox>
                            </div>
                            <div class="form-group mb-4">
                                <h4 class="mb-7" style="color:#2507B3" >Password</h4>
                                <asp:TextBox runat="server" required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Password" TextMode="Password"></asp:TextBox>
                                <a class="forgotPassword" href="#" style="text-decoration:none; color:#2507B3; margin-top: 100px; font-weight: 500">Forgot Password?</a>
                            </div>
                            <asp:Button Text="Login" BackColor="#2507B3" CssClass="btn login-btn" Height="50px" Width="500px" runat="server" OnClick="LoginButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
        </formview>
    </main>
</asp:Content>