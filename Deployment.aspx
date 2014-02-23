<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Deployment.aspx.cs" Inherits="Deployment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 72%;
        }
        .style4
        {
            text-align: center;
        }
        #button
        {
            width:648px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <fieldset>
    <legend>
        Events Details
    </legend>
        Name of Event: PXC Pacific Extreme Championship<br />
        Start Time:&nbsp; 7:00pm<br />
        No. of Hours: 5hours<br />
        End Time:&nbsp;&nbsp; 12:00am</fieldset>
    <fieldset>
    <legend>Employee Deployment</legend>
    <table class="style1">
        <tr>
            <td style="text-align: center">
                <asp:ListBox ID="ListBox1" runat="server" Height="174px" Width="146px">
                </asp:ListBox>
            </td>
            <td class="style4">
                <asp:Button ID="Button1" runat="server" Text="Deploy" />
                <asp:Button ID="Button2" runat="server" Text="Remove" Height="26px" />
            </td>
            <td class="style4">
                <asp:ListBox ID="ListBox2" runat="server" Height="174px" Width="146px">
                </asp:ListBox>
            </td>
        </tr>
    </table>
    </fieldset>
    <div id="button"> 
        <asp:Button ID="Button3" runat="server" Text="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button4"
            runat="server" Text="Back" /></div>
</asp:Content>

