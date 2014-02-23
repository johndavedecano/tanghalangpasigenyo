<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="EmployeeId" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="EmployeeId" HeaderText="Employee Id" ReadOnly="True" 
                SortExpression="EmployeeId" />
            <asp:BoundField DataField="EmployeeFname" HeaderText="Employee Firstname" 
                SortExpression="EmployeeFname" />
            <asp:BoundField DataField="EmployeeMname" HeaderText="Employee Middlename" 
                SortExpression="EmployeeMname" />
            <asp:BoundField DataField="EmployeeLname" HeaderText="Employee Lastname" 
                SortExpression="EmployeeLname" />
            <asp:BoundField DataField="EmployeeJob" HeaderText="Employee Job" 
                SortExpression="EmployeeJob" />
            <asp:BoundField DataField="EmployeeAddress" HeaderText="Employee Address" 
                SortExpression="EmployeeAddress" />
            <asp:BoundField DataField="EmployeesContactNo" HeaderText="Employees Contact No." 
                SortExpression="EmployeesContactNo" />
            <asp:BoundField DataField="VenueId" HeaderText="Service Id" 
                SortExpression="VenueId" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:YnaresDatabaseConnectionString1 %>" 
        DeleteCommand="DELETE FROM [EmployeeTbl] WHERE [EmployeeId] = @EmployeeId" 
        InsertCommand="INSERT INTO [EmployeeTbl] ([EmployeeId], [EmployeeFname], [EmployeeMname], [EmployeeLname], [EmployeeJob], [EmployeeAddress], [EmployeesContactNo], [VenueId]) VALUES (@EmployeeId, @EmployeeFname, @EmployeeMname, @EmployeeLname, @EmployeeJob, @EmployeeAddress, @EmployeesContactNo, @VenueId)" 
        ProviderName="<%$ ConnectionStrings:YnaresDatabaseConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [EmployeeId], [EmployeeFname], [EmployeeMname], [EmployeeLname], [EmployeeJob], [EmployeeAddress], [EmployeesContactNo], [VenueId] FROM [EmployeeTbl]" 
        UpdateCommand="UPDATE [EmployeeTbl] SET [EmployeeFname] = @EmployeeFname, [EmployeeMname] = @EmployeeMname, [EmployeeLname] = @EmployeeLname, [EmployeeJob] = @EmployeeJob, [EmployeeAddress] = @EmployeeAddress, [EmployeesContactNo] = @EmployeesContactNo, [VenueId] = @VenueId WHERE [EmployeeId] = @EmployeeId">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeId" Type="Int32" />
            <asp:Parameter Name="EmployeeFname" Type="String" />
            <asp:Parameter Name="EmployeeMname" Type="String" />
            <asp:Parameter Name="EmployeeLname" Type="String" />
            <asp:Parameter Name="EmployeeJob" Type="String" />
            <asp:Parameter Name="EmployeeAddress" Type="String" />
            <asp:Parameter Name="EmployeesContactNo" Type="String" />
            <asp:Parameter Name="VenueId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeFname" Type="String" />
            <asp:Parameter Name="EmployeeMname" Type="String" />
            <asp:Parameter Name="EmployeeLname" Type="String" />
            <asp:Parameter Name="EmployeeJob" Type="String" />
            <asp:Parameter Name="EmployeeAddress" Type="String" />
            <asp:Parameter Name="EmployeesContactNo" Type="String" />
            <asp:Parameter Name="VenueId" Type="Int32" />
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

