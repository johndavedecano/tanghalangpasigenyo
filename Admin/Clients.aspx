<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clients.aspx.cs" Inherits="Admin_Clients" MasterPageFile="~/Site2.master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
<link href="../Styles/Site2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="sliding_effect.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <asp:GridView ID="GridView1" runat="server" Width="98%" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ClientId" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ClientId" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ClientId" >
            </asp:BoundField>
            <asp:BoundField DataField="UserId" HeaderText="UserId" 
                SortExpression="UserId" Visible="False" >
            </asp:BoundField>
            <asp:BoundField DataField="ClientLname" HeaderText="Lastname" 
                SortExpression="ClientLname" >
            </asp:BoundField>
            <asp:BoundField DataField="ClientMname" HeaderText="MI" 
                SortExpression="ClientMname" >
            </asp:BoundField>
            <asp:BoundField DataField="ClientFname" HeaderText="Firstname" 
                SortExpression="ClientFname">
            </asp:BoundField>
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:HyperLinkField DataNavigateUrlFields="ClientId,UserId" 
                DataNavigateUrlFormatString="Clients_Update.aspx?ClientId={0}&amp;UserId={1}" 
                DataTextField="ClientId" DataTextFormatString="Update" Text="Update" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [ClientId], ClientTBL.[UserId], [ClientLname], [ClientMname], [ClientFname], [Status] FROM [ClientTBL] LEFT JOIN [aspnet_Users] ON (ClientTBL.[UserId] = aspnet_Users.[UserId]) WHERE [ClientFName] IS NOT NULL AND [ClientLName] IS NOT NULL AND aspnet_Users.[UserName] IS NOT NULL ORDER BY [ClientLname]">
    </asp:SqlDataSource>
    <div style="clear:both;"></div>
</asp:Content>