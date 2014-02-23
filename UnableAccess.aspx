<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UnableAccess.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
     .style1
     {
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border: 1px solid gray; 
        width: 600px;
        margin: auto;
        padding:20px
     }        
     .style2
     {
         border-bottom: 1px solid gray;
         font-size: larger;
         color:Black;
     }
     img.too
     {
         position:static;
         height: 15px;
         width: 15px;
         }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<div class="style1">
<div class="style2">
<img src="Resources/warning.png" height="20" width="20" alt="1" class="too" /> 
    The page you requested was not found.
</div>
<div><br />You may have clicked an expired link, may&nbsp; ntyped the address or you have no 
    rights to access the page.
<ul>
<li>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Return Home</asp:HyperLink>
    </li>
</ul>
</div>
</div>

</asp:Content>

