<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            color: #FF3300;
        }
        .style3
        {
            font-family: "Book Antiqua";
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
 
<div id="maincontent" style="height: auto; margin-bottom: 20px;">
    <span class="style3">Log In</span>
    <p style="color: #000000">
        Please enter your username and password 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/Register.aspx">Register</asp:HyperLink> &nbsp;if you don't have an account.
    </p>

    <asp:Login ID="Login1" runat="server" Width="394px" 
        DestinationPageUrl="~/Account/ValidationPage.aspx">
        <LayoutTemplate>
            <fieldset class="login">
            <legend>Account Information</legend>
                    <p>
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    
                    <asp:TextBox ID="UserName" runat="server" Width="320px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                        ToolTip="User Name is required." ValidationGroup="Login1" CssClass="style2">*</asp:RequiredFieldValidator>
                    </p>

                    <p>
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>

                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="320px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                        ControlToValidate="Password" ErrorMessage="Password is required." 
                        ToolTip="Password is required." ValidationGroup="Login1" ForeColor="#ff3300">*</asp:RequiredFieldValidator>
                    </p>
            </fieldset>
                    
                    
                    <table style="width: 266px">
                        <tr>
                            <td>
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                    ValidationGroup="Login1" />
                            </td>
                        </tr>
                    </table>
        </LayoutTemplate>
    </asp:Login>

</div>
<div id="slider" style="height: auto; margin-bottom: 20px;"></div>
</div>
</asp:Content>

