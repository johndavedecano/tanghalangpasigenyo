<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Query.aspx.cs" Inherits="Query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 500px;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <fieldset>
    <legend>Query</legend>
   
   <br />
        <table class="style2">
            <tr>
                <td>
                    Select Service</td>
                <td>
                <asp:DropDownList ID="DropDownList4" runat="server">
                    </asp:DropDownList>
                    </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    Select Table</td>
                <td>
                    Select Field</td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="For Maintenance" />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Fee</asp:ListItem>
                        <asp:ListItem>Amenity</asp:ListItem>
                        <asp:ListItem>Facility</asp:ListItem>
                        <asp:ListItem>Venue</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>ID</asp:ListItem>
                        <asp:ListItem>Name</asp:ListItem>
                        <asp:ListItem>Description</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    Start Date</td>
                <td>
                    End Date</td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="For Reservation" />
                </td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="margin-left: 40px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="Reservation No." />
                </td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton4" runat="server" Text="Tags" />
                </td>
                <td style="margin-left: 40px">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>Tentative</asp:ListItem>
                        <asp:ListItem>Confirmed</asp:ListItem>
                        <asp:ListItem>Confirmed Billing Statement</asp:ListItem>
                        <asp:ListItem>Incomming Event</asp:ListItem>
                        <asp:ListItem>Held Event</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Search" />
                </td>
            </tr>
        </table>
   
   <br />
   <br />
        <table class="style3">
            <tr>
                <td class="style4" style="text-align: center">
                    <strong>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    OUTPUT<br />
                    <br />
                    <br />
                    <br />
                    </strong></td>
            </tr>
            </table>
   

    </fieldset>
</asp:Content>

