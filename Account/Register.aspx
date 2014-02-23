<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css"> 
.createUser 
{ 
 width: 350px; 
 font: 12px Calibri, Sans-Serif; 
 background-color: silver; 
 border: solid 3px black; 
 padding: 5px; 
} 
.user_title 
{ 
 background-color: blue; 
 color: silver; 
 font-weight: bold;
}
.createUser_instructions 
{ 
 font-size: 12px; text-align: left; padding: 10px; 
} 
.createUser_button 
{ 
border: solid 1 px black; padding: 3px; 
} 
    .style2
    {
        height: 21px;
    }
    .notif
    {
        color: #000000;
        font-size: large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
 
    <div id="maincontent">

                   
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        FinishDestinationPageUrl="~/Admin.aspx" 
        oncreateduser="CreateUserWizard1_CreatedUser" Width="387px">

        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" >
                <ContentTemplate>
                <div class="notif">Create New Account&nbsp; </div>
                <p style="color: #000000">
                    Use the form below to create a new account.
                </p>
                <p style="color: #000000">
                    Passwords are required to be a minimum of 6 characters in length.
                </p>
                <fieldset class="register">
                <legend style="color: #000000">Sign Up for Your New Account</legend>
                
    

                                <p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>

                                <asp:TextBox ID="UserName" runat="server" Width="320px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1" ForeColor="red">*</asp:RequiredFieldValidator>
                                </p>

                                <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>

                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="320px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1" ForeColor="red">*</asp:RequiredFieldValidator>
                                </p>

                                <p>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>

                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="320px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Confirm Password is required." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1" ForeColor="red">*</asp:RequiredFieldValidator>
                                </p>

                                <p>
                                <asp:Label ID="EmailLabel" runat="server" visible="false" AssociatedControlID="Email">E-mail:</asp:Label>

                                <asp:TextBox ID="Email" runat="server" Width="320px" visible="false"></asp:TextBox>
                                                       </p>

                                
                     </fieldset>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="The Password and Confirmation Password must match." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>

                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>


                </ContentTemplate>
                <CustomNavigationTemplate>
                    <table border="0" cellspacing="5" style="width:100%;height:100%;">
                        <tr align="right">
                            <td align="right" colspan="0">
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                    Text="Create Account" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
                <ContentTemplate>
                <div class="notif">Your account has been successfully created.</div>
                        
                    <table>
                     
                        <tr>
                            <td class="style2" style="color: #000000">
                                <br />
                                Proceed to your information to complete your registration.
                                 </td>
                        </tr>
                        <tr>
                            <td align="left">
                               <br />  <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                    CommandName="Continue" onclick="ContinueButton_Click" Text="Continue" 
                                    ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                         <tr>
                            <td align="center">
                            <br/>
                                             <asp:ImageButton ID="ImageButton4" runat="server" Height="280px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/Welcome to Tanghalang Pasigueño.gif" Width="500px"/>
                          <br>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</div>
<div id="sidebar"></div>
</div>
</asp:Content>

