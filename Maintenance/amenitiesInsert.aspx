<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="amenitiesInsert.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Amenities Maintenance</legend>
      <table class="style1">
        <tr>
            <td style="visibility: hidden">
                Select Venue:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                    <asp:ListItem Selected="True">Venue</asp:ListItem>
                    <asp:ListItem>Transportation</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Amenities 
                Name:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Amenity Description</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Amount</td>
            <td style="margin-left: 40px" class="style1">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td>
            Quanity:</td>
        <td>
        
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        
        </td>
        </tr>
        <tr>
        <td>
            Damage Fee:</td>
        <td>
        
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        
        </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="margin-left: 40px">
                <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
            &nbsp;
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" />
                </td>
        </tr>
    </table>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [AmenityTBL] ([VenueId], [AmenityName], [Description], [Quantity], [Price], [dmgFee]) VALUES (@VenueId, @AmenityName, @Description, @Quantity, @Price, @dmgFee)" >
          <InsertParameters>
              <asp:ControlParameter ControlId='TextBox4' PropertyName='Text' Name="VenueId" Type="Int32" />
              <asp:ControlParameter ControlId='TextBox1' PropertyName='Text' Name="AmenityName" Type="String" />
              <asp:ControlParameter ControlId='TextBox2' PropertyName='Text' Name="Description" Type="String" />
              <asp:ControlParameter ControlId='TextBox5' PropertyName='Text' Name="Quantity" Type="Int32" />
              <asp:ControlParameter ControlId='TextBox3' PropertyName='Text' Name="Price" Type="Decimal" />
              <asp:ControlParameter ControlId='TextBox6' PropertyName='Text' Name="dmgFee" Type="Decimal" />
          </InsertParameters>
      </asp:SqlDataSource>
      <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
  </fieldset>
  </div>
  <div id="sidebar" style="height: 300px">

      </div>

</div>
</asp:Content>

