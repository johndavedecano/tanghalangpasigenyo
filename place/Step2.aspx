<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Step2.aspx.cs" Inherits="client_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        .eventinfo
        {
            width:350px;
            height:auto;
            margin:auto;
        }
        .fields
        {
            float:right;
            width:170px;
            height: 20px;
            padding-bottom:10px;
        }
        .labels
        {
            float:left; 
            clear:both;
            width: 150px;
            height: 20px;
            padding-bottom:10px;
            color:#ff3300;
        }
        fieldset
        {
            border:1px solid #0088cc;
            color:Black;
        }
        legend
        {
            color:#000000;
        }
        
        .style2
        {
            font-family: "Book Antiqua";
        }
        .style3
        {
            font-family: "Book Antiqua";
            font-size: x-large;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
 
<div id="maincontent">
        <ul id="mainNav" class="fiveStep" style="margin:0px">
		<li class="lastDone"><a title=""><em>Step 1:</em><span>Know the Service</span></a></li>
		<li class="current"><a title=""><em>Step 2:</em><span>Choose Facility</span></a></li>
		<li ><a title=""><em>Step 3:</em><span>Available Date</span></a></li>
		<li><a title=""><em>Step 4:</em><span>Available Time</span></a></li>
		<li class="mainNavNoBg"><a title=""><em>Step 5:</em> <span>Finalize</span></a></li>
	</ul>
    <br />
    <br />    
    
    <div style="text-align:center; color: #000000;">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <span class="style3">
        <br />
        Facility for your Reservation<br /> </span> <br />
        After finalizing this reservation which you can able to add amenities for your 
        reservation. <span class="style2">
        <br /></span><br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
         <ContentTemplate>  
             
             Event Name:&nbsp;&nbsp;
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 ControlToValidate="TextBox1" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
             <br /><br />
             Facility to be use:&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EventTypeSelect" 
                    DataTextField="EventName" DataValueField="EventID" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>

        </ContentTemplate>  
    </asp:UpdatePanel>
            <div style="height:20px">
        <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
            DisplayAfter="0">
        <ProgressTemplate>
                    <img alt="progress" src="../Styles/ajax-loader.gif" style="position:static; width:30px;height:30px"/>
                Processing...
        </ProgressTemplate>
        </asp:UpdateProgress>
        </div>
        <asp:SqlDataSource ID="EventTypeSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            
            SelectCommand="SELECT EventID, EventName FROM EventTBL WHERE (VenueID = @VenueID) AND (isDeleted = 0)" 
            UpdateCommand="UPDATE EventTBL SET EventName = 'Asemblea', EventType = 'Big Event', EventDetails = 'Graduations, seminars, conferences (Below 500 pax)', RateperHour = '3000', FirstFourHourRate = '2000', ReservationFee = '1000', OperationalExpense = '0', PerformanceBond = '0' WHERE (EventID = '1')">
            <SelectParameters>
                <asp:SessionParameter Name="VenueID" SessionField="VenueId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="eventinfo">
                <fieldset style="border-color: #FF3300">
                    <legend>Details</legend>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="EventDetails">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style="">
                            <div style="visibility: hidden">
                             <div class="labels">Type of Event:</div>
                            <div class="fields">
                            <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' />
                            </div>
                             </div>
                            <div style="color:#ff3300">Reservation Details:</div>
                            <asp:Label ID="EventDetailsLabel" runat="server" 
                                Text='<%# Eval("EventDetails") %>' />
                          <div style="visibility: hidden">
                            <div class="labels">Operational Expense:</div>
                            <div class="fields"><asp:Label ID="OperationalExpenseLabel" runat="server" 
                                Text='<%# Eval("OperationalExpense","{0:n2}") %>' />
                            </div></div>
                            <div class="labels">First Three Hour Rate:</div>
                            <div class="fields"><asp:Label ID="FirstFourHourRateLabel" runat="server" 
                                Text='<%# Eval("FirstFourHourRate","{0:n2}") %>'/>
                            </div>
                            <br />
                            <div class="labels">Rate per Hour:</div>
                            <div class="fields"><asp:Label ID="RateperHourLabel" runat="server" 
                                Text='<%# Eval("RateperHour","{0:n2}") %>' />
                            </div>
                            <br />
                            <div class="labels">Reservation Fee:</div>
                            <div class="fields"><asp:Label ID="ReservationFeeLabel" runat="server" 
                                Text='<%# Eval("ReservationFee","{0:n2}") %>' />
                            </div>
                             <div class="labels">Chairs:</div>
                            <div class="fields"><asp:Label ID="Label1" runat="server" 
                                Text='<%# Eval("Chairs","{0:n2}") %>' />
                            </div>
                             <div class="labels">Tables:</div>
                            <div class="fields"><asp:Label ID="Label2" runat="server" 
                                Text='<%# Eval("Tables","{0:n2}") %>' />
                            </div>
                            <div style="visibility: hidden">
                            <div class="labels">Performance Bond:</div>
                            <div class="fields"><asp:Label ID="PerformanceBondLabel" runat="server" 
                                Text='<%# Eval("PerformanceBond","{0:n2}") %>' />
                            </div>
                             </div>
                 
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div ID="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                            </asp:DataPager>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                            
                    </asp:ListView>
                   
                    <asp:SqlDataSource ID="EventDetails" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                        SelectCommand="SELECT [EventDetails], [EventType], [RateperHour], [FirstFourHourRate], [ReservationFee], [OperationalExpense], [PerformanceBond], [Chairs], [Tables] FROM [EventTBL] WHERE ([EventID] = @EventID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="EventID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DropDownList1" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <div style="text-align:center">

        <br /> 
        <asp:Button ID="Button1" runat="server" Text="Back" onclick="Button1_Click" 
            CausesValidation="False" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Go to Next Step" 
            onclick="Button2_Click" />
    </div>
    <br />
    <br />
    <br />
    <br />
</div>


    
<div id="sidebar" class="style6">
    &nbsp;<span class="style5"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We 
    offers different<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function rooms:</strong></span><br />
    &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton10" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/main lobby.jpg" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span class="style4"><strong><span class="style1">Asemblea Magna</span></strong></span><br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton11" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/pista ng bayan.jpg" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
     &nbsp;&nbsp;
    <span class="style4"><span class="style1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    Pista ng Bayan</strong></span></span><br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton12" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/nagsabado2.jpg"  Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    &nbsp;&nbsp;
    <span class="style4"><span class="style1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    Nagsabado</strong></span></span><br />
    &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton1" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/main lobby.jpg" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
                     <br />
     &nbsp;&nbsp;&nbsp;&nbsp;
    <span class="style4"><span class="style1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Main Lobby</strong></span></span><br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton2" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/halamanan ni mutya.jpg"  Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    &nbsp;&nbsp;
    <span class="style4"><span class="style1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Halamanan ni 
    Mutya</strong></span></span><br />
    &nbsp;&nbsp;
       
    <br />
   
    <br />
    </div>
</div>
</asp:Content>

