<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="miscInsert.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 500px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Add Miscellaneous</legend>
  
      <table class="style1">
          <tr>
              <td>
                  Select a Venue:</td>
              <td>
                  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="VenueSelect" 
                      DataTextField="VenueName" DataValueField="VenueId">
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="VenueSelect" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                      SelectCommand="SELECT [VenueId], [VenueName] FROM [VenueTBL]">
                  </asp:SqlDataSource>
              </td>

          </tr>
          <tr>
              <td>
                  Miscellaneous Name:</td>
              <td>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
              </td>

          </tr>
          <tr>
              <td>
                  Miscellaneous Description:</td>
              <td>
                  <asp:TextBox ID="TextBox2" runat="server" Height="42px" Width="172px" 
                      TextMode="MultiLine" style="font-family:Arial"></asp:TextBox>
              </td>

          </tr>
          <tr>
              <td>
                  Rate:</td>
              <td>
                  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
              </td>

          </tr>
          <tr>
              <td>
                  &nbsp;</td>
              <td>
                  <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
              </td>

          </tr>

      </table>
      <asp:SqlDataSource ID="miscInsert" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [miscTBL] ([miscName], [miscDescription], [miscRate], [venueId]) VALUES (@miscName, @miscDescription, @miscRate, @venueId)" >
          <InsertParameters>
              <asp:ControlParameter ControlId="TextBox1" PropertyName="Text" Name="miscName" Type="String" />
              <asp:ControlParameter ControlId="TextBox2" PropertyName="Text" Name="miscDescription" Type="String" />
              <asp:ControlParameter ControlId="TextBox3" PropertyName="Text" Name="miscRate" Type="Double" />
              <asp:ControlParameter ControlID="TextBox4" PropertyName="Text" Name="venueId" Type="Int32" />
          </InsertParameters>
      </asp:SqlDataSource>
      <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
  </fieldset>

  </div>
  <div id="sidebar" style="height: 200px">

      </div>
</div>
</asp:Content>

