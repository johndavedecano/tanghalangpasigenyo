<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="feesUpdate.aspx.cs" Inherits="Fees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Fees</legend>
      <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
          DataKeyNames="FeeId" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
          Height="50px" Width="125px"
          OnItemCommand="DetailView_ItemCommand"
          OnItemUpdated="DetailView_ItemUpdate"   >
          <Fields>
              <asp:BoundField DataField="FeeId" HeaderText="FeeId" InsertVisible="False" 
                  ReadOnly="True" SortExpression="FeeId" />
              <asp:TemplateField HeaderText="VenueId" SortExpression="VenueId">
                  <EditItemTemplate>
                      <asp:DropDownList ID="DropDownList1" runat="server" 
                          SelectedValue='<%# Bind("VenueId") %>'>
                          <asp:ListItem Value="1">Ynares Sport Arena</asp:ListItem>
                          <asp:ListItem Value="2">Ynares Center</asp:ListItem>
                      </asp:DropDownList>
                  </EditItemTemplate>
                  <InsertItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VenueId") %>'></asp:TextBox>
                  </InsertItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("VenueId") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="FeeName" HeaderText="FeeName" 
                  SortExpression="FeeName" />
              <asp:BoundField DataField="FeeDescription" HeaderText="FeeDescription" 
                  SortExpression="FeeDescription" />
              <asp:BoundField DataField="FeeAmount" HeaderText="FeeAmount" 
                  SortExpression="FeeAmount" />
              <asp:BoundField DataField="LastChangedBy" HeaderText="LastChangedBy" 
                  SortExpression="LastChangedBy" ReadOnly="True" />
              <asp:BoundField DataField="FeeDateUpdated" HeaderText="FeeDateUpdated" 
                  SortExpression="FeeDateUpdated" ReadOnly="True" />
              <asp:CommandField ShowEditButton="True" />
          </Fields>
      </asp:DetailsView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [FeeTBL] WHERE [FeeId] = @FeeId" 
          InsertCommand="INSERT INTO [FeeTBL] ([VenueId], [FeeName], [FeeDescription], [FeeAmount], [LastChangedBy], [FeeDateUpdated]) VALUES (@VenueId, @FeeName, @FeeDescription, @FeeAmount, @LastChangedBy, @FeeDateUpdated)" 
          SelectCommand="SELECT * FROM [FeeTBL] WHERE ([FeeId] = @FeeId)" 
          UpdateCommand="UPDATE [FeeTBL] SET [VenueId] = @VenueId, [FeeName] = @FeeName, [FeeDescription] = @FeeDescription, [FeeAmount] = @FeeAmount, [LastChangedBy] = @LastChangedBy, [FeeDateUpdated] = @FeeDateUpdated WHERE [FeeId] = @FeeId">
          <DeleteParameters>
              <asp:Parameter Name="FeeId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
              <asp:Parameter Name="FeeName" Type="String" />
              <asp:Parameter Name="FeeDescription" Type="String" />
              <asp:Parameter Name="FeeAmount" Type="Decimal" />
              <asp:Parameter Name="LastChangedBy" Type="String" />
              <asp:Parameter DbType="Date" Name="FeeDateUpdated" />
          </InsertParameters>
          <SelectParameters>
              <asp:QueryStringParameter Name="FeeId" QueryStringField="FeeId" Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
              <asp:Parameter Name="FeeName" Type="String" />
              <asp:Parameter Name="FeeDescription" Type="String" />
              <asp:Parameter Name="FeeAmount" Type="Decimal" />
              <asp:ControlParameter ControlId='TextBox1' PropertyName='Text' Name="LastChangedBy" Type="String" />
              <asp:ControlParameter ControlId='TextBox2' PropertyName='Text' DbType="Date" Name="FeeDateUpdated" />
              <asp:Parameter Name="FeeId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
      <br />
      <br />
      <br />
      <br />
  </fieldset>
  <asp:LoginName ID="HeadLoginName" runat="server" Visible="False" />
      <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
      <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
  </div>
  <div id="sidebar" style="height: 300px;">

      </div>

</div>
</asp:Content>

