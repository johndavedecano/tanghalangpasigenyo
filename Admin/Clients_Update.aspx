<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clients_Update.aspx.cs" Inherits="Admin_Clients_Update" MasterPageFile="~/Site2.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<link rel="stylesheet" type="text/css" href="styles.css" />
<link href="../Styles/Site2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="sliding_effect.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="UserNotFound" runat="server">
        <div class="alert alert-danger">
            <p>Client was not found. <a href="Clients.aspx">Back To List</a></p>
        </div>
    </asp:Panel>
    <asp:Panel ID="ClientForm" runat="server">
    <div class="panel" id="add-user">
        <h3 class="panel-header">Update Information</h3>
        <div class="panel-body">
            <asp:Panel ID="Notifications" runat="server">
                <asp:Label ID="NotificationsMessage" runat="server"></asp:Label>
            </asp:Panel>
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
                        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="Email" ForeColor="red" Display="Dynamic" ErrorMessage="Invalid Email Address" />
                     </div>
                     <div class="clear"></div>
                </div>

                <div class="form-holder">
                    <div class="half">
                    <label>Username:</label>
                    <asp:TextBox id="UserName" runat="server" Enabled="false"/>
                    <asp:RequiredFieldValidator id="UsernameRequiredValidator" runat="server"
                        ControlToValidate="UserName" ForeColor="red"
                        Display="Dynamic" ErrorMessage="Required"/>
                    </div>

                    <div class="half last">
                        <label>Contact Number:</label>
                        <asp:TextBox id="ClientContactNo" runat="server" />
                       
                     </div>
                     <div class="clear"></div>
                </div>

                <div class="form-holder">
                    <div class="half">
                    <label>Address:</label>
                    <asp:TextBox id="ClientAddress" runat="server" />
                    </div>
                    <div class="half last">
                        <label>Company:</label>
                        <asp:TextBox id="ClientCompany" runat="server" />
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
                        <label>Change Status:</label>
                        <asp:DropDownList ID="UserStatus" runat="server">
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>
                     </div>
                    <div class="half last">
                        <label>Employee Role:</label>
                        <asp:TextBox ID="RolesDropdown" runat="server" Text="client" Enabled="false"></asp:TextBox>
                     </div>
                     <div class="clear"></div>
                </div>
                <div class="form-holder">
                    <asp:Button ID="Button1" runat="server" Text="Update" CssClass="add-button" OnClick="UpdateClient_OnClick"/>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>
    </asp:Panel>
</asp:Content>
