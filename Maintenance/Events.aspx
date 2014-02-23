<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="events" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Facility Maintenance</legend>
      
      
    <div style="visibility: hidden">
  Select Service:</div><br />
      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
          DataSourceID="SqlDataSource1" DataTextField="VenueName" 
          DataValueField="VenueId" Visible="False">
          <asp:ListItem Value="1" Selected="True">Venue</asp:ListItem>
          <asp:ListItem Value="2">TransportationCenter</asp:ListItem>
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT [VenueName], [VenueId] FROM [VenueTBL]">
      </asp:SqlDataSource>
      <br />
      
      
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="EventID" DataSourceID="SqlDataSource2" 
          style="text-align: left" Width="573px" CssClass="mGrid" 
          onrowdeleting="GridView1_RowDeleting">
          <AlternatingRowStyle CssClass="alt" />
          <Columns>
              <asp:BoundField DataField="EventID" HeaderText="Facilty Id" 
                  SortExpression="EventID" InsertVisible="False" ReadOnly="True" />
              <asp:BoundField DataField="EventName" HeaderText="Facility Name" 
                  SortExpression="EventName" />
              <asp:BoundField DataField="EventType" HeaderText="Facilty Type" 
                  SortExpression="EventType" />
              <asp:BoundField DataField="EventDetails" HeaderText="Facilty Description" 
                  SortExpression="EventDetails" Visible="False" />
              <asp:BoundField DataField="VenueID" HeaderText="Service Id" 
                  SortExpression="VenueID" Visible="False" />
              <asp:TemplateField HeaderText="Rate per Hour" SortExpression="RateperHour">
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RateperHour") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("RateperHour","{0:n2}") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="FirstFourHourRate" HeaderText="First Three Hour Rate" 
                  SortExpression="FirstFourHourRate" Visible="False" />
              <asp:BoundField DataField="ReservationFee" HeaderText="Reservation Fee" 
                  SortExpression="ReservationFee" Visible="False" />
              <asp:BoundField DataField="OperationalExpense" HeaderText="Operational Expense" 
                  SortExpression="OperationalExpense" Visible="False" />
              <asp:BoundField DataField="PerformanceBond" HeaderText="Performance Bond" 
                  SortExpression="PerformanceBond" Visible="False" />
              <asp:CheckBoxField DataField="isDeleted" HeaderText="isDeleted" 
                  SortExpression="isDeleted" Visible="False" />
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                          CommandName="Delete" Text="Delete"></asp:LinkButton>
                          <asp:ConfirmButtonExtender ID="LinkButton2_ConfirmButtonExtender" runat="server" 
                            ConfirmText="Are you sure you want to Delete?" Enabled="True" TargetControlID="LinkButton1">
                        </asp:ConfirmButtonExtender>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:HyperLinkField DataNavigateUrlFields="EventId" 
                  DataNavigateUrlFormatString="~/Maintenance/EventsUpdate.aspx?EventId={0}" 
                  Text="View Details" />
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [EventTBL] WHERE [EventID] = @EventID" 
          SelectCommand="SELECT * FROM [EventTBL] WHERE ([VenueID] = @VenueID) and (isDeleted = 0)" 
          InsertCommand="INSERT INTO [EventTBL] ([EventName], [EventType], [EventDetails], [VenueID], [RateperHour], [FirstFourHourRate], [ReservationFee], [OperationalExpense], [PerformanceBond]) VALUES (@EventName, @EventType, @EventDetails, @VenueID, @RateperHour, @FirstFourHourRate, @ReservationFee, @OperationalExpense, @PerformanceBond)" 
          UpdateCommand="UPDATE [EventTBL] SET [EventName] = @EventName, [EventType] = @EventType, [EventDetails] = @EventDetails, [VenueID] = @VenueID, [RateperHour] = @RateperHour, [FirstFourHourRate] = @FirstFourHourRate, [ReservationFee] = @ReservationFee, [OperationalExpense] = @OperationalExpense, [PerformanceBond] = @PerformanceBond WHERE [EventID] = @EventID" >
          <DeleteParameters>
              <asp:Parameter Name="EventID" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="EventName" Type="String" />
              <asp:Parameter Name="EventType" Type="String" />
              <asp:Parameter Name="EventDetails" Type="String" />
              <asp:Parameter Name="VenueID" Type="Int32" />
              <asp:Parameter Name="RateperHour" Type="Double" />
              <asp:Parameter Name="FirstFourHourRate" Type="Double" />
              <asp:Parameter Name="ReservationFee" Type="Double" />
              <asp:Parameter Name="OperationalExpense" Type="Double" />
              <asp:Parameter Name="PerformanceBond" Type="Double" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="DropDownList1" Name="VenueID" 
                  PropertyName="SelectedValue" Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="EventName" Type="String" />
              <asp:Parameter Name="EventType" Type="String" />
              <asp:Parameter Name="EventDetails" Type="String" />
              <asp:Parameter Name="VenueID" Type="Int32" />
              <asp:Parameter Name="RateperHour" Type="Double" />
              <asp:Parameter Name="FirstFourHourRate" Type="Double" />
              <asp:Parameter Name="ReservationFee" Type="Double" />
              <asp:Parameter Name="OperationalExpense" Type="Double" />
              <asp:Parameter Name="PerformanceBond" Type="Double" />
              <asp:Parameter Name="EventID" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
      
      
      <br />
      <br />
      <asp:HyperLink ID="HyperLink1" runat="server" 
          NavigateUrl="~/Maintenance/EventsInsert.aspx">Add Facilty</asp:HyperLink>
  </fieldset>
  </div>
<div id="sidebar" style="height: 200px">
          <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
          </asp:ToolkitScriptManager>
          <br />
      <asp:SqlDataSource ID="NameSelect" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT EmpFName + ' ' + EmpLName AS Name FROM EmployeeTBL WHERE (UserId = @UserId)">
          <SelectParameters>
              <asp:ControlParameter ControlID="TextBox2" Name="UserId" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
          <br />
      <asp:Label ID="DeletedBy" runat="server" Text="Label" Visible="False" 
              style="color: #000000"></asp:Label>

          <br />
      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False" 
              style="color: #000000"></asp:Label>
          <br />
          <asp:TextBox ID="iid" runat="server" Visible="False"></asp:TextBox>
          <br />
          <asp:SqlDataSource ID="DeleteTrail" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              InsertCommand="INSERT INTO [DeleteTrail] ([DTrailTable], [ItemId], [DateRecorded], [DeletedBy]) VALUES (@DTrailTable, @ItemId, @DateRecorded, @DeletedBy)" 
              ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" >
              <InsertParameters>
                  <asp:Parameter Name="DTrailTable" Type="String" DefaultValue="Events" />
                  <asp:ControlParameter ControlID="iid" PropertyName="Text" Name="ItemId" Type="Int32" />
                  <asp:ControlParameter ControlID="DateRecorded" PropertyName="Text" DbType="DateTime" Name="DateRecorded" />
                  <asp:ControlParameter ControlID="DeletedBy" PropertyName="Text" Name="DeletedBy" Type="String" />

              </InsertParameters>
          </asp:SqlDataSource>

      </div>
</div>
</asp:Content>

