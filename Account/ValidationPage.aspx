<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ValidationPage.aspx.cs" Inherits="ValidationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <asp:SqlDataSource ID="Client" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        InsertCommand="INSERT INTO [Logs] ([UserId], [UserType], [LoginDateTime]) VALUES (@UserId, @UserType, @LoginDateTime)" >
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox3" PropertyName="Text" Name="UserId" Type="Int32" />
            <asp:Parameter Name="UserType" Type="String" DefaultValue="Client" />
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="LoginDateTime" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="Emp" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        InsertCommand="INSERT INTO [Logs] ([UserId], [UserType], [LoginDateTime]) VALUES (@UserId, @UserType, @LoginDateTime)" >
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox3" PropertyName="Text" Name="UserId" Type="Int32" />
            <asp:Parameter Name="UserType" Type="String" DefaultValue="Admin" />
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="LoginDateTime" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ClientIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ClientId, ClientFname + ' ' + ClientLname AS Name FROM ClientTBL WHERE (UserId = @UserId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="UserId" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="EmpIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT EmpId, UserId, EmpFName + ' ' + EmpLName AS Name, Position FROM EmployeeTBL WHERE (UserId = @UserId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="UserId" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br /><br />
</asp:Content>

