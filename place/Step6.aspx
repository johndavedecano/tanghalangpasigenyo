<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Step6.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        #sidebar
        {
        width:220px;    
        }
        #maincontent
        {
        width: 650px;    
        height: auto;
        }
        .imgssss
        {
            position:static;
        }
    .style2
    {
        color: #FF3300;
    }
    .style3
    {
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
 
<div id="maincontent" class="style3">
    <ul id="mainNav" class="fiveStep" style="margin:0px">
		<li class="done"><a title=""><em>Step 1:</em><span>Know the Service</span></a></li>
		<li class="done"><a title=""><em>Step 2:</em><span>Choose Facilty</span></a></li>
		<li class="done"><a title=""><em>Step 3:</em><span>Available Date</span></a></li>
		<li class="lastDone"><a title=""><em>Step 4:</em><span>Available Time</span></a></li>
		<li class="mainNavNoBg current"><a title=""><em>Step 5:</em> <span>Finalize</span></a></li>
	</ul>
    <div class="style3">
    <br />
    <br />    
    
    <br />
    </div>
    <div style="color: #000000;" class="style3">
        <br />
        <br />
        You have been successfully submitted your<span class="style2"><em> Tentative
        Reservation</em></span> with Reservation no:
        <asp:Label ID="Label1" runat="server" Text="Label" 
            style="text-decoration: underline"></asp:Label>
        <br />
        <br />
        Go to Tanghalang Pasigueño Administration Office in order to confirm your 
        reservation by paying your Reservation Fee and your Balance in not later than 
        seven (7) calendar days before the actual date of the use of the Tanghalang 
        Pasigueño facilities.<br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Add Additional Amenities" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Go Back to Account" />
    </div>
    <br />
    <br />
    <br />
    <br />
</div>

<div id="sidebar">
   &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton10" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/main lobby.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    <br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton11" runat="server" Height="150px" 
            
        
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/halamanan ni mutya.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
     <br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton12" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/nagsabado.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    </div>
</div>
</asp:Content>

