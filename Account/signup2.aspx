<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="signup2.aspx.cs" Inherits="signup2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [ClientTbl] WHERE [ClientId] = @ClientId" 
        InsertCommand="INSERT INTO [ClientTbl] ([UserId], [ClientLname], [ClientMname], [ClientFname], [ClientAddress], [ClientContactNo], [ClientCompany], [Status]) VALUES (@UserId, @ClientLname, @ClientMname, @ClientFname, @ClientAddress, @ClientContactNo, @ClientCompany, @Status)" 
        SelectCommand="SELECT * FROM [ClientTbl]" 
        
        UpdateCommand="UPDATE [ClientTbl] SET [UserId] = @UserId, [ClientLname] = @ClientLname, [ClientMname] = @ClientMname, [ClientFname] = @ClientFname, [ClientAddress] = @ClientAddress, [ClientEAddress] = @ClientEAddress, [ClientContactNo] = @ClientContactNo, [ClientCompany] = @ClientCompany WHERE [ClientId] = @ClientId">
        <DeleteParameters>
            <asp:Parameter Name="ClientId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="UserId" Type="String" />
            <asp:Parameter Name="ClientLname" Type="String" />
            <asp:Parameter Name="ClientMname" Type="String" />
            <asp:Parameter Name="ClientFname" Type="String" />
            <asp:Parameter Name="ClientAddress" Type="String" />
            <asp:Parameter Name="ClientContactNo" Type="String" />
            <asp:Parameter Name="ClientCompany" Type="String" />
            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="Status" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="ClientLname" Type="String" />
            <asp:Parameter Name="ClientMname" Type="String" />
            <asp:Parameter Name="ClientFname" Type="String" />
            <asp:Parameter Name="ClientAddress" Type="String" />
            <asp:Parameter Name="ClientEAddress" Type="String" />
            <asp:Parameter Name="ClientContactNo" Type="String" />
            <asp:Parameter Name="ClientCompany" Type="String" />
            <asp:Parameter Name="ClientId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

    <asp:LoginName ID="HeadLoginName" runat="server" Visible="False" />

    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />



</asp:Content>

