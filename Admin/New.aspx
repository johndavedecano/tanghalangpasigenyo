<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="New.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
		<link rel="stylesheet" type="text/css" href="styles.css" />
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="sliding_effect.js"></script>
    <style type="text/css">
        
.imgs
{
    position:static;
                width: 220px;
            height:80px;
}
.postdate {
  position: relative;
  width: 50px;
  height: 50px;
  float: left;
  padding-bottom: 5px;
}
.month, .day, .year { 
  position: absolute; 
  text-indent: -1000em;
  background-image: url(../Styles/dates.png);
  background-repeat: no-repeat;
}
.month { top: 2px; left: 0; width: 32px; height: 24px;}
.day { top: 25px; left: 0; width: 32px; height: 25px;}
.year { bottom: 4; right: 0; width: 17px; height: 48px;}

.m-1 { background-position: 0 4px;}
.m-2{background-position: 0 -28px}
.m-3{background-position: 0 -59px}
.m-4{background-position: 0 -90px}
.m-5{background-position: 0 -121px}
.m-6{background-position: 0 -152px}
.m-7{background-position: 0 -183px}
.m-8{background-position: 0 -214px}
.m-9{background-position: 0 -245px}
.m-10{background-position: 0 -276px}
.m-11{background-position: 0 -307px}
.m-12{background-position: 0 -338px}

.d-1{background-position: -50px -0px}
.d-2{background-position: -50px -31px}
.d-3{background-position: -50px -62px}
.d-4{background-position: -50px -93px}
.d-5{background-position: -50px -124px}
.d-6{background-position: -50px -155px}
.d-7{background-position: -50px -186px}
.d-8{background-position: -50px -217px}
.d-9{background-position: -50px -248px}
.d-10{background-position: -50px -279px}
.d-11{background-position: -50px -310px}
.d-12{background-position: -50px -341px}
.d-13{background-position: -50px -372px}
.d-14{background-position: -50px -403px}
.d-15{background-position: -50px -434px}
.d-16{background-position: -50px -465px}
.d-17{background-position: -100px -0px}
.d-18{background-position: -100px -31px}
.d-19{background-position: -100px -62px}
.d-20{background-position: -100px -93px}
.d-21{background-position: -100px -124px}
.d-22{background-position: -100px -155px}
.d-23{background-position: -100px -186px}
.d-24{background-position: -100px -217px}
.d-25{background-position: -100px -248px}
.d-26{background-position: -100px -279px}
.d-27{background-position: -100px -310px}
.d-28{background-position: -100px -341px}
.d-29{background-position: -100px -372px}
.d-30{background-position: -100px -403px}
.d-31{background-position: -100px -434px}


.y-2012{background-position: -150px -0px}
.y-2013{background-position: -150px -50px}
.y-2014{background-position: -150px -100px}
.y-2015{background-position: -150px -150px}
.y-2016{background-position: -150px -200px}
.y-2017{background-position: -150px -250px}
.y-2018{background-position: -150px -300px}
.y-2019{background-position: -150px -350px}
.y-2020{background-position: -150px -400px}

.c1
{
    width: 220px;
    height: 90px;
    background: #56adfa;
}

.postdate
{
    margin-top: 15px;
    margin-left: 15px;
}

#dsl
{
    color: White;
    padding-top: 20px;
    padding-left: 20px;
    font-size: 30px;
}

.c1:hover
{
        background: #2B4F81;
}

.accd li
{
    list-style-type: none;
}
  #navlist ul
  {
    width: 200px;
    color: white;
  }

  #navlist li
  {
    list-style-type: none;
    float: left;
    width: 105px;
    font-size: 11px;
    font-family: century gothic;
    color: white;
    height: 50px;
    background: #56adfa;
    margin-left: 5px;
    margin-bottom: 5px;
  }
  #navlist li:hover
  {
      background: #2B4F81;
  }
   #block
  {
    list-style-type: none;
    float: left;
    width: 200px;
    font-size: 11px;
    font-family: century gothic;
    color: white;
    height: 50px;
    background: black;
    margin-left: 5px;
    margin-bottom: 5px;
  }
  #navlist li a
  {
    color: #fff;
     font-weight: bold;
  }

  #navlist li a:hover
  {
    color: #fff;
    font-weight: bold;
  }
  
  #navlist br
  {
    clear: left;
  }

  #navlist
  {
    margin-bottom: 1em;
  }
   #navlist a
  {
    text-decoration:none;
  }
  
  #navigation-block
  {
      margin-left:-42px;
  }
  #logo1
{
	width: 105px;
	float: left;
}
#logo1 a
{
	height: 50px;
	border: none;
	width: 105px;
	float: left;
}
  #logo3
{
	width: 105px;
	float: left;
}
#logo3 a
{
	height: 105px;
	border: none;
	width: 105px;
	float: left;
}
  #logo2
{
	width: 215px;
	float: left;
}
#logo2 a
{
	height: 50px;
	border: none;
	width: 215px;
	float: left;
}
  
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="sidebar">
<div class="c1">
<div class="postdate">
        <div class='month m-8'>Jun</div>
        <div class='day d-28'>30</div> 
        <div class='year y-2012'>2009</div> 
</div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer runat="server" id="UpdateTimer" interval="1000" ontick="UpdateTimer_Tick" />
        <asp:UpdatePanel runat="server" id="TimedPanel" updatemode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger controlid="UpdateTimer" eventname="Tick" />
            </Triggers>
            <ContentTemplate>
                <div id="dsl">&nbsp;<asp:Label runat="server" id="DateStampLabel" /></div>
            </ContentTemplate>
        </asp:UpdatePanel>

</div>
<div id="navigation-block">  
            <ul id="navlist">  
                <li class="sliding-element" id="logo1"><a href="#">Tentative Reservation</a></li>  
                <li class="sliding-element" id="logo1"><a href="#">Request Reschedule</a></li> <br /> 
                <li class="sliding-element" id="logo1"><a href="#">Requiest for Cancelation</a></li>  
                <li class="sliding-element" id="logo1"><a href="#">Confirm Billing</a></li>  <br />
                <li class="sliding-element" style="width: 215px;" id="logo2"><a href="#">Payment</a></li>  <br />
                <li class="sliding-element" id="logo1"><a href="#">Add Practice Date Event</a></li>  
                <li class="sliding-element" id="logo1"><a href="#">Backup</a></li>  <br />
                 <li class="sliding-element" id="logo2" style="width: 215px;" ><a href="#">Events Operation Summary</a></li> <br /> 
                <li class="sliding-element" id="logo1"><a href="#">Unsettled Reservations</a></li>
                
                <li class="sliding-element" id="logo1"><a href="#">Release Checks</a></li> 
            </ul>  
</div> 
</div>
<div id="maincontent">asdasd</div>
</asp:Content>

