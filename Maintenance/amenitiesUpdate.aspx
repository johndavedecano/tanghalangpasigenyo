<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="amenitiesUpdate.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Amenities Maintenance</legend>
      
      
      <asp:DetailsView ID="DetailsView1" runat="server" Height="126px" Width="261px" 
          AutoGenerateRows="False" DataKeyNames="AmenityId" DataSourceID="SqlDataSource1" 
          DefaultMode="Edit"
          OnItemCommand="DetailView_ItemCommand"
          OnItemUpdated="DetailView_ItemUpdate"  >
          <Fields>
              <asp:BoundField DataField="AmenityId" HeaderText="Amenity Id" 
                  InsertVisible="False" ReadOnly="True" SortExpression="AmenityId" />
              <asp:BoundField DataField="AmenityName" HeaderText="Amenity Name" 
                  SortExpression="AmenityName" />
              <asp:BoundField DataField="Description" HeaderText="Description" 
                  SortExpression="Description" />
              <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                  SortExpression="Quantity" />
              <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
              <asp:BoundField DataField="dmgFee" HeaderText="Damage Fee" 
                  SortExpression="dmgFee" />
              <asp:TemplateField HeaderText="Service Id" SortExpression="VenueId" 
                  Visible="False">
                  <EditItemTemplate>
                      <asp:DropDownList ID="DropDownList1" runat="server" 
                          DataSourceID="SqlDataSource2" DataTextField="VenueName" 
                          DataValueField="VenueId" SelectedValue='<%# Bind("VenueId") %>'>
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                          SelectCommand="SELECT [VenueName], [VenueId] FROM [VenueTBL]">
                      </asp:SqlDataSource>
                  </EditItemTemplate>
                  <InsertItemTemplate> 
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VenueId") %>'></asp:TextBox>
                  </InsertItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("VenueId") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:CommandField ShowEditButton="True" ButtonType="Button" />
          </Fields>
      </asp:DetailsView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [AmenityTBL] WHERE [AmenityId] = @AmenityId" 
          InsertCommand="INSERT INTO [AmenityTBL] ([VenueId], [AmenityName], [Description], [Quantity], [Price]) VALUES (@VenueId, @AmenityName, @Description, @Quantity, @Price)" 
          SelectCommand="SELECT * FROM [AmenityTBL] WHERE ([AmenityId] = @AmenityId)" 
          UpdateCommand="UPDATE [AmenityTBL] SET [VenueId] = @VenueId, [AmenityName] = @AmenityName, [Description] = @Description, [Quantity] = @Quantity, [Price] = @Price, [dmgFee] = @dmgFee WHERE [AmenityId] = @AmenityId">
          <DeleteParameters>
              <asp:Parameter Name="AmenityId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
              <asp:Parameter Name="AmenityName" Type="String" />
              <asp:Parameter Name="Description" Type="String" />
              <asp:Parameter Name="Quantity" Type="Int32" />
              <asp:Parameter Name="Price" Type="Decimal" />
          </InsertParameters>
          <SelectParameters>
              <asp:QueryStringParameter Name="AmenityId" QueryStringField="AmenityId" 
                  Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
              <asp:Parameter Name="AmenityName" Type="String" />
              <asp:Parameter Name="Description" Type="String" />
              <asp:Parameter Name="Quantity" Type="Int32" />
              <asp:Parameter Name="Price" Type="Decimal" />
              <asp:Parameter Name="AmenityId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
      <br />
      <br /> 
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      
      
  </fieldset>
  </div>
  <div id="sidebar" style="height: auto">
      <asp:SqlDataSource ID="NameSelect" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT EmpFName + ' ' + EmpLName AS Name FROM EmployeeTBL WHERE (UserId = @UserId)">
          <SelectParameters>
              <asp:ControlParameter ControlID="TextBox2" Name="UserId" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
      <br />
      <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
      <br />
      <br />
      <asp:Label ID="Table" runat="server" Text="Label" Visible="False" 
          ForeColor="Black"></asp:Label>
      <br />
      <asp:Label ID="Column" runat="server" Text="Label" Visible="False" 
          ForeColor="Black"></asp:Label>
      <br />
      <asp:Label ID="OldValue" runat="server" Text="Label" Visible="False" 
          ForeColor="Black"></asp:Label>
      <br />
      <asp:Label ID="NewValue" runat="server" Text="Label" Visible="False" 
          ForeColor="Black"></asp:Label>
      <br />
      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False" 
          ForeColor="Black"></asp:Label>
      <br />
      <asp:Label ID="UpdatedBy" runat="server" Text="Label" Visible="False" 
          ForeColor="Black"></asp:Label>

      <asp:SqlDataSource ID="UpdateTrail" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [UpdateTrail] ([TrailTable], [ItemId], [TrailColumn], [OldValue], [NewValue], [DateRecorded], [UpdateBy]) VALUES (@TrailTable, @ItemId, @TrailColumn, @OldValue, @NewValue, @DateRecorded, @UpdateBy)" 
          >
          <InsertParameters>
              <asp:ControlParameter ControlID="Table" PropertyName="Text" Name="TrailTable" Type="String" />
              <asp:QueryStringParameter Name="ItemId" QueryStringField="AmenityId" Type="Int32" />
              <asp:ControlParameter ControlID="Column" PropertyName="Text" Name="TrailColumn" Type="String" />
              <asp:ControlParameter ControlID="OldValue" PropertyName="Text" Name="OldValue" Type="String" />
              <asp:ControlParameter ControlID="NewValue" PropertyName="Text" Name="NewValue" Type="String" />
              <asp:ControlParameter ControlID="DateRecorded" PropertyName="Text" DbType="Date" Name="DateRecorded" />
              <asp:ControlParameter ControlID="UpdatedBy" PropertyName="Text" Name="UpdateBy" Type="String" />
          </InsertParameters>
      </asp:SqlDataSource>
      </div>
</div>
</asp:Content>

