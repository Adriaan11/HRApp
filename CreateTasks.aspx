<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CreateTasks.aspx.cs" Inherits="EngineeringClubHR.CreateTasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="container mt-4">
        <div class="row justify-content-center align-items-center mb-3">
            <div class="col-lg-8 text-center">
                        <h1 class="text-dark my-3 text-center">
                            <img src="Pictures/New Icons/planning.png" style="width: 50px; height: 50px; margin-right: 20px;" />Create Task
                         </h1>

                <div class="row">
                    <div class="col-md-6">
                        <!-- First column items -->
                        <div class="form-group">
                            <label for="TitleTextBox" style="font-weight: bold; font-size: 16px;">Title:</label>
                            <asp:TextBox ID="TitleTextBox" runat="server" required="true" PlaceHolder="Enter First Title" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" ControlToValidate="TitleTextBox" ErrorMessage="Title is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="DropDownPriority" style="font-weight: bold; font-size: 16px;">Priority Level:</label>
                            <asp:DropDownList ID="DropDownPriority" OnSelectedIndexChanged="DropDownPriority_SelectedIndexChanged" Style="width: 100%" runat="server" required="true" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPriority" ControlToValidate="DropDownPriority" InitialValue="" ErrorMessage="Priority Level is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Second column items -->
                        <div class="form-group">
                            <label for="CreateOnBehaldDropDown" style="font-weight: bold; font-size: 16px;">Create on Behalf Of:</label>
                            <asp:DropDownList ID="CreateOnBehaldDropDown" OnSelectedIndexChanged="CreateOnBehaldDropDown_SelectedIndexChanged" Style="width: 100%" runat="server" required="true" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCreateOnBehalf" ControlToValidate="CreateOnBehaldDropDown" InitialValue="" ErrorMessage="Create on Behalf Of is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="DueDateCalender" style="font-weight: bold; font-size: 16px;">Due date:</label>
                            <asp:TextBox ID="TxtDueDateCalender" runat="server" CssClass="form-control mb-3" Placeholder="Expense Date" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDueDate" ControlToValidate="TxtDueDateCalender" ErrorMessage="Due date is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Third column items -->
                        <div class="form-group">
                            <label for="DropDownClient" style="font-weight: bold; font-size: 16px;">Client:</label>
                            <asp:DropDownList ID="DropDownClient" OnSelectedIndexChanged="DropDownClient_SelectedIndexChanged" Style="width: 100%" runat="server" required="true" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvClientCol3" ControlToValidate="DropDownClient" InitialValue="" ErrorMessage="Client is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="DescriptionTextBox" style="font-weight: bold; font-size: 16px;">Description:</label>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" required="true" PlaceHolder="Enter First Description" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescription" ControlToValidate="DescriptionTextBox" ErrorMessage="Description is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Fourth column items -->
                        <div class="form-group">
                            <label for="DropDownStatus" style="font-weight: bold; font-size: 16px;">Status:</label>
                            <asp:DropDownList ID="DropDownStatus" OnSelectedIndexChanged="DropDownStatus_SelectedIndexChanged" Style="width: 100%" runat="server" required="true" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvStatus" ControlToValidate="DropDownStatus" InitialValue="" ErrorMessage="Status is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="AssignToDropDown" style="font-weight: bold; font-size: 16px;">Assign To:</label>
                            <asp:DropDownList ID="AssignToDropDown" OnSelectedIndexChanged="AssignToDropDown_SelectedIndexChanged" Style="width: 100%" runat="server" required="true" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvAssignTo" ControlToValidate="AssignToDropDown" InitialValue="" ErrorMessage="Assign To is required" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group text-center">
                    <asp:Button ID="BtnCreate" Text="Create" BackColor="#2507B3" CssClass="btn btn-primary mt-3" Height="40px" Width="100%" runat="server" OnClick="Unnamed_Click" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>

