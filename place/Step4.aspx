<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Step4.aspx.cs" Inherits="client_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        #sidebar
        {
        width:220px;    
        }
        #maincontent
        {
        background-repeat:no-repeat;
        width: 650px;    
        height: auto;
        }
        .imgssss
        {
            position:static;
            width:150px;
            height:184px;
            opacity:0.5;
        }
        .time
        {
            text-align:center;
            width: 200px;
            margin-left: 50px;
            float:left;
        }
        .timeleft
        {
        float: right;
        height: auto;
        width:380px;
        padding-top: 40px;
        }
        .fields
        {
            float:right;
            width:280px;
            height: 20px;
            padding-bottom:10px;
        }
        .labels
        {
            float:left; 
            clear:both;
            width: 100px;
            height: 20px;
            padding-bottom:10px;
            color:#000;
            padding-top: 5px;
        }
        .red
        {
            color:Red;
        }
        .gray
        {
            color:Gray;
        }
    .style2
    {
        font-family: "Book Antiqua";
        font-size: x-large;
        text-align: center;
        color: #000000;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="wrapper">
<div id="maincontent">
        <ul id="mainNav" class="fiveStep" style="margin:0px">
		<li class="done"><a title=""><em>Step 1:</em><span>Know the Service</span></a></li>
		<li class="done"><a title=""><em>Step 2:</em><span>Choose Facilty</span></a></li>
		<li class="lastDone"><a title=""><em>Step 3:</em><span>Available Date</span></a></li>
		<li class="current"><a title=""><em>Step 4:</em><span>Available Time</span></a></li>
		<li class="mainNavNoBg"><a title=""><em>Step 5:</em> <span>Finalize</span></a></li>
	</ul>
    <br /><br />
    <br /><br />
    <div class="style2">Tanghalang Pasigueño offers their service 24/7</div>
        <asp:Panel ID="TimeSlotValid" runat="server"><br />
            <div class="alert alert-danger" style="border:1px solid red; padding:10px; text-align:left;">Timeslot is not available.</div>
        </asp:Panel>
        <div class="time">
        &nbsp;<br />
            <br />
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CssClass="mGrid" DataSourceID="SqlDataSource1" DataKeyNames="ReservationId">
            <Columns>
                <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ReservationId" />
                <asp:BoundField DataField="ReservationStartTime" HeaderText="Start Time" 
                    SortExpression="ReservationStartTime" />
                <asp:BoundField DataField="ReservationEndTime" HeaderText="End Time" 
                    SortExpression="ReservationEndTime" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/vs.jpg" 
            CssClass="imgssss" Visible="False" />
    </div>
    <div class="timeleft">
    <div class="labels">Start Time:</div>
    <div class="fields">
        <asp:TextBox ID="TextBox3" runat="server" Width="170px"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="TextBox3_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="TextBox3" 
            WatermarkText="am-pm format ex(12:00pm)" WatermarkCssClass="gray">
        </asp:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox3" CssClass="red" ErrorMessage="Invalid Format" 
            ValidationExpression="^([1-9]|1[0-2]|0[1-9]){1}(:[0-5][0-9][aApP][mM]){1}$"></asp:RegularExpressionValidator>
    </div>
    <div class="labels">No of Hours:</div>
    <div class="fields">
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
    </div>
        <br />
&nbsp;<br />
    <br />
     <br />
<asp:Button ID="Button1" runat="server" Text="Back" CausesValidation="False" 
                onclick="Button1_Click" /> 
           &nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button2"
            runat="server" Text="Go to Next Step" onclick="Button2_Click" /><br /><br />
    </div>
        <div style="text-align:center">
            &nbsp;&nbsp;&nbsp; 
            </div>
</div>

<div id="sidebar">
        
    <asp:ImageButton ID="ImageButton11" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/halamanan ni mutya.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
     <br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton12" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/main lobby.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    <br />
     <asp:ImageButton ID="ImageButton10" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/asemblea magna.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
          <asp:SqlDataSource ID="EventType" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              SelectCommand="SELECT [EventType] FROM [EventTBL] WHERE ([EventID] = @EventID)">
              <SelectParameters>
                  <asp:SessionParameter Name="EventID" SessionField="EventId" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
        
    <asp:SqlDataSource ID="Affected" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
              SelectCommand="SELECT [StartTime], [EndTime] FROM [SERepository] WHERE (([EventDate] = @EventDate) AND ([VenueId] = @VenueId))">
        <SelectParameters>
            <asp:SessionParameter DbType="Date" Name="EventDate" 
                SessionField="ReservationDate" />
            <asp:SessionParameter Name="VenueId" SessionField="VenueId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    <asp:SqlDataSource ID="AffectedCount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
              
              SelectCommand="SELECT COUNT(StartTime) AS Counting FROM SERepository WHERE (EventDate = @EventDate) AND (VenueId = @VenueId)">
        <SelectParameters>
            <asp:SessionParameter DbType="Date" Name="EventDate" 
                SessionField="ReservationDate" />
            <asp:SessionParameter Name="VenueId" SessionField="VenueId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
          <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
          </asp:ToolkitScriptManager>
          <asp:TextBox ID="starttime" runat="server" Visible="False"></asp:TextBox>
          <asp:TextBox ID="endtime" runat="server" Visible="False"></asp:TextBox>
         &nbsp;&nbsp;
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [ReservationId], [EventId], [ReservationDate], [ReservationStartTime], [ReservationEndTime] FROM [ReservationTBL] WHERE (([ReservationDate] = @ReservationDate) AND ([EventId] = @EventId))">
        <SelectParameters>
            <asp:SessionParameter Name="ReservationDate" SessionField="ReservationDate" />
            <asp:SessionParameter Name="EventId" SessionField="EventId" />
        </SelectParameters>
    </asp:SqlDataSource>
   
    </div>
</div>
</asp:Content>

