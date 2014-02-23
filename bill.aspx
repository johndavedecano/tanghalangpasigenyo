﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bill.aspx.cs" Inherits="client_bill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Tanghalang Pasigueño</title>
    <style type="text/css" media="print">

        .wrapper
        { 
            margin: auto;
            width:600px;
        }
        img
        {
            position:static;
            width:100px;
            height:100px
            
        }
        .header
        {
            text-align:center;
        }
        .opt
        {
            font-weight:bolder;
        }
        .top
        {
            padding-left: 400px;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 544px;
        }
        .style3
        {
            width: 20px;
        }
        .style4
        {
            width: 200px;
            text-align:right;  
        }    
    </style>
    <style type="text/css" media="screen">
        .wrapper
        { 
            margin: auto;
            width:600px;
        }
        img
        {
            position:static;
            width:100px;
            height:100px
            
        }
        .header
        {
            text-align:center;
        }
        .opt
        {
            font-weight:bolder;
        }
        .top
        {
            padding-left: 400px;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 544px;
        }
        .style3
        {
            width: 20px;
        }
        .style4
        {
            width: 200px;
            text-align:right;  
        }
        .style5
        {
            width: 544px;
            height: 23px;
        }
        .style6
        {
            width: 20px;
            height: 23px;
        }
        .style7
        {
            width: 200px;
            text-align: right;
            height: 23px;
        }
        .clientinfo
        {
            width: 250px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <div class="header">
            <asp:Image ID="Image1" runat="server" 
                ImageUrl="~/Resources/pasig city logo.gif" />
            <br />
            <span>Republic of the Philippines</span><br />
            <span>City Government of Pasig City</span><br />
            <span class="opt">OFFICE OF THE CITY TREASURER</span>
        </div>
        <br />
        <br />
        <br />
        <div class="top">
        Date:&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </div>
        <br />
        <br />
        <div class="clientinfo">
        Mr./Ms. 
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
        <br />
        <br />
        <br />
        <div class="bodi">
        <strong>Subject:</strong> Rental Amount for the use of 
            <asp:Label ID="Venue" runat="server" Text="Service Name"></asp:Label> &nbsp;on 
            <asp:Label ID="EventDate" runat="server" Text="Event Date"></asp:Label> &nbsp;from 
            <asp:Label ID="StartTime" runat="server" Text="00:00"></asp:Label> &nbsp;to
            <asp:Label ID="EndTime" runat="server" Text="00:00"></asp:Label> &nbsp;for the event titled "<asp:Label ID="EventName" runat="server" Text="Name of Event"></asp:Label>".
        </div>
        <br />
        <table class="style1">
            <tr>
                <td class="style2">
                    Rental Amount</td>
                <td class="style3">
                    P</td>
                <td class="style4">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Total Expenses in Amenities</td>
                <td class="style3">
                    </td>
                <td class="style4"  style="border-bottom: 1px solid black">
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                  <div style="visibility: hidden">   Total Expenses in Facilities</div></td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                   <div style="visibility: hidden">  <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></div>
                </td>
            </tr>
            <tr>
                <td class="style2">
                   <div style="visibility: hidden">  Total Expenses in Miscellaneous</div></td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                  <div style="visibility: hidden">   <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></div>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Total</td>
                <td class="style3">
                    P</td>
                <td class="style4" style="border-bottom: 1px solid black">
                    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                  <div style="visibility: hidden">  Operational Expenses</div></td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <div style="visibility: hidden">  <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></div>
                </td>
            </tr>
            <tr>
                <td class="style2">
                      <div style="visibility: hidden">Performance Bond</div></td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                     <div style="visibility: hidden"> <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></div>
                </td>
            </tr>
        </table>
        <br />

    
    <asp:SqlDataSource ID="ExpensesSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT EventTBL.OperationalExpense, EventTBL.PerformanceBond, ReservationTBL.EventReservedAmount FROM EventTBL INNER JOIN ReservationTBL ON EventTBL.EventID = ReservationTBL.EventId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Amenity" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT SUM(Amount) AS AmntySum FROM rsvamntyTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Facility" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT SUM(amount) AS FacilitySum FROM rsvfacTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Misc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT SUM(amount) AS MiscSum FROM rsvmiscTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>

    
        <asp:SqlDataSource ID="DetailsSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.ReservationEndTime, ReservationTBL.NameofEvent, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientAddress FROM ReservationTBL INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.ReservationId = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>

    
     </div>
    </form>

</body>
</html>
