<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CreateEmployee.aspx.cs" Inherits="EngineeringClubHR.CreateEmployee" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />


    <style>
        /* Center the profile picture */
        .profile-picture-container {
            text-align: center;
        }

        /* Style the buttons */
        .buttons-container {
            text-align: center;
            margin-top: 10px; /* Adjust the margin as needed for spacing */
        }
    </style>


    <main class="mainContent text-center">
        <h1 class="text-dark my-3 text-center">
            <img src="Pictures/New Icons/employee.png" style="width: 50px; height: 50px; margin-right: 20px;" />Create Employee
        </h1>
        <div class="row gx-3 gy-2 align-items-center" id="form1">
            <div class="col-lg-8 offset-lg-3">

                <div class="row">
                    <h2 class="text-secondary my-2 col-12">Personal Information</h2>

                    <div class="col-md-4 form-group">
                        <label for="Firstname" style="font-weight: bold; font-size: 16px;">First Name:</label>
                        <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" PlaceHolder="Enter First Name" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            ControlToValidate="TextBoxName"
                            ErrorMessage="First Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidatorLetters"
                            ControlToValidate="TextBoxName"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="Middlename" style="font-weight: bold; font-size: 16px;">Middle Name:</label>
                        <asp:TextBox ID="TextBoxMiddleName" runat="server" CssClass="form-control" PlaceHolder="Enter Middle Name"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            ControlToValidate="TextBoxMiddleName"
                            ErrorMessage="Middle Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            ControlToValidate="TextBoxMiddleName"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="Lastname" style="font-weight: bold; font-size: 16px;">Last Name:</label>
                        <asp:TextBox ID="TextBoxSurname" runat="server" CssClass="form-control" PlaceHolder="Enter Last Name" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            ControlToValidate="TextBoxSurname"
                            ErrorMessage="Last Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            ControlToValidate="TextBoxSurname"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="PReferredname" style="font-weight: bold; font-size: 16px;">Preferred name:</label>
                        <asp:TextBox ID="TextBoxPreferredName" runat="server" CssClass="form-control" PlaceHolder="Enter Preferred Name"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            ControlToValidate="TextBoxPreferredName"
                            ErrorMessage="Preferred Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator3"
                            ControlToValidate="TextBoxPreferredName"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: bold; font-size: 16px;">Gender:</label>
                        <asp:DropDownList ID="DropDownListGender" Style="width: 100%" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorManager"
                            ControlToValidate="DropDownListGender"
                            InitialValue="0"
                            ErrorMessage="Please select a Gender"
                            runat="server"
                            CssClass="error"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="IDNumber" style="font-weight: bold; font-size: 16px;">ID Number:</label>
                        <asp:TextBox ID="TextBoxIDNumber" Style="width: 100%" runat="server" PlaceHolder="Enter ID number" CssClass="form-control" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            ControlToValidate="TextBoxIDNumber"
                            ErrorMessage="Field is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                       <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator5"
                            ControlToValidate="TextBoxIDNumber"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[0-9]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>


                    <div class="col-md-4 form-group">
                        <label for="Nationality" style="font-weight: bold; font-size: 16px;">Nationality:</label>
                        <asp:TextBox ID="TextBoxNationality" runat="server" CssClass="form-control" PlaceHolder="Enter Nationality" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6"
                            ControlToValidate="TextBoxNationality"
                            ErrorMessage="Nationality is required"
                            runat="server"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator4"
                            ControlToValidate="TextBoxNationality"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: bold; font-size: 16px;">Address:</label>
                        <asp:TextBox ID="TextBoxAddress" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Address" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7"
                            ControlToValidate="TextBoxAddress"
                            ErrorMessage="Address is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: bold; font-size: 16px;">Country:</label>
                        <asp:TextBox ID="TextBoxCountry" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Country" CssClass="form-control"></asp:TextBox>
                        <input type="hidden" id="country_code" name="country_code" title="fdhfhfhffhfhffh" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            ControlToValidate="TextBoxCountry"
                            ErrorMessage="Country is required"
                            runat="server"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="revTitle"
                            runat="server"
                            ControlToValidate="TextBoxCountry"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            ErrorMessage="Only letters and white spaces are allowed"
                            CssClass="text-danger">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="City" style="font-weight: bold; font-size: 16px;">City:</label>
                        <asp:TextBox ID="TextBoxcity" runat="server" CssClass="form-control" PlaceHolder="Enter City"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator9"
                            ControlToValidate="TextBoxcity"
                            ErrorMessage="Country is required"
                            runat="server"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator6"
                            ControlToValidate="TextBoxcity"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="State" style="font-weight: bold; font-size: 16px;">State:</label>
                        <asp:TextBox ID="Textboxstate" runat="server" CssClass="form-control" PlaceHolder="Enter State"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10"
                            ControlToValidate="Textboxstate"
                            ErrorMessage="State is required"
                            runat="server"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator7"
                            ControlToValidate="Textboxstate"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="PostalCode" style="font-weight: bold; font-size: 16px;">Postal Code:</label>
                        <asp:TextBox ID="TextBoxPostalcode" runat="server" CssClass="form-control" PlaceHolder="Enter Postal Code"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator11"
                            ControlToValidate="TextBoxPostalcode"
                            ErrorMessage="Poastal Code is required"
                            runat="server"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidatorNumbers"
                            ControlToValidate="TextBoxPostalcode"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[0-9]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="password" style="font-weight: bold; font-size: 16px;">Password:</label>
                        <asp:TextBox ID="TextBoxpassword" runat="server" CssClass="form-control" PlaceHolder="Enter Password"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator12"
                            ControlToValidate="TextBoxpassword"
                            ErrorMessage="Password is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: bold; font-size: 16px;">Marital status:</label>
                        <asp:TextBox ID="TextBoxMaritalStatus" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Marital Status" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator13"
                            ControlToValidate="TextBoxMaritalStatus"
                            ErrorMessage="Marital Status is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator8"
                            ControlToValidate="TextBoxMaritalStatus"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="DateofBirth" style="font-weight: bold; font-size: 16px;">Date of birth:</label>
                        <asp:TextBox ID="TXTstartDate" runat="server" CssClass="form-control " Placeholder="Enter Date of Birth" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator14"
                            ControlToValidate="TXTstartDate"
                            ErrorMessage="Date of Birth is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label style="font-weight: bold; font-size: 16px;" for="CountryOfBirth">Country of Birth:</label>
                        <asp:TextBox ID="TextBoxCountryOfBirth" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Country of Birth" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator15"
                            ControlToValidate="TextBoxCountryOfBirth"
                            ErrorMessage="Country of Birth is required"
                            runat="server"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator9"
                            ControlToValidate="TextBoxCountryOfBirth"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                </div>
            </div>
        </div>



        <div class="row gx-3 gy-2 align-items-center" id="form2">
            <div class="col-lg-8 offset-lg-3">
                <!-- Personal Information -->
                <div class="row">
                    <h2 class="text-secondary my-2 col-12">Contact Information</h2>

                    <div class="col-md-4 form-group">
                        <label for="PhoneNumber" style="font-weight: bold; font-size: 16px;">Phone number:</label>
                        <asp:TextBox ID="TextBoxPhoneNumber" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Phone Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator16"
                            ControlToValidate="TextBoxPhoneNumber"
                            ErrorMessage="Phone Number is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator10"
                            ControlToValidate="TextBoxPhoneNumber"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[\d\s\-\+\(\)]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="Email" style="font-weight: bold; font-size: 16px;">Email:</label>
                        <asp:TextBox ID="TextBoxEmail" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Email" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator17"
                            ControlToValidate="TextBoxEmail"
                            ErrorMessage="Email is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="EmergencyContactName" style="font-weight: bold; font-size: 16px;">Emergency Contact Name:</label>
                        <asp:TextBox ID="TextBoxEmergencyContactName" Style="width: 100%" runat="server" PlaceHolder="Enter Emergency Contact Name" required="true" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator18"
                            ControlToValidate="TextBoxEmergencyContactName"
                            ErrorMessage="Emergency Contact Name is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator11"
                            ControlToValidate="TextBoxEmergencyContactName"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="EmergencyContactRelationship" style="font-weight: bold; font-size: 16px;">Emergency Contact Relation:</label>
                        <asp:TextBox ID="TextBoxEmergencyContactRelationship" Style="width: 100%" runat="server" PlaceHolder="Enter Emergency Contact Relationship" required="true" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator19"
                            ControlToValidate="TextBoxEmergencyContactRelationship"
                            ErrorMessage="Emergency Contact Relationship is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator51"
                            ControlToValidate="TextBoxEmergencyContactRelationship"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s.,!]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="EmergencyContactPhone" style="font-weight: bold; font-size: 16px;">Emergency Contact Phone:</label>
                        <asp:TextBox ID="TextBoxEmergencyContactPhone" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Emergency Contact Phone" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator20"
                            ControlToValidate="TextBoxEmergencyContactPhone"
                            ErrorMessage="Emergency Contact Phone is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator13"
                            ControlToValidate="TextBoxEmergencyContactPhone"
                            ErrorMessage="Only numbers allowed"
                            ValidationExpression="^[\d\s\-\+\(\)]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="Position" style="font-weight: bold; font-size: 16px;">Position:</label>
                        <asp:TextBox ID="TextBoxPosition" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Employee's Position" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator21"
                            ControlToValidate="TextBoxPosition"
                            ErrorMessage="Employee's Position is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator14"
                            ControlToValidate="TextBoxPosition"
                            ErrorMessage="Only letters allowed"
                            ValidationExpression="^[a-zA-Z\s]+$"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>

                    <div class="col-md-4 form-group">
                        <label for="EmergencyContactEmail" style="font-weight: bold; font-size: 16px;">Emergency Contact Email:</label>
                        <asp:TextBox ID="TextBoxEmergencyContactEmail" Style="width: 100%" runat="server" PlaceHolder="Enter Contact Email" required="true" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator22"
                            ControlToValidate="TextBoxEmergencyContactEmail"
                            ErrorMessage="Contact Email is required"
                            runat="server"
                            Display="Dynamic"
                            ForeColor="Red" />
                    </div>
                </div>
            </div>
        </div>





        <div class="row gx-3 gy-2 align-items-center" id="form3">
            <div class="col-lg-8 offset-lg-3">
                <!-- Work Information -->
                <div class="row">
                    <h2 class="text-secondary my-2">Work Information</h2>

                    <div class="row row-cols-md-3 gy-2 align-items-start">
                        <div class="col-md-4 form-group">
                            <label for="JobTitle" style="font-weight: bold; font-size: 16px;">Job Title:</label>
                            <asp:TextBox ID="TextBoxJobTitle" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Job Title" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator23"
                                ControlToValidate="TextBoxJobTitle"
                                ErrorMessage="Job Title is required"
                                runat="server"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator15"
                                ControlToValidate="TextBoxJobTitle"
                                ErrorMessage="Only letters allowed"
                                ValidationExpression="^[a-zA-Z\s]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="Department" style="font-weight: bold; font-size: 16px;">Department:</label>
                            <asp:TextBox ID="TextBoxDepartment" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Department" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator24"
                                ControlToValidate="TextBoxDepartment"
                                ErrorMessage="Department is required"
                                runat="server"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator16"
                                ControlToValidate="TextBoxDepartment"
                                ErrorMessage="Only letters allowed"
                                ValidationExpression="^[a-zA-Z\s]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="Manager" style="font-weight: bold; font-size: 16px;">Manager:</label>
                            <asp:DropDownList ID="DropDownListManager" CssClass="form-control" Style="width: 100%" PlaceHolder="Enter Manager" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator25"
                                ControlToValidate="DropDownListManager"
                                InitialValue="0"
                                ErrorMessage="Please select a manager"
                                runat="server"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="TerminationDate" style="font-weight: bold; font-size: 16px;">Termination Date:</label>
                            <asp:TextBox ID="TextBoxTerminationDate" runat="server" CssClass="form-control mb-3" Placeholder="Expense Date" TextMode="Date"></asp:TextBox>

                        </div>
                        <div class="col-md-4 form-group">
                            <label for="EmploymentStatus" style="font-weight: bold; font-size: 16px;">Employment Status:</label>
                            <asp:TextBox ID="TextBoxEmploymentStatus" Style="width: 100%" PlaceHolder="Enter Employment Status" runat="server" required="true" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator27"
                                ControlToValidate="TextBoxEmploymentStatus"
                                ErrorMessage="Employment Status is required"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator17"
                                ControlToValidate="TextBoxEmploymentStatus"
                                ErrorMessage="Only letters allowed"
                                ValidationExpression="^[a-zA-Z\s]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="EmploymentType" style="font-weight: bold; font-size: 16px;">Employment Type:</label>
                            <asp:TextBox ID="TextBoxEmploymentType" Style="width: 100%" runat="server" PlaceHolder="Enter Employment type" required="true" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator28"
                                ControlToValidate="TextBoxEmploymentStatus"
                                ErrorMessage="Employment Status is required"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator18"
                                ControlToValidate="TextBoxEmploymentStatus"
                                ErrorMessage="Only letters allowed"
                                ValidationExpression="^[a-zA-Z\s]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="WorkHoursPerWeek" style="font-weight: bold; font-size: 16px;">Work Hours Per Week:</label>
                            <asp:TextBox ID="TextBoxWorkHoursPerWeek" Style="width: 100%" runat="server" PlaceHolder="Enter Work Hours Per Week" required="true" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator29"
                                ControlToValidate="TextBoxWorkHoursPerWeek"
                                ErrorMessage="Work Hours Per Week is required"
                                runat="server"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator19"
                                ControlToValidate="TextBoxWorkHoursPerWeek"
                                ErrorMessage="Only numbers allowed"
                                ValidationExpression="^[0-9]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="EmployeeStatus" style="font-weight: bold; font-size: 16px;">Employee Status:</label>
                            <asp:DropDownList ID="DropDownListEmployeeStatus" CssClass="form-control" Style="width: 100%" runat="server">
                                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidatorDDL"
                                ControlToValidate="DropDownListEmployeeStatus"
                                InitialValue="0"
                                ErrorMessage="Please select an option"
                                runat="server"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="OfficeLocation" style="font-weight: bold; font-size: 16px;">Office Location:</label>
                            <asp:TextBox ID="TextBoxOfficeLocation" Style="width: 100%" runat="server" PlaceHolder="Enter Office Location" required="true" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator30"
                                ControlToValidate="TextBoxOfficeLocation"
                                ErrorMessage="Office Location is required"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator20"
                                ControlToValidate="TextBoxOfficeLocation"
                                ErrorMessage="Only letters allowed"
                                ValidationExpression="^[a-zA-Z\s]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="HourlyRate" style="font-weight: bold; font-size: 16px;">Hourly Rate:</label>
                            <asp:TextBox ID="TextBoxHourlyRate" Style="width: 100%" runat="server" PlaceHolder="Enter Hourly Rate" required="true" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator31"
                                ControlToValidate="TextBoxHourlyRate"
                                ErrorMessage="Hourly Rate is required"
                                runat="server"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator21"
                                ControlToValidate="TextBoxHourlyRate"
                                ErrorMessage="Only numbers allowed"
                                ValidationExpression="^[0-9]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="Salary" style="font-weight: bold; font-size: 16px;">Salary:</label>
                            <asp:TextBox ID="TextBoxSalary" Style="width: 100%" runat="server" required="true" PlaceHolder="Enter Salary" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator32"
                                ControlToValidate="TextBoxSalary"
                                ErrorMessage="Salary is required"
                                runat="server"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator22"
                                ControlToValidate="TextBoxSalary"
                                ErrorMessage="Only numbers allowed"
                                ValidationExpression="^[0-9]+$"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="HireDate" style="font-weight: bold; font-size: 16px;">Hire Date:</label>
                            <asp:TextBox ID="TextBoxHireDate" runat="server" CssClass="form-control mb-3" Placeholder="Expense Date" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator33"
                                ControlToValidate="TextBoxHireDate"
                                ErrorMessage="Field is required"
                                runat="server"
                                Display="Dynamic"
                                ForeColor="Red" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <formview>

            <div class="createInputs">
                <!-- Profile Picture -->
                <!-- Profile Picture -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div style="border: 2px solid #000; padding: 10px; background-color: #f0f0f0; border-radius: 5px; width: fit-content; height: 90px; margin: 0 auto;">
                            <div class="form-group" style="margin-top: 20px; margin-bottom: 20px;">
                                <label style="font-weight: bold; font-size: 16px;" for="FileUploadProfilePicture">Upload profile picture:</label>
                                <asp:FileUpload ID="FileUploadProfilePicture" runat="server" />
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 20px; margin-bottom: 20px;">
                            <asp:Image ID="ProfilePictureImage" runat="server" Style="max-width: 30%;" />
                        </div>
                    </div>
                </div>




                <!-- Buttons Container -->
                <div class="row">
                    <div class="col-md-12 buttons-container text-center">
                        <asp:Button ID="Update" runat="server" Text="Update" CssClass="btn btn-primary" UseSubmitBehavior="false" OnCommand="Update_Click" Visible="false" />
                        <asp:Button ID="SaveButton" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveButton_Click1" UseSubmitBehavior="false" Visible="false" />
                    </div>
                </div>
            </div>




        </formview>

