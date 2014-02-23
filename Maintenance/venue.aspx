<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="venue.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Service Maintenance</legend>
      
      
      <br />
      
      
      <br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="VenueId" DataSourceID="SqlDataSource1" 
          EmptyDataText="There are no data records to display." Width="494px" 
          CssClass="mGrid">
          <AlternatingRowStyle CssClass="alt" />
          <Columns>
              
              <asp:BoundField DataField="VenueId" HeaderText="Service Id" ReadOnly="True" 
                  SortExpression="VenueId" InsertVisible="False" />
              <asp:BoundField DataField="VenueName" HeaderText="Service Name" 
                  SortExpression="VenueName" />
              <asp:BoundField DataField="VenueLocation" HeaderText="Service Location" 
                  SortExpression="VenueLocation" />
              <asp:BoundField DataField="RateperHour" HeaderText="RateperHour" 
                  SortExpression="RateperHour" />
              <asp:HyperLinkField DataNavigateUrlFields="VenueId" 
                  DataNavigateUrlFormatString="~/Maintenance/venueupdate.aspx?VenueId={0}" Text="Edit" />
              <asp:CommandField ShowDeleteButton="True" />
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" 
          SelectCommand="SELECT * FROM [VenueTBL]" 
          DeleteCommand="DELETE FROM [VenueTBL] WHERE [VenueId] = @VenueId" 
          InsertCommand="INSERT INTO [VenueTBL] ([VenueName], [VenueLocation], [RateperHour]) VALUES (@VenueName, @VenueLocation, @RateperHour)" 
          UpdateCommand="UPDATE [VenueTBL] SET [VenueName] = @VenueName, [VenueLocation] = @VenueLocation, [RateperHour] = @RateperHour WHERE [VenueId] = @VenueId">
          <DeleteParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="VenueName" Type="String" />
              <asp:Parameter Name="VenueLocation" Type="String" />
              <asp:Parameter Name="RateperHour" Type="Decimal" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="VenueName" Type="String" />
              <asp:Parameter Name="VenueLocation" Type="String" />
              <asp:Parameter Name="RateperHour" Type="Decimal" />
              <asp:Parameter Name="VenueId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
      <br />
      <asp:HyperLink ID="HyperLink1" runat="server" 
          NavigateUrl="~/Maintenance/venueInsert.aspx" Visible="False">Add Service</asp:HyperLink>
  </fieldset>
  </div>
  <div id="sidebar" style="height: 200px">

      </div>

</div>
</asp:Content>

