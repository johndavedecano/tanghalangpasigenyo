<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="misc.aspx.cs" Inherits="misc" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Miscellaneous Maintenance</legend>
      
      
      Select Venue:<br />
      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
          DataSourceID="SqlDataSource1" DataTextField="VenueName" 
          DataValueField="VenueId">
          <asp:ListItem Value="1">Ynares Sports Arena</asp:ListItem>
          <asp:ListItem Value="2">Ynares Center</asp:ListItem>
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT [VenueName], [VenueId] FROM [VenueTBL]">
      </asp:SqlDataSource>
      <br />
      
      
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataSourceID="miscView" Width="564px" DataKeyNames="miscId"
          EmptyDataText="There are no data records to display." CssClass="mGrid" 
          onrowdeleting="GridView1_RowDeleting">
          <AlternatingRowStyle CssClass="alt" />
          <Columns>
              
              <asp:BoundField DataField="miscId" HeaderText="miscId" 
                  SortExpression="miscId" InsertVisible="False" ReadOnly="True" />
              <asp:BoundField DataField="miscName" HeaderText="Name" 
                  SortExpression="miscName" />
              <asp:BoundField DataField="miscDescription" HeaderText="Description" 
                  SortExpression="miscDescription" />
              <asp:TemplateField HeaderText="Rate/Event" SortExpression="miscRate">
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("miscRate") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("miscRate","{0:n2}") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:HyperLinkField DataNavigateUrlFields="miscId" 
                  DataNavigateUrlFormatString="~/Maintenance/miscUpdate.aspx?miscId={0}" 
                  Text="Edit" />
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
      <asp:SqlDataSource ID="miscView" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM miscTBL WHERE (miscId = @miscId)" 
          
          SelectCommand="SELECT [miscId], [miscName], [miscDescription], [miscRate] FROM [miscTBL] WHERE ([venueId] = @venueId) and (isDeleted = 0)">
          <DeleteParameters>
              <asp:Parameter Name="miscId" />
          </DeleteParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="DropDownList1" Name="venueId" 
                  PropertyName="SelectedValue" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
      
      
      <br />
      <br />
      <asp:HyperLink ID="HyperLink1" runat="server" 
          NavigateUrl="~/Maintenance/miscInsert.aspx">Add Miscellaneous </asp:HyperLink>
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
      <asp:Label ID="DeletedBy" runat="server" Text="Label" Visible="False"></asp:Label>

          <br />
      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False"></asp:Label>
          <br />
          <asp:TextBox ID="iid" runat="server" Visible="False"></asp:TextBox>
          <br />
          <asp:SqlDataSource ID="DeleteTrail" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              InsertCommand="INSERT INTO [DeleteTrail] ([DTrailTable], [ItemId], [DateRecorded], [DeletedBy]) VALUES (@DTrailTable, @ItemId, @DateRecorded, @DeletedBy)" 
              ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" >
              <InsertParameters>
                  <asp:Parameter Name="DTrailTable" Type="String" DefaultValue="Miscellaneous" />
                  <asp:ControlParameter ControlID="iid" PropertyName="Text" Name="ItemId" Type="Int32" />
                  <asp:ControlParameter ControlID="DateRecorded" PropertyName="Text" DbType="DateTime" Name="DateRecorded" />
                  <asp:ControlParameter ControlID="DeletedBy" PropertyName="Text" Name="DeletedBy" Type="String" />

              </InsertParameters>
          </asp:SqlDataSource>

      </div>
</div>
</asp:Content>

