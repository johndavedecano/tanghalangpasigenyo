<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="EventsInsert.aspx.cs" Inherits="amenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 500px;
        }
        .style2
        {
            font-size: large;
        }
        .style3
        {
            width: 159px;
        }
        .style4
        {
            width: 160px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Add Facilty</legend>
  
      <table class="style1">
          
          <tr>
                <td>Facility Name</td>
                <td>
                    <asp:TextBox ID="EventNameTB" runat="server" >
                    </asp:TextBox>
                </td>
          </tr>

          <tr>
                <td>Facility&nbsp; Type</td>
                <td>
                    <asp:DropDownList ID="EventTypeDDL" runat="server">
                        <asp:ListItem>Big Event</asp:ListItem>
                        <asp:ListItem>Small Event</asp:ListItem>
                    </asp:DropDownList>
                </td>
          </tr>

          <tr>
                <td>Facility Details</td>
                <td>
                    <asp:TextBox ID="EventDetailsTB" runat="server" Height="64px" TextMode="MultiLine" Width="175px" style="font-family:Arial">
                    </asp:TextBox>
                </td>
          </tr>

          <tr>
              <td style="visibility: hidden">

                  Select a Venue:</td>
              <td>
                  <asp:DropDownList ID="VenueTypeDDL" runat="server" DataSourceID="VenueSelect" 
                      DataTextField="VenueName" DataValueField="VenueId" Visible="False">
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="VenueSelect" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                      SelectCommand="SELECT [VenueId], [VenueName] FROM [VenueTBL]">
                  </asp:SqlDataSource>
              </td>
          </tr>

      </table>

      <br />    <span class="style2">Rates</span><br />


      <table>
       
      <tr>
            <td class="style3">Rate Per Hour</td>
            <td>
                <asp:TextBox ID="RatePerHourTB" runat="server">
                </asp:TextBox>
            </td>
      </tr>
           
      <tr>
            <td class="style3">First Three Hours Rate</td>
            <td>
                <asp:TextBox ID="FirstFourHourTB" runat="server">
                </asp:TextBox>
            </td>
      </tr>

      </table>

      <br />    <span class="style2">Fees</span><br />

      <table>
      
      <tr>
            <td class="style4">Reservation Fee</td>
            <td>
                <asp:TextBox ID="ReservationFeeTB" runat="server">
                </asp:TextBox>
            </td>
      </tr>

      <tr style="visibility: hidden">
            <td class="style4">Operational Expense</td>
            <td>
                <asp:TextBox ID="OperationalExpenseTB" runat="server" Visible="False"></asp:TextBox>
            </td>
      </tr>
      
      <tr style="visibility: hidden">
            <td class="style4">Performance Bond</td>
            <td>
                <asp:TextBox ID="PerformanceBondTB" runat="server" Visible="False"></asp:TextBox>
            </td>
      </tr>

      </table>
      <asp:TextBox ID="EventTypeTB" runat="server" Visible="False"></asp:TextBox>
      <asp:TextBox ID="VenueIdTB" runat="server" Visible="False"></asp:TextBox>
      <br />
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="SubmitBtn" runat="server" onclick="SubmitBtn_Click" 
          Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="CancelBtn" runat="server" onclick="CancelBtn_Click" 
          Text="Cancel" />
      <br />
      <asp:SqlDataSource ID="EventsInsert" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          InsertCommand="INSERT INTO [EventTBL] ([EventName], [EventType], [EventDetails], [VenueID], [RateperHour], [FirstFourHourRate], [ReservationFee], [OperationalExpense], [PerformanceBond]) VALUES (@EventName, @EventType, @EventDetails, @VenueID, @RateperHour, @FirstFourHourRate, @ReservationFee, @OperationalExpense, @PerformanceBond)"           
          >
          
          <InsertParameters>
              <asp:ControlParameter ControlId="EventNameTB" PropertyName="Text" Name="EventName" Type="String" />
              <asp:ControlParameter ControlId="EventTypeTB" PropertyName="Text" Name="EventType" Type="String" />
              <asp:ControlParameter ControlId="EventDetailsTB" PropertyName="Text" Name="EventDetails" Type="String" />
              <asp:ControlParameter ControlId="VenueIdTB" PropertyName="Text" Name="VenueID" Type="Int32" />
              <asp:ControlParameter ControlId="RatePerHourTB" PropertyName="Text" Name="RateperHour" Type="Double" />
              <asp:ControlParameter ControlId="FirstFourHourTB" PropertyName="Text" Name="FirstFourHourRate" Type="Double" />
              <asp:ControlParameter ControlId="ReservationFeeTB" PropertyName="Text" Name="ReservationFee" Type="Double" />
              <asp:ControlParameter ControlId="OperationalExpenseTB" PropertyName="Text" Name="OperationalExpense" Type="Double" />
              <asp:ControlParameter ControlId="PerformanceBondTB" PropertyName="Text" Name="PerformanceBond" Type="Double" />
          </InsertParameters>
          
      </asp:SqlDataSource>
  </fieldset>

  </div>
  <div id="sidebar" style="height: 200px">

      </div>

</div>
</asp:Content>

