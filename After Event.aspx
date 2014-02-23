<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site3.master" AutoEventWireup="true" CodeFile="After Event.aspx.cs" Inherits="Tentative" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        
        .style1
        {
            width: 140px;
        }
        
        .liit
        {
            width: 40px;
        }
        
        .link
        {
            color: Blue;
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <fieldset title="sdas">
    <legend>List of Held Events </legend>
    <br />
    <table align="center">
        <tr>
            <td>Search by Date</td>
            <td class="liit"></td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td class="liit"></td>
            <td><asp:Button ID="Button1" runat="server" Text="SEARCH" /></td>
        </tr>
    </table>
    <br />
    <table border="1" align=center cellpadding="5">
        <tr>
            <th class="style1">Name of Event</th>
            <th class="style1">Date</th>
            <th class="style1">Time</th>
            <th class="style1">Client</th>
            <th class="style1">Action</th>

        </tr>
        <tr>
            <td>Birthday</td>
            <td align="center">March 12 2012</td>
            <td align="center">8:00am</td>
            <td>Izah Tracy Pilano</td>
            <td align="center" class="link">Create Events Opertion Summary</td>
        </tr>
        <tr>
            <td>Seminar</td>
            <td align="center">May 17 2011</td>
            <td align="center">10:00am</td>
            <td>Lina Cruz</td>
            <td align="center" class="link">&nbsp;</td>
        </tr>
        <tr>
            <td>Job Fair</td>
            <td align="center">June 23 2011</td>
            <td align="center">8:00am</td>
            <td>Henry Sy</td>
            <td align="center" class="link">&nbsp;</td>
        </tr>
        <tr>
            <td>Basketball Tournament</td>
            <td align="center">June 2 2011</td>
            <td align="center">1:00pm</td>
            <td>Rusty Ramos</td>
            <td align="center" class="link">&nbsp;</td>
        </tr>
        <tr>
            <td>PXC Championship</td>
            <td align="center">August 3 2011</td>
            <td align="center">7:00pm</td>
            <td>Janell Solinap</td>
            <td align="center" class="link">
                &nbsp;</td>
        </tr>
        </table>
</fieldset>
</asp:Content>

