<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="facilitiesDelete.aspx.cs" Inherits="facilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            text-align:center;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Facilities Delete</legend>

     
      <table class="style1" align="center">
          <tr>
              <td>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataSourceID="SqlDataSource1" Width="495px" style="text-align: left; margin:auto"
          EmptyDataText="There are no data records to display." CssClass="mGrid">
                  <AlternatingRowStyle CssClass="alt" />
          <Columns>
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
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT [FacilityId], [FacilityName], [FacilityDescription], [RateperHour] FROM [FacilityTBL] WHERE ([GroupId] = @GroupId)">
          <SelectParameters>
              <asp:QueryStringParameter Name="GroupId" QueryStringField="GroupId" 
                  Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                      DeleteCommand="DELETE FROM FacilityTBL WHERE (GroupId = @groupid)" 
                      SelectCommand="SELECT FacilityTBL.* FROM FacilityTBL">
                      <DeleteParameters>
                           <asp:QueryStringParameter Name="GroupId" QueryStringField="GroupId" 
                  Type="Int32" />
                      </DeleteParameters>
                  </asp:SqlDataSource>
              </td>
          </tr>
      </table>

     
      
      <div style="text-align: center">
      <h3 style="Color:Red"> Are you sure you want to Delete?</h3>
      <asp:Button ID="Button1" runat="server" Text="Yes" onclick="Button1_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="Button2"
          runat="server" Text="No" onclick="Button2_Click" />
       </div>
  </fieldset>
  </div>
  <div id="sidebar" style="height: 200px; text-align: center">

      <asp:SqlDataSource ID="NameSelect" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT EmpFName + ' ' + EmpLName AS Name FROM EmployeeTBL WHERE (UserId = @UserId)">
          <SelectParameters>
              <asp:ControlParameter ControlID="TextBox2" Name="UserId" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
      <asp:Label ID="DeletedBy" runat="server" Text="Label" Visible="False"></asp:Label>

      <asp:Label ID="DateRecorded" runat="server" Text="Label" Visible="False"></asp:Label>
          <asp:TextBox ID="iid" runat="server" Visible="False"></asp:TextBox>
          <asp:SqlDataSource ID="DeleteTrail" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              InsertCommand="INSERT INTO [DeleteTrail] ([DTrailTable], [ItemId], [DateRecorded], [DeletedBy]) VALUES (@DTrailTable, @ItemId, @DateRecorded, @DeletedBy)" 
              ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" >
              <InsertParameters>
                  <asp:Parameter Name="DTrailTable" Type="String" DefaultValue="Facility" />
                  <asp:ControlParameter ControlID="iid" PropertyName="Text" Name="ItemId" Type="Int32" />
                  <asp:ControlParameter ControlID="DateRecorded" PropertyName="Text" DbType="DateTime" Name="DateRecorded" />
                  <asp:ControlParameter ControlID="DeletedBy" PropertyName="Text" Name="DeletedBy" Type="String" />

              </InsertParameters>
          </asp:SqlDataSource>

      </div>

</div>
</asp:Content>

