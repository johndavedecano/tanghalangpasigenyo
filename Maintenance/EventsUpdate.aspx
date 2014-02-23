<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="EventsUpdate.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
 <fieldset>
 <legend>Facilty Update</legend>

     <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
         DataKeyNames="EventID" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
         Height="38px" Width="391px"
         OnItemCommand="DetailView_ItemCommand"
         OnItemUpdated="DetailView_ItemUpdate" >
         <Fields>
             <asp:BoundField DataField="EventID" HeaderText="Facilty ID" InsertVisible="False" 
                 ReadOnly="True" SortExpression="EventID" Visible="False" />
             <asp:BoundField DataField="EventName" HeaderText="Facilty Name" 
                 SortExpression="EventName" />
             <asp:BoundField DataField="EventType" HeaderText="Facilty Type" 
                 SortExpression="EventType" />
             <asp:TemplateField HeaderText="Facilty Description" 
                 SortExpression="EventDetails">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Height="44px" 
                         Text='<%# Bind("EventDetails") %>' TextMode="MultiLine" Width="193px" style="font-family:Arial"></asp:TextBox>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventDetails") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("EventDetails") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField DataField="RateperHour" HeaderText="Rate per Hour" 
                 SortExpression="RateperHour" />
             <asp:BoundField DataField="FirstFourHourRate" HeaderText="First Three Hour Rate" 
                 SortExpression="FirstFourHourRate" />
             <asp:BoundField DataField="ReservationFee" HeaderText="Reservation Fee" 
                 SortExpression="ReservationFee" />
             <asp:TemplateField HeaderText="Service" SortExpression="VenueID" 
                 Visible="False">
                 <EditItemTemplate>
                     <asp:DropDownList ID="DropDownList1" runat="server" 
                         DataSourceID="SqlDataSource1" DataTextField="VenueName" 
                         DataValueField="VenueId" SelectedValue='<%# Bind("VenueId") %>'>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                         SelectCommand="SELECT [VenueName], [VenueId] FROM [VenueTBL]">
                     </asp:SqlDataSource>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("VenueID") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("VenueID") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField DataField="OperationalExpense" HeaderText="Operational Expense" 
                 SortExpression="OperationalExpense" Visible="False" />
             <asp:BoundField DataField="PerformanceBond" HeaderText="Performance Bond" 
                 SortExpression="PerformanceBond" Visible="False" />
             <asp:CommandField ShowEditButton="True" ButtonType="Button" />
         </Fields>
     </asp:DetailsView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
         DeleteCommand="DELETE FROM [EventTBL] WHERE [EventID] = @EventID" 
         InsertCommand="INSERT INTO [EventTBL] ([EventName], [EventType], [EventDetails], [VenueID], [RateperHour], [FirstFourHourRate], [ReservationFee], [OperationalExpense], [PerformanceBond]) VALUES (@EventName, @EventType, @EventDetails, @VenueID, @RateperHour, @FirstFourHourRate, @ReservationFee, @OperationalExpense, @PerformanceBond)" 
         SelectCommand="SELECT * FROM [EventTBL] WHERE ([EventID] = @EventID)" 
         UpdateCommand="UPDATE [EventTBL] SET [EventName] = @EventName, [EventType] = @EventType, [EventDetails] = @EventDetails, [VenueID] = @VenueID, [RateperHour] = @RateperHour, [FirstFourHourRate] = @FirstFourHourRate, [ReservationFee] = @ReservationFee, [OperationalExpense] = @OperationalExpense, [PerformanceBond] = @PerformanceBond WHERE [EventID] = @EventID">
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
             <asp:QueryStringParameter Name="EventID" QueryStringField="EventID" 
                 Type="Int32" />
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
          style="color: #000000"></asp:Label>
      <br />
      <asp:Label ID="Column" runat="server" Text="Label" Visible="False" 
          style="color: #000000"></asp:Label>
      <br />
      <asp:Label ID="OldValue" runat="server" Text="Label" Visible="False" 
          style="color: #000000"></asp:Label>
      <br />
      <asp:Label ID="NewValue" runat="server" Text="Label" Visible="False" 
          style="color: #000000"></asp:Label>
      <br />
      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False" 
          style="color: #000000"></asp:Label>
      <br />
      <asp:Label ID="UpdatedBy" runat="server" Text="Label" Visible="False" 
          style="color: #000000"></asp:Label>

      <asp:SqlDataSource ID="UpdateTrail" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [UpdateTrail] ([TrailTable], [ItemId], [TrailColumn], [OldValue], [NewValue], [DateRecorded], [UpdateBy]) VALUES (@TrailTable, @ItemId, @TrailColumn, @OldValue, @NewValue, @DateRecorded, @UpdateBy)" 
          >
          <InsertParameters>
              <asp:ControlParameter ControlID="Table" PropertyName="Text" Name="TrailTable" Type="String" />
              <asp:QueryStringParameter Name="ItemId" QueryStringField="EventID" Type="Int32" />
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

