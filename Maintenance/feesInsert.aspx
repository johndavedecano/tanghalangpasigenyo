<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="feesInsert.aspx.cs" Inherits="Fees" %>

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
  <legend>Fees</legend>
      <table class="style1">
        <tr>
            <td>
                Select Venue:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem>Ynares Sports Arena</asp:ListItem>
                    <asp:ListItem>Ynares Center</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Fee Name:</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Description</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Amount</td>
            <td style="margin-left: 40px">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="margin-left: 40px">
                <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
            </td>
        </tr>
    </table>
  </fieldset>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>"
          DeleteCommand="DELETE FROM [FeeTBL] WHERE [FeeId] = @FeeId" InsertCommand="INSERT INTO [FeeTBL] ([VenueId], [FeeName], [FeeDescription], [FeeAmount], [LastChangedBy], [FeeDateUpdated]) VALUES (@VenueId, @FeeName, @FeeDescription, @FeeAmount, @LastChangedBy, @FeeDateUpdated)"
          ProviderName="<%$ ConnectionStrings:YnaresDatabaseConnectionString1.ProviderName %>"
          SelectCommand="SELECT * FROM [FeeTBL]"
          
          UpdateCommand="UPDATE [FeeTBL] SET [VenueId] = @VenueId, [FeeName] = @FeeName, [FeeDescription] = @FeeDescription, [FeeAmount] = @FeeAmount, [LastChangedBy] = @LastChangedBy, [FeeDateUpdated] = @FeeDateUpdated WHERE [FeeId] = @FeeId">
          <DeleteParameters>
              <asp:Parameter Name="FeeId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlId='TextBox4' PropertyName='Text'  Name="VenueId" Type="Int32" />
              <asp:ControlParameter ControlId='TextBox6' PropertyName='Text' Name="FeeName" Type="String" />
              <asp:ControlParameter ControlId='TextBox2' PropertyName='Text' Name="FeeDescription" Type="String" />
              <asp:ControlParameter ControlId='TextBox3' PropertyName='Text' Name="FeeAmount" Type="Decimal" />
              <asp:ControlParameter ControlId='TextBox1' PropertyName='Text' Name="LastChangedBy" Type="String" />
              <asp:ControlParameter ControlId='TextBox5' PropertyName='Text' DbType="Date" Name="FeeDateUpdated" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
              <asp:Parameter Name="FeeName" Type="String" />
              <asp:Parameter Name="FeeDescription" Type="String" />
              <asp:Parameter Name="FeeAmount" Type="Decimal" />
              <asp:Parameter Name="LastChangedBy" Type="String" />
              <asp:Parameter DbType="Date" Name="FeeDateUpdated" />
              <asp:Parameter Name="FeeId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
      <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
      <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
      <asp:TextBox ID="TextBox5" runat="server" Visible="False"></asp:TextBox>
       <asp:LoginName ID="HeadLoginName" runat="server" Visible="False" />
  </div>
  <div id="sidebar" style="height: 300px;">
    
      </div>

</div>
</asp:Content>

