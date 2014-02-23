<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="facilitiesInsert2.aspx.cs" Inherits="facilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Facilities Maintenance</legend>
    <table class="style1">
        <tr>
            <td>
                Select Venue</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Ynares Sports Arena</asp:ListItem>
                    <asp:ListItem>Ynares Center</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
                <tr>
        <td>
            Facility Name:</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
            Description:</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Height="51px" Width="181px"></asp:TextBox>
        </td>
        </tr>
        <tr>
            <td>
                RateperHour without Aircon</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                RateperHour with Aircon</td>
            <td style="margin-left: 40px">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="margin-left: 40px">
                <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
                </td>
        </tr>
    </table>
  </fieldset>
      
      <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
      <asp:TextBox ID="TextBox5" runat="server" Visible="False"></asp:TextBox>
      <br />
      <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
      <asp:TextBox ID="TextBox8" runat="server" Visible="False"></asp:TextBox>
      
      <br />
      <br />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [FacilityTBL] WHERE [FacilityId] = @FacilityId" 
          InsertCommand="INSERT INTO [FacilityTBL] ([FacilityName], [FacilityDescription], [VenueId], [RateperHour]) VALUES (@FacilityName, @FacilityDescription, @VenueId, @RateperHour);SET @NewId = Scope_Identity()" 
          SelectCommand="SELECT * FROM [FacilityTBL]" 
          
          UpdateCommand="UPDATE [FacilityTBL] SET [GroupId] = @GroupId WHERE [FacilityId] = @FacilityId" 
          oninserted="SqlDataSource1_Inserted">
          <DeleteParameters>
              <asp:Parameter Name="FacilityId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlId='TextBox5' PropertyName='Text'  Name="FacilityName" Type="String" />
              <asp:ControlParameter ControlId='TextBox2' PropertyName='Text'  Name="FacilityDescription" Type="String" />
              <asp:ControlParameter ControlId='TextBox4' PropertyName='Text'  Name="VenueId" Type="Int32" />
              <asp:ControlParameter ControlId='TextBox3' PropertyName='Text'  Name="RateperHour" Type="Decimal" />
              <asp:Parameter Direction="Output" Name="NewId" Type="Int32"/>
          </InsertParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlId='TextBox6' PropertyName='Text'  Name="GroupId" Type="Int32" />
              <asp:ControlParameter ControlId='TextBox6' PropertyName='Text'  Name="FacilityId" Type="Int32" />   
          </UpdateParameters>
      </asp:SqlDataSource>
      <br />
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [FacilityTBL] ([FacilityName], [FacilityDescription], [VenueId], [RateperHour], [GroupId]) VALUES (@FacilityName, @FacilityDescription, @VenueId, @RateperHour, @GroupId)" >
          <InsertParameters>
              <asp:ControlParameter ControlId='TextBox8' PropertyName='Text'  Name="FacilityName" Type="String" />
              <asp:ControlParameter ControlId='TextBox2' PropertyName='Text'  Name="FacilityDescription" Type="String" />
              <asp:ControlParameter ControlId='TextBox4' PropertyName='Text'  Name="VenueId" Type="Int32" />
              <asp:ControlParameter ControlId='TextBox7' PropertyName='Text'  Name="RateperHour" Type="Decimal" />
              <asp:ControlParameter ControlId='TextBox6' PropertyName='Text'  Name="GroupId" Type="Int32" />
          </InsertParameters>

      </asp:SqlDataSource>
  </div>
  <div id="sidebar" style="height: 200px">


      </div>

</div>
</asp:Content>

