<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="facilities.aspx.cs" Inherits="facilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Facilities Maintenance</legend>
      Select Venue:<br />
      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
          <asp:ListItem Value="1">Ynares Sports Arena</asp:ListItem>
          <asp:ListItem Value="2">Ynares Center</asp:ListItem>
      </asp:DropDownList>
      <br />
      <br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="FacilityId" DataSourceID="SqlDataSource1"
          EmptyDataText="There are no data records to display." Width="573px" 
          CssClass="mGrid">
          <AlternatingRowStyle CssClass="alt" />
          <Columns>

              <asp:BoundField DataField="FacilityId" HeaderText="FacilityId" 
                  InsertVisible="False" ReadOnly="True" SortExpression="FacilityId" 
                  Visible="False" />
              <asp:BoundField DataField="FacilityName" HeaderText="FacilityName" 
                  SortExpression="FacilityName" />
              <asp:BoundField DataField="FacilityDescription" 
                  HeaderText="FacilityDescription" SortExpression="FacilityDescription" />
              <asp:TemplateField HeaderText="RateperHour" SortExpression="RateperHour">
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RateperHour") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("RateperHour","{0:n2}") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="GroupId" HeaderText="Group" 
                  SortExpression="GroupId" />
              <asp:HyperLinkField DataNavigateUrlFields="GroupId" 
                  DataNavigateUrlFormatString="~/Maintenance/facilitiesDelete.aspx?GroupId={0}" 
                  Text="Delete" />
              <asp:HyperLinkField DataNavigateUrlFields="facilityId" 
                  DataNavigateUrlFormatString="~/Maintenance/facilitiesUpdate.aspx?facilityId={0}" 
                  Text="Edit" />
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          
          SelectCommand="SELECT [FacilityId], [FacilityName], [FacilityDescription], [RateperHour], [GroupId] FROM [FacilityTBL] WHERE ([VenueId] = @VenueId) and (isDeleted = 0)" 
          DeleteCommand="DELETE FROM FacilityTBL WHERE (GroupId = @GroupId)">
          <DeleteParameters>
              <asp:Parameter Name="GroupId" />
          </DeleteParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="DropDownList1" Name="VenueId" 
                  PropertyName="SelectedValue" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
      </br>Note: Group column means that it is referring to same facility.<br />

      <br />

      <asp:HyperLink ID="HyperLink1" runat="server" 
          NavigateUrl="~/Maintenance/facilitiesInsert.aspx">Add New Facility</asp:HyperLink>
      <br />
      <br />
      <asp:HyperLink ID="HyperLink2" runat="server" 
          NavigateUrl="~/Maintenance/facilitiesInsert2.aspx">Add New Airconditioned Facility</asp:HyperLink>
  </fieldset>
      
      </div>
  <div id="sidebar" style="height: 300px">

      </div>

</div>
</asp:Content>

