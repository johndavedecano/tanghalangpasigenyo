<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .imggg
        {
            position: static;
            width: 230px;
            height:80px;
        }
        .tes
        {
        -moz-box-shadow: 1px 2px 3px rgba(0,0,0,.5);
        -webkit-box-shadow: 1px 2px 3px rgba(0,0,0,.5);
        box-shadow: 1px 2px 3px rgba(0,0,0,.5);
        }
        .testing
        {
            background: #0088cc;
            color:White;
            }
        .testing2
        {
            background: #00bbff;
            color:White;    
        }
        .style3
        {
            color: #FF3300;
            font-size: xx-large;
            font-family: "Matura MT Script Capitals";
            font-weight: 700;
            text-align: center;
            width: 303px;
        }
        .headline
        {
            color: #000000;
        }
        .style4
        {
            font-size: 11pt;
        }
        .contentbody
        {
            font-size: medium;
            color: #000000;
        }
        .style5
        {
            font-size: medium;
            text-align: center;
            color: #000000;
        }
        .notif
        {
            text-align: center;
            width: 928px;
        }
        </style>
    <link rel="Stylesheet" type="text/css" href="nivo/themes/orman/orman.css" media="screen" />
    <link rel="Stylesheet" type="text/css" href="nivo/nivo-slider.css" media="screen" />
    <script type="text/javascript" src="nivo/scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="nivo/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $("#nivo").nivoSlider();
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="wrapper">
  
  <div id="maincontent">
  <div id="slideshow">
      <div class="slider-wrapper theme-orman">
        <div id="nivo" class="nivoSlider">
            <img src="nivo/images/1.jpg" alt="" />
            <img src="nivo/images/2.jpg" alt=""/>
            <img src="nivo/images/3.jpg" alt=""/>
            </div>
        <div id="htmlcaption" class="nivo-html-caption">
            <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
        </div>
  </div>

  </div>
    <div >
        <div class="content2">
    <div class='headline' 
                style="background-color: #FFFF80; font-size: 16px; ">Office Hours</div>
    <div class='contentbody'>
        <br />
    Office Hours is from 8:00am to 5:00pm,<br />
        from Mondays to Fridays.
        <br />
    <br>
We accept events beyond office hours<br />
        and during Saturdays and Sundays. During these times, the admin office is open.
</div>   
  </div>
  <div class="content2">
    <div class='headline' 
          style="background-color: #FFFF80; font-size: 16px; ">Steps on Availing Services</div>
    <div class='contentbody'>
         <span class="style4">
         <br />
         <strong>Step 1: </strong>Create an account and fillup your Client Information
      <a href="Account/Register.aspx">&lt;Signup here&gt; </a>
      <br />
         <strong>Step 2:</strong> Click on RESERVE NOW and fillup the informations required.<br />
         <strong>Step 3:</strong> Pay Reservation Fee for&nbsp; Event to block the designated Date.<br />
         <strong>Step 4:</strong> Confirm your Billing Statement.<br />
         <strong>Step 5:</strong> Pay the Remaining Balance <br />
         </span>
      <br /></div>   
  </div>

    </div>
  </div>
  <div id="sidebar">
      <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
      </asp:ToolkitScriptManager>
          <asp:SqlDataSource ID="ReservedDateSelect" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT DateRecord, VenueId, Type FROM DateRepository WHERE (VenueId = @VenueId)">
              <SelectParameters>
                  <asp:Parameter Name="VenueId" DefaultValue="1" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="ReservedDateSelect0" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
          SelectCommand="SELECT DateRecord, VenueId, Type FROM DateRepository WHERE (VenueId = @VenueId)">
              <SelectParameters>
                  <asp:Parameter Name="VenueId" DefaultValue="2" />
              </SelectParameters>
          </asp:SqlDataSource>
      <br />
            
<div id="Div1"> 
<br> 
<marquee  behavior="scroll" direction="up" speed="2" class="style3">
<br />
Pasig's New Seat of Culture<br /> 
and<br /> 
the Arts<br /> 
is also the stunning background of your event. <br /> 
<br /></marquee><br />
<br /><br /><br /><br />
    <br />
    <div >
        <div class='content1'>
    <div class='style5'>
        <br />
     "Tanghalang Pasigueño is more than just a majestic venue for events. It is a symbol of Pasig City's drive for excellence. It is a tribute to the city's glorious past. And it celebrated the Pasigueños passion for culture and the arts." 
        <br />
        <br /> - Mayor B.E.
        <br />
    </div>
    </div>
</div>
    <div >
  </div>
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
   <br />
  <br />

 
    </div>
    
  </div>
  
</asp:Content>
