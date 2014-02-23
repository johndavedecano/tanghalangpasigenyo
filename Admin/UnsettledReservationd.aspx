<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="UnsettledReservationd.aspx.cs" Inherits="Admin_RFC" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        #wrapper
        {
            height: auto;
            background:white;
        }
        .command
        {
            float:right;
            height:200px;
            width:400px;
        }
         #fleft
    {
        float:left;
        width: 200px;
    }
        fieldset
        {
            border:1px solid #ff3300;
            color:Black;
        }
        legend
        {
            color:#000000;
        }
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
        .imgss
        {
            position:static;
        }
        .eventinfo
        {
            width:720px;
            height:auto;
            margin: auto;
        }
        .s1
        {
            float:left;
            width:350px;

        }
        .s2
        {
            float:right;
            width:340px;
            
        }
        .s3
        {
            float:left;
            width: 350px;
        }
        .command
        {
            float:right;
            width:340px;
            text-align:center;
        }
        .clear
        {
            clear:both;
        }
        .notif
        {
            text-align:center;
            font-size: 30px;
            color: #000000;
        font-family: "Book Antiqua";
    }
        .notif2
        {
            text-align:center;
            font-size: 30px;
            color: #f00;
        }
                .Image1
        {
            position:static;
            width: 30px;
            height: 30px;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper" style="text-align:left">
<div style="margin:auto; width:840px; height:auto;">
<br /><br />
    <div class="notif">Unsetteled Reservations</div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" 
        DataSourceID="RqtoCancelEventYSA" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" DataKeyNames="ReservationId">
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Id" 
                SortExpression="ReservationId" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="NumberofHours" HeaderText="Number of Hours" 
                SortExpression="NumberofHours" />
            <asp:TemplateField HeaderText="Total Amount" SortExpression="GrandTotal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GrandTotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("GrandTotal","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reservation Date" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReservationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Client Name" 
                SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="ClientContactNo" HeaderText="Client Contact Number" 
                SortExpression="ClientContactNo" />
            <asp:HyperLinkField DataNavigateUrlFields="Reservationid" 
                DataNavigateUrlFormatString="~/Admin/UnsettledReservationd.aspx?ReservationId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <br />
 <div>
    <div style="width:470px; margin: auto">
     <fieldset style="border-color: #FF3300">
        <legend>Resevation Details</legend>
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
                    Text='<%# Eval("ReservationDate") %>' />
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
                
                <div class="labels">Total Amount:</div>
                <div class="fields">
                <asp:Label ID="grandtotalLabel" runat="server" 
                    Text='<%# Eval("grandtotal") %>' />
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
                <div class="labels">Contact No:</div>
                <div class="fields">
                <asp:Label ID="ClientContactNoLabel" runat="server" 
                    Text='<%# Eval("ClientContactNo") %>' /></div>
                
                  <div style="visibility: hidden">
                 <div class="labels">Type of Event:</div>
                <div class="fields">
                <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' />
                </div> </div>
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
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>

         <br />
         
        </fieldset>
    </div>
    </div>
    <br />
    <div style="padding-left:180px"><asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Admin/PaymentSys.aspx">Go to Payment Page</asp:HyperLink></div>

<div class="eventinfo">


    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="RqtoCancelEventYSA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 1) AND (ReservationTBL.Tag = 6) ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="RqtoCancelEventYC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 2) AND (ReservationTBL.Tag = 6) ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
     <div style="visibility: hidden">

      <div class="notif">Ynares Center</div><br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" 
        DataSourceID="RqtoCancelEventYC" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" DataKeyNames="ReservationId" >
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                SortExpression="ReservationId" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NameofEvent" HeaderText="NameofEvent" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="NumberofHours" HeaderText="NumberofHours" 
                SortExpression="NumberofHours" />
            <asp:TemplateField HeaderText="GrandTotal" SortExpression="GrandTotal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GrandTotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("GrandTotal","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReservationDate" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReservationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="ClientContactNo" HeaderText="ClientContactNo" 
                SortExpression="ClientContactNo" />
            <asp:HyperLinkField DataNavigateUrlFields="Reservationid" 
                DataNavigateUrlFormatString="~/Admin/UnsettledReservationd.aspx?ReservationId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    </div>  </div>
</div>
    </asp:Content>

