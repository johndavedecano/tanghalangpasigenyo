<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users_Update.aspx.cs" MasterPageFile="~/Site2.master" Inherits="Admin_Users_Update" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<link rel="stylesheet" type="text/css" href="styles.css" />
<link href="../Styles/Site2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="sliding_effect.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="UserNotFound" runat="server">
        <div class="alert alert-danger">
            <h4>Warning!</h4>
            <p>Employee was not found. <a href="Users.aspx">Back To List</a></p>
        </div>
    </asp:Panel>
    <asp:Panel ID="UserForm" runat="server">
    <div class="panel" id="add-user">
        <h3 class="panel-header">Update Information</h3>
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
                    <label>Username:</label>
                    <asp:TextBox id="UserName" runat="server" />
                    <asp:RequiredFieldValidator id="UsernameRequiredValidator" runat="server"
                        ControlToValidate="UserName" ForeColor="red"
                        Display="Dynamic" ErrorMessage="Required"/>
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
                     </div>
                    <div class="half last">
                        <label>Password Confirmation:</label>
                        <asp:TextBox id="PasswordConfirmTextbox" TextMode="Password" runat="server" />
                        <asp:CompareValidator id="PasswordConfirmCompareValidator" runat="server"
                                ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                                Display="Dynamic" ControlToCompare="PasswordTextBox"
                                ErrorMessage="Confirm password must match password." />
                     </div>
                     <div class="clear"></div>
                </div>
                <div class="form-holder">
                    <div class="half">
                        <label>Current Role:</label>
                        <strong><asp:Label ID="CurrentRole" runat="server" Text=""></asp:Label></strong>
                     </div>
                    <div class="half last">
                        <label>Employee Role:</label>
                        <asp:DropDownList ID="RolesDropdown" runat="server"> </asp:DropDownList>
                     </div>
                     <div class="clear"></div>
                </div>
                <div class="form-holder">
                    <asp:Button ID="Button1" runat="server" Text="Update" CssClass="add-button" OnClick="UpdateUser_OnClick"/>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>
    </asp:Panel>
</asp:Content>

