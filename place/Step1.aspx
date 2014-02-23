<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Step1.aspx.cs" Inherits="client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        #sidebar
        {
        width:250px;    
        height:300px
        }
        #maincontent
        {
        width: 650px;    
        height: auto;
        }
        .imgssss
        {
            position:static;
        color: #FFFF00;
    }
    .style6
    {
        font-size: xx-large;
        font-family: "Book Antiqua";
    }
    .style4
    {
        text-decoration: underline;
    }
    .style5
    {
        color: #000000;
    }
    .style7
    {
        text-align: center;
    }
    .style8
    {
        font-family: Arial, Helvetica, sans-serif;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
 
<div id="maincontent">
        <ul id="mainNav" class="fiveStep" style="margin:0px">
		<li class="current"><a title=""><em>Step 1:</em><span>Know the Service</span></a></li>
		<li ><a title=""><em>Step 2:</em><span>Choose Facility</span></a></li>
		<li ><a title=""><em>Step 3:</em><span>Available Date</span></a></li>
		<li><a title=""><em>Step 4:</em><span>Available Time</span></a></li>
		<li class="mainNavNoBg"><a title=""><em>Step 5:</em> <span>Finalize</span></a></li>
	</ul>
        <div class="style7">
      <br />
        <br />
            <br />
            <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="style2"><span class="style8">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</span><span class="style6"><span 
            class="style4"><em>Venue Rental </em></span><span class="style5">is the 
        service of&nbsp;&nbsp;&nbsp;&nbsp; Tanghalan Pasigeuño which you can reserve function rooms.</span></span></span><span class="style3"><br />
        </span>
        <span class="style2">
        <br />
        </span>
        </div>
        <div style="text-align:center">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
        <asp:ImageButton ID="ImageButton2" runat="server" Height="180px" 
            ImageUrl="~/Resources/venue.png" Width="190px" CssClass="imgssss" 
            onclick="ImageButton2_Click" BorderStyle="Outset" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" Height="75px" 
            ImageUrl="~/Resources/transportation.png" Width="190px" CssClass="imgssss" 
            onclick="ImageButton1_Click" visible="false"/>
           
            <br />
            <br />
            <br />
&nbsp;</div>
    <br />
    <br />
</div>

<div id="sidebar">
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton4" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/asemblea magna.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton5" runat="server" Height="150px" 
            ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/pista ng bayan.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton6" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/halamanan ni mutya.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
</div>
</div>
</asp:Content>


