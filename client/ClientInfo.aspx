<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientInfo.aspx.cs" Inherits="ClientInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 128px;
        }
        .style3
        {
            color: #FF3300;
            font-family: "Matura MT Script Capitals";
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="wrapper">
   

  <div id="maincontent">
    

  <fieldset>
  <legend> Clients Information</legend>

      Fields with * are required.<br />
<table class="style1">
          <tr>
              <td class="style2">
                  Company</td>
              <td>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
              </td>
              <td>
                  &nbsp;</td>
              <td>
                  &nbsp;</td>
          </tr>
          <tr>
              <td class="style2">
                  Clients Name*:</td>
              <td style="margin-left: 40px">
                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 ControlToValidate="TextBox2" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
              </td>
              <td>
                  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                 ControlToValidate="TextBox3" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
              </td>
              <td>
                  <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                 ControlToValidate="TextBox4" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr>
          <td class="style2"></td>
          <td>Lastname*</td>
          <td>Firstname*</td> 
          <td>Middlename*</td>                   
          </tr>
          <tr>
              <td class="style2">
                  Address*:</td>
              <td style="margin-left: 40px" colspan="3">
                  <asp:TextBox ID="TextBox5" runat="server" Width="434px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                 ControlToValidate="TextBox5" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr>
              <td class="style2">
                  &nbsp;</td>
              <td style="margin-left: 40px">
                  &nbsp;</td>
              <td>
                  &nbsp;</td>
              <td>
                  &nbsp;</td>
          </tr>
          <tr>
              <td class="style2">
                  Contact Number*:</td>
              <td style="margin-left: 40px">
                  <asp:TextBox ID="TextBox7" runat="server" MaxLength="11"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                 ControlToValidate="TextBox7" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
              </td>
              <td>
                  <asp:TextBox ID="TextBox8" runat="server" Visible="false"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                 ControlToValidate="TextBox8" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
              </td>
              <td>
                  &nbsp;</td>
          </tr>
      </table>
  </fieldset>


  <div id="button">
      <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [ClientTbl] WHERE [UserId] = @UserId" 
          InsertCommand="INSERT INTO ClientTBL(ClientLname, ClientMname, ClientFname, ClientAddress, ClientEAddress, ClientContactNo, ClientCompany, UserId) VALUES (@ClientLname, @ClientMname, @ClientFname, @ClientAddress, @ClientEAddress, @ClientContactNo, @ClientCompany + ' ', @UserId)" 
          SelectCommand="SELECT [ClientLname], [ClientMname], [ClientFname], [ClientAddress], [ClientEAddress], [ClientContactNo], [ClientCompany], [UserId] FROM [ClientTbl] WHERE ([UserId] = @UserId)" 
          
          
          UpdateCommand="UPDATE [ClientTbl] SET [ClientLname] = @ClientLname, [ClientMname] = @ClientMname, [ClientFname] = @ClientFname, [ClientAddress] = @ClientAddress, [ClientContactNo] = @ClientContactNo, [ClientCompany] = @ClientCompany, [Status] = @Status WHERE [UserId] = @UserId">
          <DeleteParameters>
              <asp:Parameter Name="UserId" Type="String" />
          </DeleteParameters>

          <InsertParameters>
              <asp:Parameter Name="ClientLname" />
              <asp:Parameter Name="ClientMname" />
              <asp:Parameter Name="ClientFname" />
              <asp:Parameter Name="ClientAddress" />
              <asp:Parameter Name="ClientEAddress" />
              <asp:Parameter Name="ClientContactNo" />
              <asp:Parameter Name="ClientCompany" />
              <asp:Parameter Name="UserId" />
          </InsertParameters>

          <SelectParameters>
              <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" 
                  Type="String" />
          </SelectParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="ClientLname" Type="String" />
              <asp:ControlParameter ControlID="TextBox4" PropertyName="Text" Name="ClientMname" Type="String" />
              <asp:ControlParameter ControlID="TextBox3" PropertyName="Text" Name="ClientFname" Type="String" />
              <asp:ControlParameter ControlID="TextBox5" PropertyName="Text" Name="ClientAddress" Type="String" />
              <asp:ControlParameter ControlID="TextBox7" PropertyName="Text" Name="ClientContactNo" Type="String" />
              <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="ClientCompany" Type="String" />
              <asp:ControlParameter ControlID="TextBox8" PropertyName="Text" Name="Status" Type="String"/>
              
              <asp:QueryStringParameter QueryStringField="UserId" Name="UserId" Type="String" />
              
          </UpdateParameters>
      </asp:SqlDataSource>
      <br />
  </div>
  </div>
  <div id="sidebar">
<br />
    <br />
    <br />
    <br />
<br />
<br />
<br />
<marquee  behavior="scroll" direction="up" speed="2" class="style3">
<br />
Pasig's New Seat of Culture<br /> 
and<br /> 
the Arts<br /> 
is also the stunning background of your event. <br /> 
<br /></marquee></div>
</div>

    </asp:Content>

