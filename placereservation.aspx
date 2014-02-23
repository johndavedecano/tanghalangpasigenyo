<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="placereservation.aspx.cs" Inherits="placereservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 600px;
        }
        .style3
        {
            width: 400px;
        }
        .style5
        {
            width: 300px;
        }
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 154px;
            margin-left: 40px;
        }
        .style8
        {
            text-align: left;
        }
        .style9
    {
        width: 154px;
        margin-left: 40px;
        height: 26px;
    }
    .style10
    {
        height: 26px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <fieldset>
    <legend>Client Information</legend>
   
        <table class="style2">
            <tr>
                <td>
                    Company</td>
                <td style="margin-left: 80px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Client Name:</td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox2" runat="server" ToolTip="fname"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="margin-left: 40px; text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Lastname</td>
                <td style="text-align: left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Firstname</td>
                <td style="margin-left: 40px" class="style8">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Middlename</td>
            </tr>
            <tr>
                <td>
                    Email Address:</td>
                <td style="margin-left: 80px">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td style="margin-left: 40px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Address:</td>
                <td colspan="2" style="margin-left: 80px">
                    <asp:TextBox ID="TextBox6" runat="server" Width="314px"></asp:TextBox>
                </td>
                <td style="margin-left: 40px">
                    &nbsp;</td>
            </tr>
        </table>
   
    </fieldset>
    <fieldset>
    <legend>Events Details</legend>
  <div id="Div1">
      <table class="style3">
          <tr>
              <td>
                  Name of Event:</td>
              <td>
                  <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td>
                  Date of Event:</td>
              <td style="margin-left: 40px">
                  <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
              <td>
                  Time:</td>
              <td style="margin-left: 80px">
                  <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
              </td>
          </tr>

      </table>
        </div>
  <div id="Div2">
            <table class="style5">
                <tr>
                    <td>
                        Type of Event:</td>
                    <td>
                  <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="106px">
                      <asp:ListItem>Special Event</asp:ListItem>
                      <asp:ListItem>Cockfight/Derbies</asp:ListItem>
                      <asp:ListItem>Practice</asp:ListItem>
                      <asp:ListItem>Event on Parking Lot</asp:ListItem>
                  </asp:DropDownList>
                    </td>
                </tr>
            </table>
      *For Practice Event<br />
      Airconditioned:
      <asp:RadioButton ID="Yes" Text="Yes" runat="server" />
      <asp:RadioButton ID="No" Text="No" runat="server" />
      <br />
      <asp:CheckBox ID="CheckBox1" Text="Shotclock/Scoreboard" runat="server" />
      <br />
        </div>
    </fieldset> 
    <fieldset>
    <legend>Amenities Request</legend>
    <div id="Div3">
        <table class="style6">
            <tr>
                <td class="style7">
                    
                    Rental Rooms
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:CheckBox ID="CheckBox2" Text="Dug-out I and II" runat="server" />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>With Aircon</asp:ListItem>
                        <asp:ListItem>w/o Aircon</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:CheckBox ID="CheckBox3" Text="Administrative Office" runat="server" />
                </td>
                <td class="style10">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>With Aircon</asp:ListItem>
                        <asp:ListItem>w/o Aircon</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:CheckBox ID="CheckBox4" Text="Small Rooms" runat="server" />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server">
                        <asp:ListItem>With Aircon</asp:ListItem>
                        <asp:ListItem>w/o Aircon</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Other Facilities
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:CheckBox ID="CheckBox5" Text="Stage" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox7" Text="Parking Lot" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:CheckBox ID="CheckBox6" Text="Canteen" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <div id="Div4">
        <table class="style3">
            <tr>
                <td>
                    Amenities</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <asp:CheckBox ID="CheckBox8" Text="Short Table" runat="server" />
                </td>
                <td>
                    Quantity:&nbsp;
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <asp:CheckBox ID="CheckBox9" Text="Short Table" runat="server" />
                </td>
                <td>
                    Quantity:&nbsp;
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <asp:CheckBox ID="CheckBox10" Text="Chair" runat="server" />
                </td>
                <td>
                    Quantity:&nbsp;
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        </div>
     </fieldset>
     <div id="button">
         <asp:Button ID="Button2" runat="server" Text="Submit" onclick="Button2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="Button1" runat="server" Text="Cancel" />
         <br />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:YnaresDatabaseConnectionString1 %>" 
             DeleteCommand="DELETE FROM [ClientTbl] WHERE [ClientId] = @ClientId" 
             InsertCommand="INSERT INTO [ClientTbl] ([ClientFname], [ClientMname], [ClientLname], [ClientAddress], [ClientEAddress], [ClientContactNo]) VALUES (@ClientFname, @ClientMname, @ClientLname, @ClientAddress, @ClientEAddress, @ClientContactNo)" 
             ProviderName="<%$ ConnectionStrings:YnaresDatabaseConnectionString1.ProviderName %>" 
             SelectCommand="SELECT [ClientId], [ClientFname], [ClientMname], [ClientLname], [ClientAddress], [ClientEAddress], [ClientContactNo] FROM [ClientTbl]" 
             UpdateCommand="UPDATE [ClientTbl] SET [ClientFname] = @ClientFname, [ClientMname] = @ClientMname, [ClientLname] = @ClientLname, [ClientAddress] = @ClientAddress, [ClientEAddress] = @ClientEAddress, [ClientContactNo] = @ClientContactNo WHERE [ClientId] = @ClientId">
             <DeleteParameters>
                 <asp:Parameter Name="ClientId" Type="Int32" />
             </DeleteParameters>

             <InsertParameters>
                 <asp:ControlParameter ControlId='TextBox2' PropertyName='Text' Name="ClientFname" Type="String" />
                 <asp:ControlParameter ControlId='TextBox3' PropertyName='Text' Name="ClientMname" Type="String" />
                 <asp:ControlParameter ControlId='TextBox4' PropertyName='Text' Name="ClientLname" Type="String" />
                 <asp:ControlParameter ControlId='TextBox5' PropertyName='Text' Name="ClientAddress" Type="String" />
                 <asp:ControlParameter ControlId='TextBox6' PropertyName='Text' Name="ClientEAddress" Type="String" />
                 <asp:ControlParameter ControlId='TextBox1' PropertyName='Text' Name="ClientContactNo" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="ClientFname" Type="String" />
                 <asp:Parameter Name="ClientMname" Type="String" />
                 <asp:Parameter Name="ClientLname" Type="String" />
                 <asp:Parameter Name="ClientAddress" Type="String" />
                 <asp:Parameter Name="ClientEAddress" Type="String" />
                 <asp:Parameter Name="ClientContactNo" Type="String" />
                 <asp:Parameter Name="ClientId" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>

         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
             ConnectionString="<%$ ConnectionStrings:YnaresDatabaseConnectionString1 %>" 
             DeleteCommand="DELETE FROM [ReservationTbl] WHERE [ReservationId] = @ReservationId" 
             InsertCommand="INSERT INTO [ReservationTbl] ([ReservationName], [ReservationDate], [ReservationTime], [EventId], [StaffName], [ReservationStatus], [ClientId]) VALUES (@ReservationName, @ReservationDate, @ReservationTime, @EventId, @StaffName, @ReservationStatus, @ClientId)" 
             ProviderName="<%$ ConnectionStrings:YnaresDatabaseConnectionString1.ProviderName %>" 
             SelectCommand="SELECT [ReservationId], [ReservationName], [ReservationDate], [ReservationTime], [EventId], [StaffName], [ReservationStatus], [ClientId] FROM [ReservationTbl]" 
             UpdateCommand="UPDATE [ReservationTbl] SET [ReservationName] = @ReservationName, [ReservationDate] = @ReservationDate, [ReservationTime] = @ReservationTime, [EventId] = @EventId, [StaffName] = @StaffName, [ReservationStatus] = @ReservationStatus, [ClientId] = @ClientId WHERE [ReservationId] = @ReservationId">
             <DeleteParameters>
                 <asp:Parameter Name="ReservationId" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:ControlParameter ControlId='TextBox7' PropertyName='Text' Name="ReservationName" Type="String" />
                 <asp:ControlParameter ControlId='TextBox8' PropertyName='Text' DbType="Date" Name="ReservationDate" />
                 <asp:ControlParameter ControlId='TextBox9' PropertyName='Text' DbType="Time" Name="ReservationTime" />
                 <asp:ControlParameter ControlId='TextBox1' PropertyName='Text' Name="EventId" Type="Int32" />
                 <asp:ControlParameter ControlId='TextBox13' PropertyName='Text' Name="StaffName" Type="String" />
                 <asp:ControlParameter ControlId='TextBox14' PropertyName='Text' Name="ReservationStatus" Type="String" />
                 <asp:ControlParameter ControlId='TextBox1' PropertyName='Text' Name="ClientId" Type="Int32" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="ReservationName" Type="String" />
                 <asp:Parameter DbType="Date" Name="ReservationDate" />
                 <asp:Parameter DbType="Time" Name="ReservationTime" />
                 <asp:Parameter Name="EventId" Type="Int32" />
                 <asp:Parameter Name="StaffName" Type="String" />
                 <asp:Parameter Name="ReservationStatus" Type="String" />
                 <asp:Parameter Name="ClientId" Type="Int32" />
                 <asp:Parameter Name="ReservationId" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:YnaresDatabaseConnectionString1 %>" 
                SelectCommand="SELECT TOP(1) ClientId FROM [ClientTbl] ORDER BY ClientId DESC"></asp:SqlDataSource>
         <asp:TextBox ID="TextBox13" runat="server" ></asp:TextBox>
         <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
         <asp:LoginName ID="HeadLoginName" runat="server" Visible="False" />
    </div>
</asp:Content>

