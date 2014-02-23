<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Restore.aspx.cs" Inherits="Admin_Restore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [DTrailCount], [DTrailTable], [ItemId] FROM [DeleteTrail] WHERE ([DTrailCount] = @DTrailCount)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DTrailCount" QueryStringField="tcount" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:SqlDataSource ID="DeleteDtrail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM DeleteTrail WHERE (DTrailCount = @DTrailCount)" 
        SelectCommand="SELECT DTrailCount FROM DeleteTrail">
        <DeleteParameters>
            <asp:QueryStringParameter Name="DTrailCount" QueryStringField="tcount" 
                Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="Amenity" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [AmenityTBL] SET [isDeleted] = @isDeleted WHERE [AmenityId] = @AmenityId">
        <UpdateParameters>
            <asp:Parameter Name="isDeleted" Type="Boolean" DefaultValue="False" />
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="AmenityId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Event" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [EventTBL] SET [isDeleted] = @isDeleted WHERE [EventID] = @EventID">
        <UpdateParameters>
            <asp:Parameter Name="isDeleted" Type="Boolean" DefaultValue="False" />
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="EventID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Facility" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [FacilityTBL] SET [isDeleted] = @isDeleted WHERE [FacilityId] = @FacilityId">
        <UpdateParameters>
            <asp:Parameter Name="isDeleted" Type="Boolean" DefaultValue="False" />
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="FacilityId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Misc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>"  
        UpdateCommand="UPDATE [miscTBL] SET [isDeleted] = @isDeleted WHERE [miscId] = @miscId">
        <UpdateParameters>
            <asp:Parameter Name="isDeleted" Type="Boolean" DefaultValue="False" />
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="miscId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

