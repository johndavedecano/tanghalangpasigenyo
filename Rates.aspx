<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Rates.aspx.cs" Inherits="About_Us" %>

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
        font-weight: bold;
        color: #FF3300;
        text-shadow: 1px 1px #fff;
        border-bottom: 1px solid gray;
        padding: 5px;
            font-style: normal;
            font-variant: normal;
            font-size: 25px;
            line-height: normal;
            font-family: Cambria, Georgia, "Times New Roman", Serif;
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
        .style2
        {
            width: 100%;
        }
        .style3
        {
            color: #000000;
        }
        .style11
        {
            width: 62px;
        }
        .style12
        {
            width: 72px;
            height: 21px;
        }
        .style13
        {
        }
        .style18
        {
            width: 184px;
        }
        .style23
        {
            border-style: outset;
            border-width: 1px;
            padding: 1px 4px;
            color: #000000;
        }
        .style24
        {
            border-style: outset;
            border-width: 1px;
            padding: 1px 4px;
            width: 184px;
            color: #FF3300;
        }
        .style25
        {
            border-style: outset;
            border-width: 1px;
            padding: 1px 4px;
            width: 465px;
            height: 21px;
            color: #000000;
        }
        .style26
        {
            border-style: outset;
            border-width: 1px;
            padding: 1px 4px;
            width: 184px;
            height: 21px;
            color: #FF3300;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <table class="style2">
                
         <span class="style3">  <br />
&nbsp;To avail the following facilities for your event please 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/Register.aspx">Register </asp:HyperLink> &nbsp;to 
        create a new account or 
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/Account/Login.aspx">Log-In</asp:HyperLink> &nbsp;to the 
        website.<br />
        </span>
     
        <tr>
            <td class="style11" rowspan="4"><br />
               <asp:ImageButton ID="ImageButton4" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/asemblea magna.gif" Width="230px" 
        CssClass="imgssss" PostBackUrl="~/Account/Login.aspx" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></td>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Facility Name:</td>
            <td class="style23" style="border-color: #FFFF80">
                <strong>&nbsp;<span class="style3"><asp:HyperLink ID="HyperLink3" 
                    runat="server" NavigateUrl="~/Account/Register.aspx">Asemblea Magna</asp:HyperLink> 
        </span>
     
                </strong></td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                Type / Capacity:</td>
            <td class="style25" style="border-color: #FFFF80">
                Graduation, seminar, conferences (Below 500 pax)</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                First Three Hours:</td>
            <td class="style25" style="border-color: #FFFF80">
                15,000.00</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Rate per Hours:</td>
            <td class="style23" style="border-color: #FFFF80">
                500.00</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style11" rowspan="4"><br />
               <asp:ImageButton ID="ImageButton7" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/pista ng bayan.gif" Width="230px" 
        CssClass="imgssss" PostBackUrl="~/Account/Login.aspx" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></td>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Facility Name:</td>
            <td class="style23" style="border-color: #FFFF80">
                <strong><span class="style3">&nbsp;<asp:HyperLink ID="HyperLink4" 
                    runat="server" NavigateUrl="~/Account/Register.aspx">Pista ng Bayan</asp:HyperLink> 
        </span>
     
                </strong></td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                Type / Capacity:</td>
            <td class="style25" style="border-color: #FFFF80">
                Receptions, meetings, conferences (70 pax)</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                First Three Hours:</td>
            <td class="style25" style="border-color: #FFFF80">
                7, 500.00</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Rate per Hours:</td>
            <td class="style23" style="border-color: #FFFF80">
                500.00</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style11" rowspan="4"><br />
               <asp:ImageButton ID="ImageButton2" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/nagsabado.gif" Width="230px" 
        CssClass="imgssss" PostBackUrl="~/Account/Login.aspx" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></td>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Facility Name:</td>
            <td class="style23" style="border-color: #FFFF80">
                <strong><span class="style3">&nbsp;<asp:HyperLink ID="HyperLink5" 
                    runat="server" NavigateUrl="~/Account/Register.aspx">Nagsabado</asp:HyperLink> 
        </span>
     
                </strong></td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                Type / Capacity:</td>
            <td class="style25" style="border-color: #FFFF80">
                Meetings & conferences (60 pax)</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                First Three Hours:</td>
            <td class="style25" style="border-color: #FFFF80">
                4000.00</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Rate per Hours:</td>
            <td class="style23" style="border-color: #FFFF80">
                500.00</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style11" rowspan="4"><br />
                 <asp:ImageButton ID="ImageButton8" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/dalampasigan.gif" Width="230px" 
        CssClass="imgssss" PostBackUrl="~/Account/Login.aspx" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></td>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Facility Name:</td>
            <td class="style23" style="border-color: #FFFF80">
                <strong><span class="style3">&nbsp;<asp:HyperLink ID="HyperLink6" 
                    runat="server" NavigateUrl="~/Account/Register.aspx">Dalampasigan</asp:HyperLink> 
        </span>
     
                </strong></td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                Type / Capacity:</td>
            <td class="style25" style="border-color: #FFFF80">
                Meetings & conferences (60 pax)</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                First Three Hours:</td>
            <td class="style25" style="border-color: #FFFF80">
                4,000.00</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Rate per Hours:</td>
            <td class="style23" style="border-color: #FFFF80">
                500.00</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style11" rowspan="4"><br />
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/halamanan ni mutya.gif" Width="230px" 
        CssClass="imgssss" PostBackUrl="~/Account/Login.aspx" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></td>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Facility Name:</td>
            <td class="style23" style="border-color: #FFFF80">
                <strong><span class="style3">&nbsp;<asp:HyperLink ID="HyperLink7" 
                    runat="server" NavigateUrl="~/Account/Register.aspx">Halamanan ni Mutya</asp:HyperLink> 
        </span>
     
                </strong></td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                Type / Capacity:</td>
            <td class="style25" style="border-color: #FFFF80">
                Garden Setting (250 pax)</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                First Three Hours:</td>
            <td class="style25" style="border-color: #FFFF80">
                5,000.00</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Rate per Hours:</td>
            <td class="style23" style="border-color: #FFFF80">
                500.00</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style11" rowspan="4"><br />
        <asp:ImageButton ID="ImageButton6" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/main lobby.gif" Width="230px" 
        CssClass="imgssss" PostBackUrl="~/Account/Login.aspx" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/></td>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Facility Name:</td>
            <td class="style23" style="border-color: #FFFF80">
                <strong><span class="style3">&nbsp;<asp:HyperLink ID="HyperLink8" 
                    runat="server" NavigateUrl="~/Account/Register.aspx">Main Lobby</asp:HyperLink> 
        </span>
     
                </strong></td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                Type / Capacity:</td>
            <td class="style25" style="border-color: #FFFF80">
                Receptions (250 pax)</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style26" style="border-color: #FFFF80">
                First Three Hours:</td>
            <td class="style25" style="border-color: #FFFF80">
                10,000.00</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style24" style="border-color: #FFFF80">
                Rate per Hours:</td>
            <td class="style23" style="border-color: #FFFF80">
                1000.00</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
         
        </table>
    
  <br />
  <br />
        
           
            
       
    
</asp:Content>

