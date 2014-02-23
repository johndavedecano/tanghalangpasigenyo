<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="DeleteTrail.aspx.cs" Inherits="Admin_DeleteTrail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    #wrapper
    {
        text-align:left;
    }
                    fieldset
        {
            border:1px solid #0088cc;
            color:Black;
        }
        legend
        {
            color:#000000;
        }
        .ggg
        {
            position:static;
            width: 200px;
            height: 200px;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DTrailCount"
        DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." CssClass="mGrid">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="DTrailCount" HeaderText="Trail Count" ReadOnly="True"
                SortExpression="DTrailCount" />
            <asp:BoundField DataField="DTrailTable" HeaderText="Trail Table" 
                SortExpression="DTrailTable" />
            <asp:BoundField DataField="ItemId" HeaderText="Item Id" 
                SortExpression="ItemId" />
            <asp:BoundField DataField="DateRecorded" HeaderText="Date Recorded" 
                SortExpression="DateRecorded" />
            <asp:BoundField DataField="DeletedBy" HeaderText="Deleted By" 
                SortExpression="DeletedBy" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>"
        DeleteCommand="DELETE FROM [DeleteTrail] WHERE [DTrailCount] = @DTrailCount"
        InsertCommand="INSERT INTO [DeleteTrail] ([DTrailTable], [ItemId], [DateRecorded], [DeletedBy]) VALUES (@DTrailTable, @ItemId, @DateRecorded, @DeletedBy)"
        ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" SelectCommand="SELECT [DTrailCount], [DTrailTable], [ItemId], [DateRecorded], [DeletedBy] FROM [DeleteTrail]"
        UpdateCommand="UPDATE [DeleteTrail] SET [DTrailTable] = @DTrailTable, [ItemId] = @ItemId, [DateRecorded] = @DateRecorded, [DeletedBy] = @DeletedBy WHERE [DTrailCount] = @DTrailCount">
        <DeleteParameters>
            <asp:Parameter Name="DTrailCount" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DTrailTable" Type="String" />
            <asp:Parameter Name="ItemId" Type="Int32" />
            <asp:Parameter Name="DateRecorded" Type="DateTime" />
            <asp:Parameter Name="DeletedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DTrailTable" Type="String" />
            <asp:Parameter Name="ItemId" Type="Int32" />
            <asp:Parameter Name="DateRecorded" Type="DateTime" />
            <asp:Parameter Name="DeletedBy" Type="String" />
            <asp:Parameter Name="DTrailCount" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <fieldset style="border-color: #FF3300">
    <legend>Deleted Amenity</legend>
        <asp:GridView ID="GridView3" runat="server" CssClass="mGrid" 
            AutoGenerateColumns="False" DataSourceID="Amenity">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="DTrailCount" HeaderText="Trail Count" 
                    InsertVisible="False" ReadOnly="True" SortExpression="DTrailCount" />
                <asp:BoundField DataField="AmenityId" HeaderText="Amenity Id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="AmenityId" />
                <asp:BoundField DataField="AmenityName" HeaderText="Amenity Name" 
                    SortExpression="AmenityName" />
                <asp:BoundField DataField="DateRecorded" HeaderText="Date Recorded" 
                    SortExpression="DateRecorded" />
                <asp:BoundField DataField="DeletedBy" HeaderText="Deleted By" 
                    SortExpression="DeletedBy" />
                <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                    SortExpression="VenueName" Visible="False" />
                <asp:HyperLinkField DataNavigateUrlFields="DTrailCount" 
                    DataNavigateUrlFormatString="~/Admin/Restore.aspx?tcount={0}" 
                    Text="Restore" Visible="False" />
            </Columns>
        </asp:GridView>
    </fieldset>
    <fieldset style="border-color: #FF3300">
    <legend>Deleted Facilty Rates</legend>
        <asp:GridView ID="GridView4" runat="server" CssClass="mGrid" 
            AutoGenerateColumns="False" DataSourceID="Event">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="DTrailCount" HeaderText="Trail Count" 
                    InsertVisible="False" ReadOnly="True" SortExpression="DTrailCount" />
                <asp:BoundField DataField="EventID" HeaderText="Facilty Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="EventID" />
                <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                    SortExpression="VenueName" Visible="False" />
                <asp:BoundField DataField="EventName" HeaderText="Facilty Name" 
                    SortExpression="EventName" />
                <asp:BoundField DataField="DateRecorded" HeaderText="Date Recorded" 
                    SortExpression="DateRecorded" />
                <asp:BoundField DataField="DeletedBy" HeaderText="Deleted By" 
                    SortExpression="DeletedBy" />
                <asp:HyperLinkField DataNavigateUrlFields="DTrailCount" 
                    DataNavigateUrlFormatString="~/Admin/Restore.aspx?tcount={0}" 
                    Text="Restore" Visible="False" />
            </Columns>
        </asp:GridView>
    </fieldset>
    <div style="visibility: hidden">
    <fieldset>
    <legend>Deleted Facilities</legend>
        <asp:GridView ID="GridView5" runat="server" CssClass="mGrid" 
            AutoGenerateColumns="False" DataSourceID="Facility">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="DTrailCount" HeaderText="DTrailCount" 
                    InsertVisible="False" ReadOnly="True" SortExpression="DTrailCount" />
                <asp:BoundField DataField="FacilityId" HeaderText="FacilityId" 
                    InsertVisible="False" ReadOnly="True" SortExpression="FacilityId" />
                <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                    SortExpression="VenueName" />
                <asp:BoundField DataField="FacilityName" HeaderText="FacilityName" 
                    SortExpression="FacilityName" />
                <asp:BoundField DataField="DateRecorded" HeaderText="DateRecorded" 
                    SortExpression="DateRecorded" />
                <asp:BoundField DataField="DeletedBy" HeaderText="DeletedBy" 
                    SortExpression="DeletedBy" />
                <asp:HyperLinkField DataNavigateUrlFields="DTrailCount" 
                    DataNavigateUrlFormatString="~/Admin/Restore.aspx?tcount={0}" 
                    Text="Restore" />
            </Columns>
        </asp:GridView>
    </fieldset>
    <fieldset>
    <legend>Deleted Miscellaneous</legend>
        <asp:GridView ID="GridView6" runat="server" CssClass="mGrid" 
            AutoGenerateColumns="False" DataSourceID="Misc">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="DTrailCount" HeaderText="DTrailCount" 
                    InsertVisible="False" ReadOnly="True" SortExpression="DTrailCount" />
                <asp:BoundField DataField="miscId" HeaderText="miscId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="miscId" />
                <asp:BoundField DataField="miscName" HeaderText="miscName" 
                    SortExpression="miscName" />
                <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                    SortExpression="VenueName" />
                <asp:BoundField DataField="DateRecorded" HeaderText="DateRecorded" 
                    SortExpression="DateRecorded" />
                <asp:BoundField DataField="DeletedBy" HeaderText="DeletedBy" 
                    SortExpression="DeletedBy" />
                <asp:HyperLinkField DataNavigateUrlFields="DTrailCount" 
                    DataNavigateUrlFormatString="~/Admin/Restore.aspx?tcount={0}" 
                    Text="Restore" />
            </Columns>
        </asp:GridView>
    </fieldset>
    <asp:SqlDataSource ID="Amenity" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT DeleteTrail.DTrailCount, AmenityTBL.AmenityId, VenueTBL.VenueName, AmenityTBL.AmenityName, DeleteTrail.DateRecorded, DeleteTrail.DeletedBy FROM VenueTBL INNER JOIN AmenityTBL ON VenueTBL.VenueId = AmenityTBL.VenueId INNER JOIN DeleteTrail ON AmenityTBL.AmenityId = DeleteTrail.ItemId WHERE (DeleteTrail.DTrailTable = 'Amenity')">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Event" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT DeleteTrail.DTrailCount, EventTBL.EventID, VenueTBL.VenueName, EventTBL.EventName, DeleteTrail.DateRecorded, DeleteTrail.DeletedBy FROM VenueTBL INNER JOIN EventTBL ON VenueTBL.VenueId = EventTBL.VenueID INNER JOIN DeleteTrail ON EventTBL.EventID = DeleteTrail.ItemId WHERE (DeleteTrail.DTrailTable = 'Events') ORDER BY DeleteTrail.DTrailCount DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Misc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT DeleteTrail.DTrailCount, miscTBL.miscId, miscTBL.miscName, VenueTBL.VenueName, DeleteTrail.DateRecorded, DeleteTrail.DeletedBy FROM VenueTBL INNER JOIN miscTBL ON VenueTBL.VenueId = miscTBL.venueId INNER JOIN DeleteTrail ON miscTBL.miscId = DeleteTrail.ItemId WHERE (DeleteTrail.DTrailTable = 'Miscellaneous') ORDER BY DeleteTrail.DTrailCount DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Facility" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT DeleteTrail.DTrailCount, FacilityTBL.FacilityId, VenueTBL.VenueName, FacilityTBL.FacilityName, DeleteTrail.DateRecorded, DeleteTrail.DeletedBy FROM VenueTBL INNER JOIN FacilityTBL ON VenueTBL.VenueId = FacilityTBL.VenueId INNER JOIN DeleteTrail ON FacilityTBL.FacilityId = DeleteTrail.ItemId WHERE (DeleteTrail.DTrailTable = 'Facility') ORDER BY DeleteTrail.DTrailCount DESC">
    </asp:SqlDataSource>
</div></div>
</asp:Content>

