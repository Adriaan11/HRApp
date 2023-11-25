<%@ Page Title="Create Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateClient.aspx.cs" Inherits="EngineeringClubHR.CreateClient" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mainContent container-fluid">
                <h1 class="text-dark my-3 text-center">
            <img src="Pictures/New Icons/customer-satisfaction.png" style="width: 50px; height: 50px; margin-right: 20px;" />Create Client
        </h1>
        <div class="row gx-3 gy-2 align-items-center" id="form1">
            <div class="col-lg-8 offset-lg-2">
                <!-- Personal Information -->
                <div class="row">
                    <h2 class="text-secondary my-2">Personal Information</h2>
                    <!-- Additional fields -->
                    <div class="col-md-4 form-group">
                        <label for="clientType">Client Type:</label>
                        <asp:TextBox ID="clientType" runat="server" CssClass="form-control" PlaceHolder="Enter Client Type" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorClientType"
                            ControlToValidate="clientType"
                            ErrorMessage="Client Type is required"
                            runat="server"
                            ForeColor="Red"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator16"
                            ControlToValidate="clientType"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <!-- /Additional fields -->
                    <div class="col-md-4 form-group">
                        <label for="Firstname">First Name:</label>
                        <asp:TextBox ID="Firstname" runat="server" CssClass="form-control" PlaceHolder="Enter First Name" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorFirstName"
                            ControlToValidate="Firstname"
                            ErrorMessage="First Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator15"
                            ControlToValidate="Firstname"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="Middlename">Middle Name:</label>
                        <asp:TextBox ID="Middlename" runat="server" CssClass="form-control" PlaceHolder="Enter Middle Name"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorMiddleName"
                            ControlToValidate="Middlename"
                            ErrorMessage="Middle Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />

                    </div>
                    <div class="col-md-4 form-group">
                        <label for="Lastname">Last Name:</label>
                        <asp:TextBox ID="Lastname" runat="server" CssClass="form-control" PlaceHolder="Enter Last Name" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorLastName"
                            ControlToValidate="Lastname"
                            ErrorMessage="Last Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator11"
                            ControlToValidate="Lastname"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                </div>

                <!-- Contact Information -->
                <div class="row">
                    <h2 class="text-secondary my-2">Contact Information</h2>
                    <div class="col-md-6 form-group">
                        <label for="Email">Email:</label>
                        <asp:TextBox ID="Email" runat="server" CssClass="form-control" PlaceHolder="Enter Email" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorEmail"
                            ControlToValidate="Email"
                            ErrorMessage="Email is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="PhoneNumber">Phone Number:</label>
                        <asp:TextBox ID="PhoneNumber" runat="server" CssClass="form-control" PlaceHolder="Enter Phone Number" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator11"
                            ControlToValidate="PhoneNumber"
                            ErrorMessage="PhoneNumber is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator10"
                            ControlToValidate="PhoneNumber"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[0-9]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                </div>

                <!-- Organization Information -->
                <div class="row">
                    <h2 class="text-secondary my-2">Organization Information</h2>
                    <div class="col-md-6 form-group">
                        <label for="TextBox1">Client Name:</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" PlaceHolder="Enter Client Name" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorClientName"
                            ControlToValidate="TextBox1"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidatorLetters"
                            ControlToValidate="TextBox1"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />

                    </div>
                    <div class="col-md-6 form-group">
                        <label for="TextBox2">Organization Type:</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" PlaceHolder="Enter Organization Type" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            ControlToValidate="TextBox2"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            ControlToValidate="TextBox2"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <!-- Additional fields -->
                    <div class="col-md-6 form-group">
                        <label for="Industry">Industry:</label>
                        <asp:TextBox ID="Industry" runat="server" CssClass="form-control" PlaceHolder="Enter Industry"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            ControlToValidate="Industry"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            ControlToValidate="Industry"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                </div>

                <!-- Address Information -->
                <div class="row">
                    <h2 class="text-secondary my-2">Address Information</h2>
                    <div class="col-md-6 form-group">
                        <label for="Address">Address:</label>
                        <asp:TextBox ID="Address" runat="server" CssClass="form-control" PlaceHolder="Enter Address" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            ControlToValidate="Address"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />

                    </div>
                    <div class="col-md-6 form-group">
                        <label for="City">City:</label>
                        <asp:TextBox ID="City" runat="server" CssClass="form-control" PlaceHolder="Enter City" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            ControlToValidate="City"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator4"
                            ControlToValidate="City"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <!-- Additional fields -->
                    <div class="col-md-6 form-group">
                        <label for="State">State:</label>
                        <asp:TextBox ID="State" runat="server" CssClass="form-control" PlaceHolder="Enter State" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            ControlToValidate="State"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator5"
                            ControlToValidate="State"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <!-- /Additional fields -->
                    <div class="col-md-6 form-group">
                        <label for="PostalCode">Postal Code:</label>
                        <asp:TextBox ID="PostalCode" runat="server" CssClass="form-control" PlaceHolder="Enter Postal Code" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6"
                            ControlToValidate="PostalCode"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidatorNumbers"
                            ControlToValidate="PostalCode"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[0-9]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="Country">Country:</label>
                        <asp:TextBox ID="Country" runat="server" CssClass="form-control" PlaceHolder="Enter Country" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7"
                            ControlToValidate="Country"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator6"
                            ControlToValidate="Country"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                </div>

                <!-- Contact Person Information -->
                <div class="row">
                    <h2 class="text-secondary my-2">Contact Person Information</h2>
                    <!-- Additional fields -->
                    <div class="col-md-6 form-group">
                        <label for="ContactPerson">Contact Person:</label>
                        <asp:TextBox ID="ContactPerson" runat="server" CssClass="form-control" PlaceHolder="Enter Contact Person Name"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            ControlToValidate="ContactPerson"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />

                    </div>
                    <div class="col-md-6 form-group">
                        <label for="ContactPersonEmail">Contact Person Email:</label>
                        <asp:TextBox ID="ContactPersonEmail" runat="server" CssClass="form-control" PlaceHolder="Enter Contact Person Email"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator9"
                            ControlToValidate="ContactPersonEmail"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />

                    </div>
                    <div class="col-md-6 form-group">
                        <label for="ContactPersonPhone">Contact Person Phone:</label>
                        <asp:TextBox ID="ContactPersonPhone" runat="server" CssClass="form-control" PlaceHolder="Enter Contact Person Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10"
                            ControlToValidate="ContactPersonPhone"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator9"
                            ControlToValidate="ContactPersonPhone"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[0-9]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="form-group mt-3">
                    <asp:Button ID="ButtonSave" Text="Create" CssClass="btn btn-primary btn-block" runat="server" OnClick="Unnamed_Click" />
                </div>
            </div>
        </div>
    </main>


