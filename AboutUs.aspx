<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="About_Us" %>

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
            font-family: "Times New Roman", Times, serif;
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
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="wrapper">
     
        <div id="maincontent" style="height: auto; margin-bottom: 20px; border-left: 1px solid gray;">
        
        <div>
           <div class="h11">About Us</div>
            <div class="feed">
            <div class="imghdr">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/halamanan ni mutya.jpg" 
                    Height="122px" Width="150px" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></div>
            <div class="post">
            <div class="article">
	            <p class="by"><em><strong>Tanghalang Pasigueño</strong></em> greets visitors with an 
                    ebullient fountain, lush flora and a regal Doric facade. Step inside and bask in 
                    interiors brushed with hues of autumn. Marvel at walls accentuated with 
                    intricately-carved relief and overwhelming murals. As see the elegant high 
                    ceiling with arcing buttresses and crystal chandeliers.</p>
            </div>
            </div>
            <div style="clear:both"></div>
            </div>  

            <div class="feed">
                <div class="imghdr">
               <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/pista ng bayan.jpg" 
                    Height="146px" Width="150px" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></div>
            <div class="post">
            <div class="article">
	            <p class="by">Left of the main lobby is <em><strong>Halamanan ni Mutya</strong></em> - an al 
                    fresco space with pebbled pathways. At the right wing is <em><strong>Pista ng 
                    Bayan</strong></em> - a banguet hall complete with a kitchen and exquisite 
                    dining furniture. The center is <em><strong>Asemblea Magna</strong></em>. A 
                    grand theater capable of seating 1,300 people and well-furnished to take their 
                    breaths away state-of-the-art sound and lighting equipment</p>
            </div>
            </div>
            <div style="clear:both"></div>
            </div>

            <div class="feed">
                <div class="imghdr">
               <asp:Image ID="Image3" runat="server" ImageUrl="~/Resources/asemblea magna.jpg" 
                    Height="165px" Width="150px" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></div>
            <div class="post">
            <div class="article">
	            <p class="by">Tanghalang Pasigueño</strong></em> is more than just a beautiful backdrop. More than the 
                        aesthetic, the venue has the technical chops to support your event requirements.</p>
            <p class="by"> More than just a background, the surroundings are designed to inspire. More than 
                                just Pasig&#39;s seat of culture and the arts, <strong><em>T</em></strong><em><strong>anghang 
                                Pasigueño</strong></em> 
                                is the anchor of your next unforgettable experience.</p>
          
            </div>
            </div>
            <div style="clear:both"></div>
            </div>

        </div>
         
        
        </div>
        <div id="sidebar" style="height: auto; margin-bottom: 20px; border: none; padding-top: 12px">
            <div class='h11' style="color: #FF3300; font-size: x-large;">
                Mission And Vision</div>
            <p class="auto-style1">
                To make the multi-use convention and cultural center meet the vision of Pasig City to be a world class city to be a world class city with world class environs by creating a community theater that can be an architectural landmark with a world class design. 
            </p>
            <p class="auto-style1">
                To create an auditorium that is adapted to any and all the performing arts, 
                shows, and conventions.</p>
            <p class="auto-style1">
                To expand its auditorium seating capacity from meeting hall into large scale 
                community theater.</p>
            <p class="auto-style1">
                To apply the latest technology in electronics and theater system and mixed with 
                classical influences on its structure.</p>
        </div>
    </div>
</asp:Content>

