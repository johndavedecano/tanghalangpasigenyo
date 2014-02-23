<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users_Add.aspx.cs" MasterPageFile="~/Site2.master" Inherits="Admin_Users_Add" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<link rel="stylesheet" type="text/css" href="styles.css" />
<link href="../Styles/Site2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="sliding_effect.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="panel" id="add-user">
        <h3 class="panel-header">Add User</h3>
        <div class="panel-body">
            <asp:Label ID="CreateAccountResults" runat="server" Text=""></asp:Label>
            <form action="" method="post">
                <div class="form-holder">
                    <div class="half">
                        <label>Firstname:</label>
                        <asp:TextBox id="FirstName" runat="server" />
                        <asp:RequiredFieldValidator id="FirstNameRequiredValidator" runat="server" ControlToValidate="FirstName" ForeColor="red" Display="Dynamic" ErrorMessage="This field is required." />
                     </div>
                    <div class="half last">
                        <label>Lastname:</label>
                        <asp:TextBox id="LastName" runat="server" />
                        <asp:RequiredFieldValidator id="LastNameValidator" runat="server" ControlToValidate="LastName" ForeColor="red" Display="Dynamic" ErrorMessage="This field is required." />
                     </div>
                     <div class="clear"></div>
                </div>
                <div class="form-holder">
                    <div class="half">
                        <label>MI:</label>
                        <asp:TextBox id="MiddleName" runat="server" />
                        <asp:RequiredFieldValidator id="MiddleNameValidator" runat="server" ControlToValidate="MiddleName" ForeColor="red" Display="Dynamic" ErrorMessage="This field is required." />
                     </div>
                    <div class="half last">
                        <label>Email Address:</label>
                        <asp:TextBox id="Email" textmode="Email" runat="server" />
                        <asp:RequiredFieldValidator id="EmailRequiredValidator" runat="server" ControlToValidate="Email" ForeColor="red" Display="Dynamic" ErrorMessage="Invalid Email Address" />
                     </div>
                     <div class="clear"></div>
                </div>
                <div class="form-holder">
                    <div class="half">
                        <label>Password:</label>
                        <asp:TextBox id="PasswordTextbox" TextMode="Password"  runat="server" />
                        <asp:RequiredFieldValidator id="PasswordRequiredValidator" runat="server"
                            ControlToValidate="PasswordTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                     </div>
                    <div class="half last">
                        <label>Password Confirmation:</label>
                        <asp:TextBox id="PasswordConfirmTextbox" TextMode="Password" runat="server" />
                        <asp:RequiredFieldValidator id="PasswordConfirmRequiredValidator" runat="server"
                                ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                                Display="Dynamic" ErrorMessage="Required" />
                        <asp:CompareValidator id="PasswordConfirmCompareValidator" runat="server"
                                ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                                Display="Dynamic" ControlToCompare="PasswordTextBox"
                                ErrorMessage="Confirm password must match password." />
                     </div>
                     <div class="clear"></div>
                </div>
                <div class="form-holder">
                    <div class="half">
                        <label>Username:</label>
                        <asp:TextBox id="UserNameTextbox" runat="server" />
                        <asp:RequiredFieldValidator id="UsernameRequiredValidator" runat="server"
                            ControlToValidate="UserNameTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                     </div>
                    <div class="half last">
                        <label>Employee Role:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server"> </asp:DropDownList>
                     </div>
                     <div class="clear"></div>
                </div>
                <div class="form-holder">
                    <asp:Button ID="Button1" runat="server" Text="Add Employee" CssClass="add-button" OnClick="CreateUser_OnClick"/>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