<script type="text/javascript">
    function attachInputValidation() {
        var idNumberTextBox = document.getElementById('<%= TextBoxIDNumber.ClientID %>');
        var phoneNumberTextBox = document.getElementById('<%= TextBoxPhoneNumber.ClientID %>');
        var postalCodeTextBox = document.getElementById('<%= TextBoxPostalcode.ClientID %>');
        var hourlyRateTextBox = document.getElementById('<%= TextBoxHourlyRate.ClientID %>');
        var salaryTextBox = document.getElementById('<%= TextBoxSalary.ClientID %>');

        if (idNumberTextBox) {
            idNumberTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator5.ClientID %>'), true);
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator5.ClientID %>'), true);
            });
        }

        if (phoneNumberTextBox) {
            phoneNumberTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator16.ClientID %>'), true);
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator10.ClientID %>'), true);
            });
                }

        if (postalCodeTextBox) {
            postalCodeTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator11.ClientID %>'), true);
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidatorNumbers.ClientID %>'), true);
            });
        }

        if (hourlyRateTextBox) {
            hourlyRateTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator31.ClientID %>'), true);
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator21.ClientID %>'), true);
            });
        }

        if (salaryTextBox) {
            salaryTextBox.addEventListener('input', function () {
                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator32.ClientID %>'), true);
                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator22.ClientID %>'), true);
            });
        }
    }

    window.onload = function () {
        attachInputValidation();
    };
</script>

    </main>

</asp:Content>
