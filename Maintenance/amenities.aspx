<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="amenities.aspx.cs" Inherits="amenities" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="../Admin/sliding_effect.js" type="text/javascript"></script>
    <script src="../Admin/jquery.js" type="text/javascript"></script>
    <link href="../Styles/Site2.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Amenities Maintenance</legend>
      
      
      <div style="visibility: hidden">Select Venue:</div><br />
      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
          Visible="False">
          <asp:ListItem Value="1" Selected="True">Venue</asp:ListItem>
          <asp:ListItem Value="2">Transportation</asp:ListItem>
      </asp:DropDownList>
      <br />
      <br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="AmenityId" DataSourceID="SqlDataSource1" 
          EmptyDataText="There are no data records to display." CssClass="mGrid" 
          onrowdeleting="GridView1_RowDeleting">
          <AlternatingRowStyle CssClass="alt" />
          <Columns>
              
              <asp:BoundField DataField="AmenityId" HeaderText="Amenity Id" ReadOnly="True" 
                  SortExpression="AmenityId" />
              <asp:BoundField DataField="VenueId" HeaderText="Service Id" 
                  SortExpression="VenueId" />
              <asp:BoundField DataField="AmenityName" HeaderText="Amenity Name" 
                  SortExpression="AmenityName" />
              <asp:BoundField DataField="Description" HeaderText="Description" 
                  SortExpression="Description" />
              <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                  SortExpression="Quantity" />
              <asp:TemplateField HeaderText="Price" SortExpression="Price">
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price","{0:0.00}") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Damage Fee" SortExpression="dmgFee">
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dmgFee") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("dmgFee","{0:0.00}") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:HyperLinkField DataNavigateUrlFields="AmenityId" 
                  DataNavigateUrlFormatString="~/Maintenance/amenitiesUpdate.aspx?AmenityId={0}" Text="Edit" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                          CommandName="Delete" Text="Delete"></asp:LinkButton>
                        <asp:ConfirmButtonExtender ID="LinkButton2_ConfirmButtonExtender" runat="server" 
                            ConfirmText="Are you sure you want to Delete?" Enabled="True" TargetControlID="LinkButton1">
                        </asp:ConfirmButtonExtender>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [AmenityTBL] WHERE [AmenityId] = @AmenityId" 
          InsertCommand="INSERT INTO [AmenityTBL] ([VenueId], [AmenityName], [Description], [Quantity], [Price]) VALUES (@VenueId, @AmenityName, @Description, @Quantity, @Price)" 
          ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" 
          SelectCommand="SELECT [AmenityId], [VenueId], [AmenityName], [Description], [Quantity], [Price], [dmgFee] FROM [AmenityTBL] WHERE ([VenueId] = @VenueId) and (isDeleted = 0)" 
          UpdateCommand="UPDATE [AmenityTBL] SET [VenueId] = @VenueId, [AmenityName] = @AmenityName, [Description] = @Description, [Quantity] = @Quantity, [Price] = @Price WHERE [AmenityId] = @AmenityId">
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
              <asp:ControlParameter ControlID="DropDownList1" Name="VenueId" 
                  PropertyName="SelectedValue" Type="Int32" />
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
      <asp:HyperLink ID="HyperLink1" runat="server" 
          NavigateUrl="~/Maintenance/amenitiesInsert.aspx">Add Amenity</asp:HyperLink>
  </fieldset>
  </div>
  <div id="sidebar" style="height: 200px">
          <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
          </asp:ToolkitScriptManager>
      <asp:SqlDataSource ID="NameSelect" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT EmpFName + ' ' + EmpLName AS Name FROM EmployeeTBL WHERE (UserId = @UserId)">
          <SelectParameters>
              <asp:ControlParameter ControlID="TextBox2" Name="UserId" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
      <asp:Label ID="DeletedBy" runat="server" Text="Label" Visible="False" 
              style="color: #000000"></asp:Label>
      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False" 
              style="color: #000000"></asp:Label>
          <asp:TextBox ID="iid" runat="server" Visible="False"></asp:TextBox>
          <asp:SqlDataSource ID="DeleteTrail" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              InsertCommand="INSERT INTO [DeleteTrail] ([DTrailTable], [ItemId], [DateRecorded], [DeletedBy]) VALUES (@DTrailTable, @ItemId, @DateRecorded, @DeletedBy)" 
              ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" >
              <InsertParameters>
                  <asp:Parameter Name="DTrailTable" Type="String" DefaultValue="Amenity" />
                  <asp:ControlParameter ControlID="iid" PropertyName="Text" Name="ItemId" Type="Int32" />
                  <asp:ControlParameter ControlID="DateRecorded" PropertyName="Text" DbType="DateTime" Name="DateRecorded" />
                  <asp:ControlParameter ControlID="DeletedBy" PropertyName="Text" Name="DeletedBy" Type="String" />

              </InsertParameters>
          </asp:SqlDataSource>

      </div>
</div>
</asp:Content>

