<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" MasterPageFile="~/Site2.master" Inherits="Admin_Users" %>
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
        DataKeyNames="EmpId" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="EmpId" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="EmpId" >
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="EmpFName" HeaderText="Firstname" 
                SortExpression="EmpFName" >
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="EmpLName" HeaderText="Lastname" 
                SortExpression="EmpLName" >
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Position" HeaderText="Position" 
                SortExpression="Position" >
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:HyperLinkField DataTextField="EmpId" DataTextFormatString="Update" 
                DataNavigateUrlFields="EmpId"
                DataNavigateUrlFormatString="~\Admin/Users_Update.aspx?EmpId={0}"
                HeaderText="Update" NavigateUrl="Users_Update.aspx" >
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:HyperLinkField>
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
        SelectCommand="SELECT [EmpId], [EmpFName], [EmpLName], [Position] FROM [EmployeeTBL] ORDER BY [EmpLName]">
    </asp:SqlDataSource>
    <div style="clear:both;"></div>
</asp:Content>

