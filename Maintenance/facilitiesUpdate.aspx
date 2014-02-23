<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="facilitiesUpdate.aspx.cs" Inherits="facilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Facilities Maintenance</legend>

      <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
          DataKeyNames="FacilityId" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
          Height="50px" Width="125px"
          OnItemCommand="DetailView_ItemCommand"
          OnItemUpdated="DetailView_ItemUpdate">
          <Fields>
              <asp:BoundField DataField="FacilityId" HeaderText="FacilityId" 
                  InsertVisible="False" ReadOnly="True" SortExpression="FacilityId" 
                  Visible="False" />
              <asp:BoundField DataField="FacilityName" HeaderText="FacilityName" 
                  SortExpression="FacilityName" />
              <asp:BoundField DataField="FacilityDescription" 
                  HeaderText="FacilityDescription" SortExpression="FacilityDescription" />
              <asp:BoundField DataField="RateperHour" HeaderText="RateperHour" 
                  SortExpression="RateperHour" />
              <asp:CommandField ShowEditButton="True" ButtonType="Button" />
          </Fields>
      </asp:DetailsView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [FacilityTBL] WHERE [FacilityId] = @FacilityId" 
          InsertCommand="INSERT INTO [FacilityTBL] ([FacilityName], [FacilityDescription], [RateperHour]) VALUES (@FacilityName, @FacilityDescription, @RateperHour)" 
          SelectCommand="SELECT [FacilityId], [FacilityName], [FacilityDescription], [RateperHour] FROM [FacilityTBL] WHERE ([FacilityId] = @FacilityId)" 
          UpdateCommand="UPDATE [FacilityTBL] SET [FacilityName] = @FacilityName, [FacilityDescription] = @FacilityDescription, [RateperHour] = @RateperHour WHERE [FacilityId] = @FacilityId">
          <DeleteParameters>
              <asp:Parameter Name="FacilityId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="FacilityName" Type="String" />
              <asp:Parameter Name="FacilityDescription" Type="String" />
              <asp:Parameter Name="RateperHour" Type="Decimal" />
          </InsertParameters>
          <SelectParameters>
              <asp:QueryStringParameter Name="FacilityId" QueryStringField="FacilityId" 
                  Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="FacilityName" Type="String" />
              <asp:Parameter Name="FacilityDescription" Type="String" />
              <asp:Parameter Name="RateperHour" Type="Decimal" />
              <asp:Parameter Name="FacilityId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>

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
      <asp:Label ID="Table" runat="server" Text="Label" Visible="False"></asp:Label>
      <br />
      <asp:Label ID="Column" runat="server" Text="Label" Visible="False"></asp:Label>
      <br />
      <asp:Label ID="OldValue" runat="server" Text="Label" Visible="False"></asp:Label>
      <br />
      <asp:Label ID="NewValue" runat="server" Text="Label" Visible="False"></asp:Label>
      <br />
      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False"></asp:Label>
      <br />
      <asp:Label ID="UpdatedBy" runat="server" Text="Label" Visible="False"></asp:Label>

      <asp:SqlDataSource ID="UpdateTrail" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [UpdateTrail] ([TrailTable], [ItemId], [TrailColumn], [OldValue], [NewValue], [DateRecorded], [UpdateBy]) VALUES (@TrailTable, @ItemId, @TrailColumn, @OldValue, @NewValue, @DateRecorded, @UpdateBy)" 
          >
          <InsertParameters>
              <asp:ControlParameter ControlID="Table" PropertyName="Text" Name="TrailTable" Type="String" />
              <asp:QueryStringParameter Name="ItemId" QueryStringField="facilityId" Type="Int32" />
              <asp:ControlParameter ControlID="Column" PropertyName="Text" Name="TrailColumn" Type="String" />
              <asp:ControlParameter ControlID="OldValue" PropertyName="Text" Name="OldValue" Type="String" />
              <asp:ControlParameter ControlID="NewValue" PropertyName="Text" Name="NewValue" Type="String" />
              <asp:ControlParameter ControlID="DateRecorded" PropertyName="Text" DbType="Date" Name="DateRecorded" />
              <asp:ControlParameter ControlID="UpdatedBy" PropertyName="Text" Name="UpdateBy" Type="String" />
          </InsertParameters>
      </asp:SqlDataSource>
      <br />
      <br />
      </div>
</div>
</asp:Content>

