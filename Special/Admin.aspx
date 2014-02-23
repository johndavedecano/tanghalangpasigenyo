<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
.imgs
{
    position:static;
                width: 220px;
            height:80px;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div>
        <h1 style="color: #0066dd; font-size:30px">Welcome!!</h1>
        </div>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/1.png" onclick="ImageButton1_Click" />
        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/2.png" onclick="ImageButton2_Click" />
        <asp:ImageButton ID="ImageButton3" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/3.png" onclick="ImageButton3_Click" />
        <asp:ImageButton ID="ImageButton4" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/4.png" onclick="ImageButton4_Click" />
        <asp:ImageButton ID="ImageButton5" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/5.png" onclick="ImageButton5_Click" />
        <asp:ImageButton ID="ImageButton6" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/6.png" onclick="ImageButton6_Click" />
        <asp:ImageButton ID="ImageButton7" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/7.png" onclick="ImageButton7_Click" />
        <asp:ImageButton ID="ImageButton8" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/8.png" onclick="ImageButton8_Click" />
            <asp:ImageButton ID="ImageButton9" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/10.png" onclick="ImageButton9_Click"/>
            <asp:ImageButton ID="ImageButton10" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/11.png" onclick="ImageButton10_Click"  />
            <asp:ImageButton ID="ImageButton11" runat="server" CssClass="imgs" 
            ImageUrl="~/Resources/buttons/9.png" onclick="ImageButton11_Click" />
        <br />
</asp:Content>
