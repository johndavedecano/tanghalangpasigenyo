<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="EOS0.aspx.cs" Inherits="Admin_RFC" %>

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
        fieldset
        {
            border:1px solid #0088cc;
            color:Black;
        }
        legend
        {
            color:#0088cc;
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
            color:#0088cc;
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
            font-size: x-large;
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
<div style=" text-align:center; font-size:20px; color:Red">
    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label> </div>
    <div class="notif"></div> <br />
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
                DataNavigateUrlFormatString="~/Admin/EOS.aspx?ReservationId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
<div class="eventinfo">
   

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="RqtoCancelEventYSA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 1) AND (ReservationTBL.Tag = 5) ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="RqtoCancelEventYC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 2) AND (ReservationTBL.Tag = 5) ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
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
                DataNavigateUrlFormatString="~/Admin/EOS.aspx?ReservationId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView></div>
    </div>
</div>
    </asp:Content>

