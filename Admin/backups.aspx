<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="backups.aspx.cs" Inherits="Admin_backups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="wrapper">

    <br />
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="imgss" 
        ImageUrl="~/Resources/Backup_center_icon.png" onclick="ImageButton1_Click" />
    <br />
    Click Image to BackUp Database<br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div style="width: 200px; margin:auto">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CssClass="mGrid" DataKeyNames="Count" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="LastBackupDate" HeaderText="LastBackupDate" 
                    SortExpression="LastBackupDate" />
                <asp:BoundField DataField="Count" HeaderText="Count" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Count" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM [BackupDateTBL] WHERE [Count] = @Count" 
            InsertCommand="INSERT INTO [BackupDateTBL] ([LastBackupDate]) VALUES (@LastBackupDate)" 
            SelectCommand="SELECT [LastBackupDate], [Count] FROM [BackupDateTBL]" 
            UpdateCommand="UPDATE [BackupDateTBL] SET [LastBackupDate] = @LastBackupDate WHERE [Count] = @Count">
            <DeleteParameters>
                <asp:Parameter Name="Count" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="LastBackupDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastBackupDate" Type="DateTime" />
                <asp:Parameter Name="Count" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
    </div>

</div>
</asp:Content>

