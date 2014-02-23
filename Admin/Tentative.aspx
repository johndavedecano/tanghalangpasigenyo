<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Tentative.aspx.cs" Inherits="Tentative" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        
        .liit
        {
            width: 40px;
        }
        
        .link
        {
            color: Blue;
            text-decoration: underline;
        }
        .notif
        {
            text-align:center;
            font-size: x-large;
            color: #000000;
            font-family: "Book Antiqua";
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <br />
    <br />
<div style="width: 100%; text-align:center;">
<br /><br />
    <div class="notif">Tentative Reservation</div><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="Big" Width="776px" CssClass="mGrid" 
        EmptyDataText="No Request">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Id"
                SortExpression="ReservationId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
            <asp:TemplateField HeaderText="Reservation Date" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReservationDate", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ReservationStartTime" 
                HeaderText="Reservation Start Time" 
                SortExpression="ReservationStartTime" />
            <asp:BoundField DataField="Name" HeaderText="Client Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:BoundField DataField="letterurl" HeaderText="letterurl" 
                SortExpression="letterurl" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="letterurl" 
                DataNavigateUrlFormatString="~/letterdownload.aspx?letterurl={0}" 
                HeaderText="Letter of Intent" Text="Download" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="ReservationId" 
                DataNavigateUrlFormatString="~/Admin/ConfirmEvent.aspx?ReservationId={0}" 
                HeaderText="View" Text="View" />
        </Columns>
    </asp:GridView>

</div>
<br /><br />

<div style="width: 100%; text-align:center;">


</div>
    <br />
    <br />
    <asp:SqlDataSource ID="Big" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ReservationTBL.letterurl FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN VenueTBL ON ReservationTBL.VenueId  = VenueTBL.VenueId INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID WHERE (ReservationTBL.Tag = 1) AND (EventTBL.EventType = 'Big Event')">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="Small" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ReservationTBL.letterurl FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN VenueTBL ON ReservationTBL.VenueId  = VenueTBL.VenueId INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID WHERE (ReservationTBL.Tag = 1) AND (EventTBL.EventType = 'Small Event')">
    </asp:SqlDataSource>

<div style="visibility: hidden">
    <h1 style="text-align:left;padding-left:57px">Small/Practice Event</h1>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="Small" Width="776px" CssClass="mGrid" 
        EmptyDataText="No Request">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="ReservationId"
                SortExpression="ReservationId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="NameofEvent" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" />
            <asp:TemplateField HeaderText="ReservationDate" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReservationDate", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ReservationStartTime" 
                HeaderText="ReservationStartTime" SortExpression="ReservationStartTime" />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:BoundField DataField="letterurl" HeaderText="letterurl" 
                SortExpression="letterurl" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="letterurl" 
                DataNavigateUrlFormatString="~/letterdownload.aspx?letterurl={0}" 
                HeaderText="Letter of Intent" Text="Download" />
            <asp:HyperLinkField DataNavigateUrlFields="ReservationId" 
                DataNavigateUrlFormatString="~/Admin/ConfirmSEvent.aspx?ReservationId={0}" 
                HeaderText="View" Text="View" />
        </Columns>
    </asp:GridView></div>
</asp:Content>

