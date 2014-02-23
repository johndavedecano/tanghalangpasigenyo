 <%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="venueUpdate.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Venue Maintenance</legend>
      <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
          AutoGenerateRows="False" DataKeyNames="VenueId" 
          DataSourceID="SqlDataSource1" DefaultMode="Edit"
          OnItemCommand="DetailView_ItemCommand"
          OnItemUpdated="DetailView_ItemUpdate" >
          <Fields>
              <asp:BoundField DataField="VenueId" HeaderText="VenueId" 
                  InsertVisible="False" ReadOnly="True" SortExpression="VenueId" />
              <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                  SortExpression="VenueName" />
              <asp:BoundField DataField="VenueLocation" HeaderText="VenueLocation" 
                  SortExpression="VenueLocation" />
              <asp:BoundField DataField="RateperHour" HeaderText="RateperHour" 
                  SortExpression="RateperHour" />
              <asp:CommandField ShowEditButton="True" />
          </Fields>
      </asp:DetailsView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [VenueTBL] WHERE [VenueId] = @VenueId" 
          InsertCommand="INSERT INTO [VenueTBL] ([VenueName], [VenueLocation], [RateperHour]) VALUES (@VenueName, @VenueLocation, @RateperHour)" 
          SelectCommand="SELECT * FROM [VenueTBL] WHERE ([VenueId] = @VenueId)" 
          
          UpdateCommand="UPDATE [VenueTBL] SET [VenueName] = @VenueName, [VenueLocation] = @VenueLocation, [RateperHour] = @RateperHour WHERE [VenueId] = @VenueId">
          <DeleteParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="VenueName" Type="String" />
              <asp:Parameter Name="VenueLocation" Type="String" />
              <asp:Parameter Name="RateperHour" Type="Decimal" />
          </InsertParameters>
          <SelectParameters>
              <asp:QueryStringParameter Name="VenueId" QueryStringField="VenueId" 
                  Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="VenueName" Type="String" />
              <asp:Parameter Name="VenueLocation" Type="String" />
              <asp:Parameter Name="RateperHour" Type="Decimal" />
              <asp:Parameter Name="VenueId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
  </fieldset>
  </div>
  <div id="sidebar" style="height: 200px">

      </div>

</div>
</asp:Content>

