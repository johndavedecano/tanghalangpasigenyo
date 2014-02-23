<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Step5.aspx.cs" Inherits="client_Default" %>

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
        .right
        {
            float:right;
            width:320px;
        }
        .left
        {
            float:left;
            width:290px;
        }
        .fields
        {
            float:right;
            width:150px;
            height: 20px;
            padding-bottom:10px;
        }
        .fields2
        {
            float:left;
            width:180px;
            height: 20px;
            padding-bottom:10px;
            text-align:left;
        }
        .labels
        {
            float:left; 
            clear:both;
            width: 140px;
            height: 20px;
            padding-bottom:10px;
            color:#FF3300;
            
        }
        fieldset
        {
            border:1px solid #0088cc;
            color:Black;
        }
        legend
        {
            color:#0088cc;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
 
<div id="maincontent">
    <ul id="mainNav" class="fiveStep" style="margin:0px">
		<li class="done"><a title=""><em>Step 1:</em><span>Know the Service</span></a></li>
		<li class="done"><a title=""><em>Step 2:</em><span>Choose Facility</span></a></li>
		<li class="done"><a title=""><em>Step 3:</em><span>Available Date</span></a></li>
		<li class="lastDone"><a title=""><em>Step 4:</em><span>Available Time</span></a></li>
		<li class="mainNavNoBg current"><a title=""><em>Step 5:</em> <span>Finalize</span></a></li>
	</ul>
    <br />
    <br />    
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    
    <div>
    <fieldset style="border-color: #FF3300">
    <legend style="color: #000000">Reservation Details</legend>
        <div class="left">
            <div class="labels" style="visibility: hidden">
                Service Name:
            </div>
            <div class="fields" style="visibility: hidden">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="labels">
            Event Name:
            </div>
            <div class="fields">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </div>
             <div class="labels">
            Facility Name:
            </div>
            <div class="fields">
                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="labels">
            Start Time:
            </div>
            <div class="fields">
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="labels">
            No of Hours:
            </div>
            <div class="fields">
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="labels">
            End Time:
            </div>
            <div class="fields">
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </div>
             <div class="labels" style="visibility: hidden">
            Event Type:
            </div>
            <div class="fields" style="visibility: hidden">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <div class="right">
         <div class="labels" style="visibility: hidden">
            Operational Expense:
           </div>
            <div class="fields2" style="visibility: hidden">
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </div>
             <div class="labels">
           Rental Amount:
            </div>
             <div class="fields2">
                 <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
             </div>
            <div class="labels">
            Total:
            </div>
            <div class="fields2">
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="labels">
            Reservation Fee:
            </div>
            <div class="fields2">
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            </div>
              <div class="labels">
            Letter of Intent:
            </div>
            <div class="fields2" style="text-align:left">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="176px" />
            </div>
             <div class="labels" style="visibility: hidden">
            Performance Bond:
            </div>
            <div class="fields2" style="visibility: hidden">
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            </div>
          
            <div class="labels" style="text-align:right;>
                <asp:Button ID="Button1" runat="server" Text="Button" />
            &nbsp;&nbsp;&nbsp;
            </div>
            <div class="fields2" style="text-align:left">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3"
                    runat="server" Text="Submit" onclick="Button3_Click" 
                    style="height: 26px" />
                <asp:ConfirmButtonExtender ID="Button3_ConfirmButtonExtender" runat="server" 
                    ConfirmText="Are you sure with the Details of your Reservation?" Enabled="True" 
                    TargetControlID="Button3">
                </asp:ConfirmButtonExtender>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2"
                    runat="server" Text="Cancel" onclick="Button2_Click" />
            </div>
        </div>
    </fieldset>


    </div>
    <br />
    <br />
    <br />
    <br />
</div>

<div id="sidebar">
     &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton10" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/dalampasigan.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    <br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton11" runat="server" Height="150px" 
            
        
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/nagsabado.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
     <br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton12" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/pista ng bayan.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    <asp:SqlDataSource ID="EventSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [EventName], [EventType], [RateperHour], [FirstFourHourRate], [ReservationFee], [OperationalExpense], [PerformanceBond] FROM [EventTBL] WHERE ([EventID] = @EventID)">
        <SelectParameters>
            <asp:SessionParameter Name="EventID" SessionField="EventId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="VenueName" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [VenueName] FROM [VenueTBL] WHERE ([VenueId] = @VenueId)">
        <SelectParameters>
            <asp:SessionParameter Name="VenueId" SessionField="VenueId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="cid" runat="server" Visible="False"></asp:TextBox>
    <br />
    <asp:SqlDataSource ID="ClientId" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [ClientId] FROM [ClientTBL] WHERE ([UserId] = @UserId)">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="uid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="gt" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="era" runat="server" Visible="False"></asp:TextBox>
    <br />
    <asp:SqlDataSource ID="ReservationInsert" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        InsertCommand="INSERT INTO ReservationTBL(VenueId, EventId, NameofEvent, ReservationDate, ReservationStartTime, NumberofHours, ReservationEndTime, ClientId, EventReservedAmount, Tag, letterurl, grandtotal) VALUES (@VenueId, @EventId, @NameofEvent, @ReservationDate, @ReservationStartTime, @NumberofHours, @ReservationEndTime, @ClientId, @EventReservedAmount, @Tag, @letterurl, @grandtotal);SET @NewId = Scope_Identity()"
        SelectCommand="SELECT ReservationTBL.* FROM ReservationTBL" 
        oninserted="ReservationInsert_Inserted">
        <InsertParameters>
            <asp:SessionParameter SessionField="VenueId" Name="VenueId" />
            <asp:SessionParameter SessionField="EventId" Name="EventId" />
            <asp:SessionParameter SessionField="EventName" Name="NameofEvent" />
            <asp:SessionParameter SessionField="ReservationDate" Name="ReservationDate" />
            <asp:SessionParameter SessionField="StartTime" Name="ReservationStartTime" />
            <asp:SessionParameter SessionField="NoofHours" Name="NumberofHours" />
            <asp:SessionParameter SessionField="EndTime" Name="ReservationEndTime" />
            <asp:ControlParameter ControlID="cid" PropertyName="Text" Name="ClientId" />
            <asp:ControlParameter ControlID="era" PropertyName="Text" Name="EventReservedAmount" />
            <asp:Parameter Name="Tag" DefaultValue="1" />
            <asp:ControlParameter ControlID="FileUpload1" PropertyName="FileName" Type="String" Name="letterurl" />
            <asp:ControlParameter ControlID="gt" PropertyName="Text" Name="grandtotal" />
            <asp:Parameter Direction="Output" Name="NewId" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
         SelectCommand="SELECT EventName FROM EventTBL WHERE (EventID = @EventId)">
         <SelectParameters>
             <asp:SessionParameter Name="EventId" SessionField="EventId" />
         </SelectParameters>
     </asp:SqlDataSource>
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

