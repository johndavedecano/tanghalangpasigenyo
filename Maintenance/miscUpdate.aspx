<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="miscUpdate.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
 <fieldset>
 <legend>Miscellaneous Update</legend>

     <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
         DataKeyNames="miscId" DataSourceID="miscUpdate" DefaultMode="Edit" 
         Height="92px" Width="224px"
         OnItemCommand="DetailView_ItemCommand"
         OnItemUpdated="DetailView_ItemUpdate" >
         <Fields>
             <asp:BoundField DataField="miscId" HeaderText="miscId" InsertVisible="False" 
                 ReadOnly="True" SortExpression="miscId" Visible="False" />
             <asp:BoundField DataField="miscName" HeaderText="Name" 
                 SortExpression="miscName" />
             <asp:BoundField DataField="miscDescription" HeaderText="Description" 
                 SortExpression="miscDescription" />
             <asp:TemplateField HeaderText="Rate" SortExpression="miscRate">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("miscRate") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("miscRate") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("miscRate") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Venue" SortExpression="venueId">
                 <EditItemTemplate>
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="venueSelect" 
                         DataTextField="VenueName" DataValueField="VenueId" 
                         SelectedValue='<%# Bind("venueId") %>'>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="venueSelect" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                         SelectCommand="SELECT [VenueName], [VenueId] FROM [VenueTBL]">
                     </asp:SqlDataSource>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("venueId","{0:n2}") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("venueId","0:n2") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:CommandField ShowEditButton="True" ButtonType="Button" />
         </Fields>
     </asp:DetailsView>
     <asp:SqlDataSource ID="miscUpdate" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
         DeleteCommand="DELETE FROM [miscTBL] WHERE [miscId] = @miscId" 
         InsertCommand="INSERT INTO [miscTBL] ([miscName], [miscDescription], [miscRate], [venueId]) VALUES (@miscName, @miscDescription, @miscRate, @venueId)" 
         SelectCommand="SELECT [miscId], [miscName], [miscDescription], [miscRate], [venueId] FROM [miscTBL] WHERE ([miscId] = @miscId)" 
         UpdateCommand="UPDATE [miscTBL] SET [miscName] = @miscName, [miscDescription] = @miscDescription, [miscRate] = @miscRate, [venueId] = @venueId WHERE [miscId] = @miscId">
         <DeleteParameters>
             <asp:Parameter Name="miscId" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="miscName" Type="String" />
             <asp:Parameter Name="miscDescription" Type="String" />
             <asp:Parameter Name="miscRate" Type="Double" />
             <asp:Parameter Name="venueId" Type="Int32" />
         </InsertParameters>
         <SelectParameters>
             <asp:QueryStringParameter Name="miscId" QueryStringField="miscId" 
                 Type="Int32" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="miscName" Type="String" />
             <asp:Parameter Name="miscDescription" Type="String" />
             <asp:Parameter Name="miscRate" Type="Double" />
             <asp:Parameter Name="venueId" Type="Int32" />
             <asp:Parameter Name="miscId" Type="Int32" />
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
          CssClass="style1"></asp:Label>
      <br />
      <asp:Label ID="Column" runat="server" Text="Label" Visible="False" 
          CssClass="style1"></asp:Label>
      <br />
      <asp:Label ID="OldValue" runat="server" Text="Label" Visible="False" 
          CssClass="style1"></asp:Label>
      <br />
      <asp:Label ID="NewValue" runat="server" Text="Label" Visible="False" 
          style="color: #000000"></asp:Label>
      <br />
      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False" 
          CssClass="style1"></asp:Label>
      <br />
      <asp:Label ID="UpdatedBy" runat="server" Text="Label" Visible="False" 
          CssClass="style1"></asp:Label>

      <asp:SqlDataSource ID="UpdateTrail" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [UpdateTrail] ([TrailTable], [ItemId], [TrailColumn], [OldValue], [NewValue], [DateRecorded], [UpdateBy]) VALUES (@TrailTable, @ItemId, @TrailColumn, @OldValue, @NewValue, @DateRecorded, @UpdateBy)" 
          >
          <InsertParameters>
              <asp:ControlParameter ControlID="Table" PropertyName="Text" Name="TrailTable" Type="String" />
              <asp:QueryStringParameter Name="ItemId" QueryStringField="miscId" Type="Int32" />
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

