<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/EmptySite.Master" Inherits="EngineeringClubHR.Login" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
        .form-container {
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            padding: 20px;
            text-align: center;
            margin-top: 10px;
        }
        .login-button {
            margin-top: 10px;
        }
        .textbox-spacing {
            margin-bottom: 10px; 
        }
        .error-message {
               color: red;
               font-size: 16px;
               margin-top: 0px;
               margin-bottom: 15px;
               display: flex;
               align-items: center;
               justify-content: center; 
         }
        .error-message::before {
            content: "\26A0\FE0F"; 
            margin-right: 5px; 
            font-size: 20px;



         }
    </style>
  <script type="text/javascript">
      function togglePasswordVisibility() {
          var passwordField = document.getElementById('<%= passText.ClientID %>');
          var showPasswordIcon = document.getElementById('showPasswordIcon');

          if (passwordField.type === "password") {
              passwordField.type = "text";
              showPasswordIcon.classList.remove("fa-eye-slash");
              showPasswordIcon.classList.add("fa-eye");
          } else {
              passwordField.type = "password";
              showPasswordIcon.classList.remove("fa-eye");
              showPasswordIcon.classList.add("fa-eye-slash");
          }
      }
  </script>


    <main class="d-flex justify-content-center align-items-center" style="background-image: url('Pictures/Picture1.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center center; background-attachment: fixed; min-height: 100vh;">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <div class="container">
        <div class="row text-center">
            <div class="col-md-12 mt-3">
                <img src="Pictures/EC2_1.png" style="width: 15%; height: auto; margin-bottom: 10px;" alt="EngineeringClubLogo" class="img-fluid" />
            </div>
            <div class="col-md-12">
                <img src="Pictures/EC2_0_1.png" style="width: 30%; height: auto; margin-bottom: 10px;" alt="EngineeringClubName" class="img-fluid" />
            </div>
        </div>
        <div class="row justify-content-center align-items-center">
            <div class="col-md-12" style="width: 40%">
                <div class="form-container" >
                    <asp:Label ID="lblUsernameError" runat="server" Text="" CssClass="error-message" Visible="false"></asp:Label>
                    <asp:Label ID="lblPasswordError" runat="server" Text="" CssClass="error-message" Visible="false"></asp:Label>
                    <asp:TextBox ID="userText" runat="server" CssClass="form-control textbox-spacing" PlaceHolder="Username"></asp:TextBox>
                    <div class="input-group">
                        <asp:TextBox ID="passText" runat="server" CssClass="form-control textbox-spacing" PlaceHolder="Password" TextMode="Password"></asp:TextBox>
                        <div class="input-group-append">
                            <span class="input-group-text" style="padding: 0;">
                                <i id="showPasswordIcon" class="fa fa-eye-slash" aria-hidden="true" onclick="togglePasswordVisibility()" style="font-size: 35px;"></i>
                            </span>
                        </div>
                    </div>
                    <asp:Button ID="Buttonlogin" Text="Log in" CssClass="btn btn-primary btn-block login-button" runat="server" OnClick="loginButton_Click" />
                </div>
            </div>
        </div>
    </div>
</main>

</asp:Content>
