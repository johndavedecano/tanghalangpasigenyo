<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Logs.aspx.cs" Inherits="Admin_Logs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    #wrapper
    {
        text-align:left;
    }
    .logleft
    {
        float: left;
        width: 450px;
    }
    .logright
    {
        float: right;
        width: 450px;
    }
    
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
<div class="logleft">
<fieldset>
<legend>Client Logs</legend>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataKeyNames="ClientId" DataSourceID="ClientLog" 
        AllowPaging="True" PageSize="15">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="ClientId" HeaderText="Client Id" 
                InsertVisible="False" ReadOnly="True" SortExpression="ClientId" />
            <asp:BoundField DataField="Name" HeaderText="Client Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:BoundField DataField="LoginDateTime" HeaderText="Login Date and Time" 
                SortExpression="LoginDateTime" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="ClientLog" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ClientTBL.ClientId, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, Logs.LoginDateTime FROM Logs INNER JOIN ClientTBL ON Logs.UserId = ClientTBL.ClientId WHERE (Logs.UserType = N'Client') ORDER BY Logs.Logs DESC">
    </asp:SqlDataSource>

</fieldset>
</div>
<div class="logright">
<fieldset>
<legend>Admin Logs</legend>

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataKeyNames="EmpId" DataSourceID="AdminLog" 
        AllowPaging="True" PageSize="15">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="EmpId" HeaderText="Employee  Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="EmpId" />
            <asp:BoundField DataField="Name" HeaderText="Employee Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:BoundField DataField="UserType" HeaderText="UserType" 
                SortExpression="UserType" Visible="False" />
            <asp:BoundField DataField="LoginDateTime" HeaderText="Login Date and Time" 
                SortExpression="LoginDateTime" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="AdminLog" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT EmployeeTBL.EmpId, EmployeeTBL.EmpFName + ' ' + EmployeeTBL.EmpLName AS Name, Logs.UserType, Logs.LoginDateTime FROM Logs INNER JOIN EmployeeTBL ON Logs.UserId = EmployeeTBL.EmpId WHERE (Logs.UserType = N'Admin') ORDER BY Logs.Logs DESC">
    </asp:SqlDataSource>

</fieldset>
</div>
</div>
</asp:Content>

