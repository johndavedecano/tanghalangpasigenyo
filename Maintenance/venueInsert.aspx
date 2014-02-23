<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="venueInsert.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 309px;
        }
        .style2
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Service Maintenance</legend>
  

      <table class="style1">
          <tr>
              <td class="style2">
                  Service Name:</td>
              <td>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="style2" colspan="2">
                  &nbsp;</td>
          </tr>
          <tr>
              <td class="style2">
                  Service Location:</td>
              <td>
                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="style2">
                  Seating Capacity</td>
              <td>
                  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="style2">
                  Rate per Hour</td>
              <td>
                  <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td class="style2">
                  &nbsp;</td>
              <td>
                  &nbsp;</td>
          </tr>
          <tr>
              <td class="style2">
                  &nbsp;</td>
              <td>
                  <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
              &nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
              </td>
          </tr>
          <tr>
              <td class="style2">
                  &nbsp;</td>
              <td>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                      DeleteCommand="DELETE FROM [VenueTBL] WHERE [VenueId] = @VenueId" 
                      InsertCommand="INSERT INTO [VenueTBL] ([VenueName], [VenueLocation], [RateperHour]) VALUES (@VenueName, @VenueLocation, @RateperHour)" 
                      SelectCommand="SELECT * FROM [VenueTBL]" 
                      UpdateCommand="UPDATE [VenueTBL] SET [VenueName] = @VenueName, [VenueLocation] = @VenueLocation, [RateperHour] = @RateperHour WHERE [VenueId] = @VenueId">
                      <DeleteParameters>
                          <asp:Parameter Name="VenueId" Type="Int32" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:ControlParameter ControlId='TextBox1' PropertyName='Text' Name="VenueName" Type="String" />
                          <asp:ControlParameter ControlId='TextBox2' PropertyName='Text' Name="VenueLocation" Type="String" />
                          <asp:ControlParameter ControlId='TextBox3' PropertyName='Text'  Name="RateperHour" Type="Decimal" />
                      </InsertParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="VenueName" Type="String" />
                          <asp:Parameter Name="VenueLocation" Type="String" />
                          <asp:Parameter Name="RateperHour" Type="Decimal" />
                          <asp:Parameter Name="VenueId" Type="Int32" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
              </td>
          </tr>
      </table>
  

  </fieldset>
  </div>
  <div id="sidebar" style="height: 200px">
      <h4>
          &nbsp;</h4>

</div>
</asp:Content>

