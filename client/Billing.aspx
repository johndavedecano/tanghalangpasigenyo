<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="client_rfc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        #sidebar
        {
        width:250px;
        color: #FF3300;
    }
        #maincontent
        {
        width: 650px;   
        height:auto; 
        }
        #fleft
        {float:left;
         width: 300px;
         }
        #fright
        {float:right;}
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 400px;
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
        text-align: justify;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="wrapper">
<div id="maincontent">
<fieldset>
<legend>Reservation Details</legend>
   <asp:ListView ID="ListView1" runat="server" DataKeyNames="ReservationId" 
        DataSourceID="EventsSelect">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">
            <div id="fleft">
            <div style="visibility: hidden">
            Service Name:
            <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' /></div>
            Reservation Id:
            <asp:Label ID="ReservationIdLabel" runat="server" 
                Text='<%# Eval("ReservationId") %>' />
            <br /><br />
            Name of Event:
            <asp:Label ID="NameofEventLabel" runat="server" 
                Text='<%# Eval("NameofEvent") %>' />
            <br /><br />
            Reservation Date:
            <asp:Label ID="ReservationDateLabel" runat="server" 
                Text='<%# Eval("ReservationDate", "{0:MMMM dd, yyyy}") %>' />
            <br /><br />
            </div id="fright">
           <div style="visibility: hidden"> </t>Event Type:
            <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' /></div>
            <div>
            StartTime:
            <asp:Label ID="ReservationStartTimeLabel" runat="server" 
                Text='<%# Eval("ReservationStartTime") %>' />
            <br /><br />
            Number of hours to be Used:
            <asp:Label ID="NumberofHoursLabel" runat="server" 
                Text='<%# Eval("NumberofHours") %>' />
            <br /><br />
            Total:
            <asp:Label ID="grandtotalLabel" runat="server" 
                Text='<%# Eval("grandtotal", "{0:n2}") %>' />
            <br />
            </div>
<br /></span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div><asp:DataPager ID="DataPager1" runat="server" PageSize="1"></asp:DataPager>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>

    <fieldset>
    <legend>Billing Statement</legend>  
        <div class="style5">
    Pay Tanghalang Pasigueño Administration Office for the Reservation Fee and Balance of Rental Amount in not later than seven (7) calendar days before the actual date of the use of the Tanghalang Pasigueño.
            <br />
      <br /> 
        </div>
    <div style="text-align:right">
       <asp:LinkButton ID="LinkButton1" runat="server">Printable Billing Statement</asp:LinkButton>
        </div>
        <table class="style1">
            <tr style="visibility: hidden">

                <td class="style2">
                    Total Expenses in Facilities</td>
                <td class="style3">
                    ₱</td>
                <td class="style4">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>      
            <tr>
                <td class="style2">
                    Rental Amount</td>
                <td class="style3">
                    ₱</td>
                <td class="style4">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Total Expenses in Amenities</td>
                <td class="style3">
                    ₱</td>
                <td class="style4">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>         
            <tr style="visibility: hidden">

                <td class="style2">
                    Total Expenses in Micellaneous </td>
                <td class="style3">
                    ₱</td>
                <td class="style4">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>            
            <tr style="visibility: hidden">

                <td class="style2">
                    Operational Expenses</td>
                <td class="style3">
                    ₱</td>
                <td class="style4">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <strong>Total</strong></td>
                <td class="style3">
                    ₱</td>
                <td class="style4" style="border-bottom: 1px double black">
                    <strong><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></strong>
                </td>
            </tr>
              <tr style="visibility: hidden">

                <td class="style2">
                    Performance Bond</td>
                <td class="style3">
                    ₱</td>
                <td class="style4" style="border-bottom: 1px solid black">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
           
        </table>
  
        <div style="color:Red">
            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
        </div>
        <div style="text-align:center">
            <asp:Button ID="Button1" runat="server" Text="Confirm Billing" Width="200px" 
                onclick="Button1_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Change Amenities" 
                Width="200px" onclick="Button2_Click"/>
            <br />
            <asp:SqlDataSource ID="BalanceInsert" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                InsertCommand="INSERT INTO [BalanceTBL] ([Balance], [GrandTotal], [ReservationId]) VALUES (@Balance, @GrandTotal, @ReservationId)" >
                <InsertParameters>
                    <asp:ControlParameter ControlID="Label7" PropertyName="Text" Name="Balance" Type="Double" />
                    <asp:ControlParameter ControlID="Label7" PropertyName="Text" Name="GrandTotal" Type="Double" />
                    <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </fieldset>
</fieldset>
        <asp:SqlDataSource ID="EventsSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, EventTBL.EventType, ReservationTBL.grandtotal FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
<div id="sidebar">  
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/client/ClientAccount.aspx">Client Information</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/place/Step1.aspx">Reserve your Event</asp:HyperLink>
    <br />
    <br />
    <span style="color: #FF3300">Your Reservations</span>
    <asp:ListView ID="ListView2" runat="server" DataKeyNames="ReservationId" 
        DataSourceID="RsSelect" style="color: #FF3300">
        <EmptyDataTemplate>
            <dd>No Reservations Yet.
        </EmptyDataTemplate>
        <ItemTemplate>
            <li style="">
                <asp:HyperLink ID="myHyperlink"
             Text='<%# Eval("NameofEvent") + " (" + Eval("ReservationDate","{0:MMMM d, yyyy}") +")" %>'
             NavigateUrl='<%# FormatUrl( (int) Eval("ReservationId")) %>'
             runat="server">[myHyperlink]</asp:HyperLink>
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul ID="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="RsSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [ReservationId], [NameofEvent], [ReservationDate] FROM [ReservationTBL] WHERE (ClientId = @ClientId) and (ReservationTBL.tag > 0) and (ReservationTBL.tag < 8)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ClientID" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="ClientID" runat="server" Visible="False"></asp:TextBox>
    <asp:SqlDataSource ID="ClientIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [ClientId], [Tag] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label9" runat="server" Text="Label" Visible="false"></asp:Label>
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
    <asp:SqlDataSource ID="TagUpdate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [ReservationTBL] WHERE [ReservationId] = @ReservationId" 
        InsertCommand="INSERT INTO [ReservationTBL] ([Tag]) VALUES (@Tag)" 
        SelectCommand="SELECT [Tag], [ReservationId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)" 
        UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Tag" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tag" DefaultValue=3 Type="Int32" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="TagUpdate0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [ReservationTBL] WHERE [ReservationId] = @ReservationId" 
        InsertCommand="INSERT INTO [ReservationTBL] ([Tag]) VALUES (@Tag)" 
        SelectCommand="SELECT [Tag], [ReservationId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)" 
        
        UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Tag" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tag" DefaultValue=4 Type="Int32" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="Validates" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT COUNT(ClientTBL.ClientId) AS Expr1 FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ClientTBL.ClientId = @ClientId) AND (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:SessionParameter Name="ClientId" SessionField="ClientID" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>




    <asp:SqlDataSource ID="TypeSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, EventTBL.EventType FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>




    <br />
    </div>
</div>
</asp:Content>