<script type="text/javascript">
    function validatePhoneNumber(source, args) {
        var phoneNumber = args.Value;
        var regex = /^[0-9]+$/;
        if (!regex.test(phoneNumber)) {
            args.IsValid = false;
        } else {
            args.IsValid = true;
        }
    }

    function validatePostalCode(source, args) {
        var postalCode = args.Value;
        var regex = /^[0-9]+$/;
        if (!regex.test(postalCode)) {
            args.IsValid = false;
        } else {
            args.IsValid = true;
        }
    }

    function validateContactPersonPhone(source, args) {
        var contactPersonPhone = args.Value;
        var regex = /^[0-9]+$/;
        if (!regex.test(contactPersonPhone)) {
            args.IsValid = false;
        } else {
            args.IsValid = true;
        }
    }

    function attachPhoneValidation() {
        var phoneNumberTextBox = document.getElementById('<%= PhoneNumber.ClientID %>');
        if (phoneNumberTextBox) {
            phoneNumberTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator10.ClientID %>'), true);
            });
        }

        var postalCodeTextBox = document.getElementById('<%= PostalCode.ClientID %>');
        if (postalCodeTextBox) {
            postalCodeTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidatorNumbers.ClientID %>'), true);
            });
        }

        var contactPersonPhoneTextBox = document.getElementById('<%= ContactPersonPhone.ClientID %>');
        if (contactPersonPhoneTextBox) {
            contactPersonPhoneTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator9.ClientID %>'), true);
            });
        }
    }

    window.onload = function () {
        attachPhoneValidation();
    };
</script>




</asp:Content>
