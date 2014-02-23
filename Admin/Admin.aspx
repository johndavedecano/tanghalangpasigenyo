<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
		<link rel="stylesheet" type="text/css" href="styles.css" />
        <link href="../Styles/Site2.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="sliding_effect.js"></script>
        <style type="text/css"> 
                    .fields
        {
            float:right;
            width:180px;
            height: 20px;
            padding-bottom:10px;
        }
        .labels
        {
            float:left; 
            clear:both;
            width: 120px;
            height: 20px;
            padding-bottom:10px;
            color:black;
        }
        fieldset
        {
            margin-top: 0px;
        }
            .style3
            {
                font-family: "Matura MT Script Capitals";
                color: #FF3300;
                font-size: xx-large;
                text-align: center;
            }
            .style4
            {
                font-weight: normal;
                font-family: "Book Antiqua";
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="sb">
<br> 
<br> <br> <br> <br> <br> <br> <br> <br> 
<marquee  behavior="scroll" direction="up" speed="2" class="style3">
<br />
Pasig's New Seat of Culture<br /> 
and<br /> 
the Arts<br /> 
is also the stunning background of your event. <br /> 
<br /></marquee><br />
<br /><br /><br /><br />
    <br />
<div class="c1" style="visibility: hidden">
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

</div>
<div id="mc">
    <asp:SqlDataSource ID="RqtoCancelEventYSA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 1) and (ReservationTBL.tag > 1) and (ReservationTBL.tag < 8) ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="RqtoCancelEventYC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 2) and (ReservationTBL.tag > 1) and (ReservationTBL.tag < 8)ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
    <div class='h11' 
        
        style="border-style: none; border-color: inherit; border-width: medium; color: #000000; font-size: x-large; text-align: center;">
        <br />
        <span class="style4">Active Reservation</span><br />
        <br />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ReservationId" 
        DataSourceID="RqtoCancelEventYSA" EmptyDataText="No Request" PageSize="8">
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Number" 
                InsertVisible="False" ReadOnly="True" SortExpression="ReservationId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Event Name" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="NumberofHours" HeaderText="Number of Hours" 
                SortExpression="NumberofHours" />
            <asp:TemplateField HeaderText="Balance" SortExpression="Grand Total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GrandTotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("GrandTotal","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("ReservationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText=" Client Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:BoundField DataField="ClientContactNo" HeaderText="Contact Number" 
                SortExpression="ClientContactNo" />
            <asp:HyperLinkField DataNavigateUrlFields="Reservationid" 
                DataNavigateUrlFormatString="~/Admin/Confirmed.aspx?ReservationId={0}" 
                Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <br />
    <div style="visibility: hidden">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [VenueName], [VenueId] FROM [VenueTBL]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [VenueId], [DateRecord], [ReservationId], [Type] FROM [DateRepository] WHERE (([DateRecord] = @DateRecord) AND ([VenueId] = @VenueId))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox5" DbType="Date" Name="DateRecord" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="VenueId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT Count([VenueId]) FROM [DateRepository] WHERE (([DateRecord] = @DateRecord) AND ([VenueId] = @VenueId))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox5" DbType="Date" Name="DateRecord" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="VenueId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
    
    <br /><br />

    <div>
    <div id="maxleft">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                 <table class="style1">
            <tr style="visibility: hidden">
                <td class="style2">
                    Select a Venue:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="VenueName" 
                        DataValueField="VenueId" ValidationGroup="a" Visible="False">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Select a Date:</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" ValidationGroup="a" Width="125px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="*" ValidationGroup="a" 
                        style="color: #FF3300"></asp:RequiredFieldValidator>
                    <asp:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox5">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" 
                        ValidationGroup="a" />
                </td>
            </tr>
        </table>
            </ContentTemplate>
        
        </asp:UpdatePanel>
       
        </div>
    <div id="maxright" runat="server">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                        <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
            DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel2">
        <ProgressTemplate>
                    <img alt="progress" src="../Styles/ajax-loader.gif" style="position:static; width:30px;height:30px"/>
                Processing...
        </ProgressTemplate>
        </asp:UpdateProgress>
                <asp:Panel ID="Panel1" runat="server">
                <div style="visibility: hidden">
                    <div class="h11" style="color: #A62A2A; font-size: 20px; border: none;">
            Date Selected is a Practice Date.</div></div>
                    </asp:Panel>
                     <asp:Panel ID="Panel2" runat="server">
                    <fieldset>
        <legend>Reservation Details</legend>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ReservationId" 
            DataSourceID="EventsSelect">
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <span style="">
                <div style="visibility: hidden">
                <div class="labels">Venue:</div>
                <div class="fields">
                <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' />
                </div></div>
                <div class="labels">Reservation Id:</div>
                <div class="fields">
                <asp:Label ID="ReservationIdLabel" runat="server" 
                    Text='<%# Eval("ReservationId") %>' />
                </div>
                <div class="labels">Name of Event:</div>
                <div class="fields">
                <asp:Label ID="NameofEventLabel" runat="server" 
                    Text='<%# Eval("NameofEvent") %>' />
                </div>
                <div class="labels">Reservation Date:</div>
                <div class="fields">
                <asp:Label ID="ReservationDateLabel" runat="server" 
                    Text='<%# Eval("ReservationDate","{0:MM/dd/yyyy}") %>' />
                </div>
                <div class="labels">Start Time:</div>
                <div class="fields">
                <asp:Label ID="ReservationStartTimeLabel" runat="server" 
                    Text='<%# Eval("ReservationStartTime") %>' />
                </div>
                <div class="labels">No. of Hours:</div>
                <div class="fields">
                <asp:Label ID="NumberofHoursLabel" runat="server" 
                    Text='<%# Eval("NumberofHours") %>' />
                </div>
                <div class="labels">Total:</div>
                <div class="fields">
                <asp:Label ID="grandtotalLabel" runat="server" 
                    Text='<%# Eval("grandtotal","{0:n2}") %>' />
                </div>
                <div class="labels">Client Name:</div>
                <div class="fields">
                <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                </div>
                <div class="labels">Address:</div>
                <div class="fields">
                <asp:Label ID="ClientAddressLabel" runat="server" 
                    Text='<%# Eval("ClientAddress") %>' />
                </div>
                <div class="labels">Contact No.:</div>
                <div class="fields">
                <asp:Label ID="ClientContactNoLabel" runat="server" 
                    Text='<%# Eval("ClientContactNo") %>' /></div>
                <div style="visibility: hidden">
               <div class="labels">Type of Event:
                <div class="fields">
                <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' />
                </div>
               </div>
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div style="" ID="itemPlaceholderContainer" runat="server">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                </asp:DataPager>
                <div style="">
                </div>
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="EventsSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            
             SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, EventTBL.EventType, ReservationTBL.grandtotal, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Expr1, ClientTBL.ClientAddress, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.ReservationId = @ReservationId)">
            <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox6" Name="ReservationId" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        </fieldset>
                    </asp:Panel>
                     <asp:Panel ID="Panel3" runat="server">
                         <div class="h11" 
                             style="border-style: none; border-color: inherit; border-width: medium; color: #FF3300; font-size: 20px; text-align: center;">
                             Date is Available</div>
                        </asp:Panel>
            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1" />
            </Triggers>

        </asp:UpdatePanel>
    </div>
    </div>
    </div>
</div>
</asp:Content>


