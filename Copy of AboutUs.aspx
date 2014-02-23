<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Copy of AboutUs.aspx.cs" Inherits="About_Us" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link rel="Stylesheet" type="text/css" href="nivo/themes/orman/orman.css" media="screen" />
    <link rel="Stylesheet" type="text/css" href="nivo/nivo-slider.css" media="screen" />
    <script type="text/javascript" src="nivo/scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="nivo/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $("#nivo").nivoSlider();
        });
    </script>
    <style>
    #maincontent div
    {
        padding-left: 10px;
    }
    #main
    {
        height: auto;
    }
    .h11
    {
        color: #FF3300;
        text-shadow: 1px 1px #fff;
        border-bottom: 1px solid gray;
        padding: 5px;
            font-style: normal;
            font-variant: normal;
            font-size: x-large;
            line-height: normal;
            font-family: "Book Antiqua";
        }
    .imghdr img
    {
        position: static;
    }
    .imghdr
    {
        float:left;
        width: 150px;
        height: 100px;
        margin-left: 10px;
    }
    .post
    {
        float: right;
        width: 390px; 
    }
    .feed
    {
        height: auto;
        padding: 10px;
    }
    .headline2
    {
        font-size: 20px;
        color: #0276FD;
        font: 20px Cambria, Georgia, 'Times New Roman', Serif;
    }
    p
    {
        margin-bottom: 0;
        margin-left: 0;
        color: Black;
            text-align: justify;
        }
        .style4
        {
            font-size: 11pt;
        }
        </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="wrapper">
     
        <div id="maincontent" 
            style="height: auto; margin-bottom: 20px; border-left: 1px solid gray; ">
        
        <div>
           <div class="h11">Availing the Service</div>
            <div class="feed">
            <div style="clear:both; color: #000000;">
         <span class="style4">
         <strong>Step 1: </strong>Create an account and fillup your Client Information
      <a href="Account/Register.aspx">&lt;Signup here&gt; </a>
      <br />
         <strong>Step 2:</strong> Click on RESERVE NOW and fillup the informations required.<br />
         <strong>Step 3:</strong> Pay Reservation Fee for&nbsp;Event to block the designated Date.<br />
         <strong>Step 4:</strong> Confirm your Billing Statement.<br />
         <strong>Step 5:</strong> Pay the Remaining Balance 
         </span>
                </div>
            </div>  

            <div class="feed">
           <div class="h11">Process of Payment</div>
            </div>

            <div class="feed">
            <div style="clear:both; color: #000000; font-size: 11pt;">Go to <strong>Tanghalang Pasigueño Administration Office</strong> in order to confirm your reservation 
        by paying your Reservation Fee and your Balance.</div>
            </div>

        </div>
         
        
        </div>
        <div id="sidebar" style="height: auto; margin-bottom: 20px; border: none; padding-top: 12px">
           <div class='h11'>
                Terms and Conditions</div>
            <p class="auto-style1">
                To pay Tanghalang Pasigueño Administration Office for the Reservation Fee and 
                Balance of Rental Amount in not later than seven (7) calendar days before the 
                actual date of the use of the Tanghalang Pasigueño.</p>
            <p class="auto-style1">
                In case of postponement or cancellation of the use of Tanghalang Pasigueño 
                without any fault from the Administration, (50%) of the down payment shall be 
                forfeited by the City Government of Pasig and the same is considered as penalty</p>
            <p class="auto-style1">
                Cancellation of reserved or changes of schedules shall be made in process. </p>
            <p class="auto-style1">
                Client will be liable for damage(s) caused to equipment / facilties of 
                Tanghalang Pasigueño by the undersigned and staff / administrator.</p>
        </div>
    </div>
</asp:Content>

