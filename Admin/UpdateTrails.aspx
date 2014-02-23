<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="UpdateTrails.aspx.cs" Inherits="Admin_Default" %>

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
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataKeyNames="TrailNo" DataSourceID="UpdateTrail" 
        AllowPaging="True">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="TrailNo" HeaderText="Trail Number" InsertVisible="False" 
                ReadOnly="True" SortExpression="TrailNo" />
            <asp:BoundField DataField="ItemId" HeaderText="Item Id" 
                SortExpression="ItemId" />
            <asp:BoundField DataField="TrailTable" HeaderText="Trail Table" 
                SortExpression="TrailTable" />
            <asp:BoundField DataField="TrailColumn" HeaderText="Trail Column" 
                SortExpression="TrailColumn" />
            <asp:BoundField DataField="OldValue" HeaderText="Old Value" 
                SortExpression="OldValue" />
            <asp:BoundField DataField="NewValue" HeaderText="New Value" 
                SortExpression="NewValue" />
            <asp:TemplateField HeaderText="Date Recorded" SortExpression="DateRecorded">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateRecorded") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateRecorded", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UpdateBy" HeaderText="Update By" 
                SortExpression="UpdateBy" Visible="False" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="UpdateTrail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT * FROM [UpdateTrail] ORDER BY [TrailNo] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
    <fieldset style="border-color: #FF3300">
    <legend>Changes in Amenities</legend>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataSourceID="Amenity" AllowPaging="True" PageSize="8">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="AmenityName" HeaderText="Amenity Name" 
                SortExpression="AmenityName" />
            <asp:BoundField DataField="VenueName" HeaderText="Venue Name" 
                SortExpression="VenueName" Visible="False" />
            <asp:BoundField DataField="TrailColumn" HeaderText="Trail Column" 
                SortExpression="TrailColumn" />
            <asp:BoundField DataField="OldValue" HeaderText="Old Value" 
                SortExpression="OldValue" />
            <asp:BoundField DataField="NewValue" HeaderText="New Value" 
                SortExpression="NewValue" />
            <asp:TemplateField HeaderText="Date Recorded" SortExpression="DateRecorded">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateRecorded") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateRecorded", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UpdateBy" HeaderText="Update By" 
                SortExpression="UpdateBy" Visible="False" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    </fieldset>
        
    <fieldset style="border-color: #FF3300">
    <legend>Changes in Facilties</legend>

        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            CssClass="mGrid" DataSourceID="Events" AllowPaging="True" PageSize="8">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="TrailColumn" HeaderText="Trail Column" 
                    SortExpression="TrailColumn" />
                <asp:BoundField DataField="VenueName" HeaderText="Venue Name" 
                    SortExpression="VenueName" Visible="False" />
                <asp:BoundField DataField="OldValue" HeaderText="Old Value" 
                    SortExpression="OldValue" />
                <asp:BoundField DataField="NewValue" HeaderText="New Value" 
                    SortExpression="NewValue" />
                <asp:TemplateField HeaderText="Date Recorded" SortExpression="DateRecorded">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateRecorded") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateRecorded", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UpdateBy" HeaderText="Update By" 
                    SortExpression="UpdateBy" Visible="False" />
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
    </fieldset>
    <div style="visibility: hidden">
    <fieldset>
    <legend>Changes in Facilities</legend>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataSourceID="Facility" AllowPaging="True" PageSize="8">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="FacilityName" HeaderText="FacilityName" 
                SortExpression="FacilityName" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" />
            <asp:BoundField DataField="TrailColumn" HeaderText="TrailColumn" 
                SortExpression="TrailColumn" />
            <asp:BoundField DataField="OldValue" HeaderText="OldValue" 
                SortExpression="OldValue" />
            <asp:BoundField DataField="NewValue" HeaderText="NewValue" 
                SortExpression="NewValue" />
            <asp:TemplateField HeaderText="DateRecorded" SortExpression="DateRecorded">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateRecorded") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateRecorded", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" 
                SortExpression="UpdateBy" Visible="False" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    </fieldset>
        <fieldset>
    <legend>Changes in Miscellaneous</legend>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataSourceID="Misc" AllowPaging="True" PageSize="8">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="miscName" HeaderText="miscName" 
                SortExpression="miscName" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" />
            <asp:BoundField DataField="TrailColumn" HeaderText="TrailColumn" 
                SortExpression="TrailColumn" />
            <asp:BoundField DataField="OldValue" HeaderText="OldValue" 
                SortExpression="OldValue" />
            <asp:BoundField DataField="NewValue" HeaderText="NewValue" 
                SortExpression="NewValue" />
            <asp:TemplateField HeaderText="DateRecorded" SortExpression="DateRecorded">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateRecorded") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateRecorded", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" 
                SortExpression="UpdateBy" Visible="False" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    </fieldset>
    </div>
    <asp:SqlDataSource ID="Misc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT miscTBL.miscName, UpdateTrail.TrailColumn, UpdateTrail.OldValue, UpdateTrail.NewValue, UpdateTrail.DateRecorded, UpdateTrail.UpdateBy, VenueTBL.VenueName FROM UpdateTrail INNER JOIN miscTBL ON UpdateTrail.ItemId = miscTBL.miscId INNER JOIN VenueTBL ON miscTBL.venueId = VenueTBL.VenueId WHERE (UpdateTrail.TrailTable = 'Miscellaneous') ORDER BY UpdateTrail.TrailNo DESC">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="Events" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT UpdateTrail.TrailColumn, VenueTBL.VenueName, UpdateTrail.OldValue, UpdateTrail.NewValue, UpdateTrail.DateRecorded, UpdateTrail.UpdateBy FROM EventTBL INNER JOIN VenueTBL ON EventTBL.VenueID = VenueTBL.VenueId INNER JOIN UpdateTrail ON EventTBL.EventID = UpdateTrail.ItemId WHERE (UpdateTrail.TrailTable = 'Events') ORDER BY UpdateTrail.TrailNo DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Facility" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT FacilityTBL.FacilityName, UpdateTrail.TrailColumn, UpdateTrail.OldValue, UpdateTrail.NewValue, UpdateTrail.DateRecorded, UpdateTrail.UpdateBy, VenueTBL.VenueName FROM UpdateTrail INNER JOIN FacilityTBL ON UpdateTrail.ItemId = FacilityTBL.FacilityId INNER JOIN VenueTBL ON FacilityTBL.VenueId = VenueTBL.VenueId WHERE (UpdateTrail.TrailTable = 'Facilities') ORDER BY UpdateTrail.TrailNo DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Amenity" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT AmenityTBL.AmenityName, UpdateTrail.TrailColumn, UpdateTrail.OldValue, UpdateTrail.NewValue, UpdateTrail.DateRecorded, UpdateTrail.UpdateBy, VenueTBL.VenueName FROM UpdateTrail INNER JOIN AmenityTBL ON UpdateTrail.ItemId = AmenityTBL.AmenityId INNER JOIN VenueTBL ON AmenityTBL.VenueId = VenueTBL.VenueId WHERE (UpdateTrail.TrailTable = 'Amenity') ORDER BY UpdateTrail.TrailNo DESC">
    </asp:SqlDataSource>
</div>
</asp:Content>

