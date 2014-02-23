<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EventInfo-Se.aspx.cs" Inherits="client_EventInfo" %>

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
        height: auto;
        }
        #fleft
        {float:left;
         width: 300px;
         }
        #fright
        {float:right;}
</style>
<script type="text/javascript" src="../_scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    function openWin() {
        window.open("../bill.aspx?ReservationId=", "mywindow", "menubar=1,resizable=1,width=700,height=900");
        myWindow.document.write("<p>This is 'myWindow'</p>");
        myWindow.focus();
    }
</script>
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
            Reservation ID:
            <asp:Label ID="ReservationIdLabel" runat="server" 
                Text='<%# Eval("ReservationId") %>' />
            <br /><br />
            Name of Event:
            <asp:Label ID="NameofEventLabel" runat="server" 
                Text='<%# Eval("NameofEvent") %>' />
            <br /><br />
            ReservationDate:
            <asp:Label ID="ReservationDateLabel" runat="server" 
                Text='<%# Eval("ReservationDate", "{0:MMMM dd, yyyy}") %>' />
            <br /><br />
            </div id="fright">
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
           <div style="visibility: hidden">
              Service Name:
            <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' />
             </t>Event Type:
            <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' />
            </div>
            </div>
</span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div><asp:DataPager ID="DataPager1" runat="server" PageSize="1"></asp:DataPager>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>
        <div id="balanceHide" runat="server">
        <fieldset enableviewstate="False">
        <legend>Balance</legend>
            <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource1">
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate> 
                <ItemTemplate>
                    <div style="float:left; font-size:20px">Balance:
                    <asp:Label ID="BalanceLabel" runat="server" Text='<%# Eval("Balance", "{0:n2}") %>' />
                    </div>
                    <div style="float:right; width:300px; font-size:20px">
                    Last Payment Date:
                    <asp:Label ID="DateChangedLabel" runat="server" 
                        Text='<%# Eval("DateChanged", "{0:MMMM dd, yyyy}") %>' />
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div ID="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div><asp:DataPager ID="DataPager1" runat="server" PageSize="1"></asp:DataPager>
                    <div style="">
                    </div>
                </LayoutTemplate>   
            </asp:ListView>
        </fieldset>
        </div>
        <div id="tag5Hide" runat="server">
  <fieldset>
  <legend>
      Options
  </legend>
<table>            
    <tr>
        <td>       
            <asp:Button ID="rc2" runat="server" Text="Cancel Reservation" width="294px" 
                onclick="rc2_Click" />
            <asp:Button ID="rc1" runat="server" 
            Text="Request For Cancellation Of Reservation" Width="294px" 
            onclick="Button3_Click" />
        </td>
        <td>
            <asp:Button ID="Button5" runat="server" Text="Add or Remove Amenities" 
            style="text-align: center" Width="293px" onclick="Button5_Click"  />
            <asp:Button ID="Button6" runat="server" Text="Add or Remove Amenities" 
            style="text-align: center" Width="293px" onclick="Button5_Click" 
                Visible="False"  />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Generate Billing Statement" 
            style="text-align: center" Width="293px" onclick="Button1_Click" />    
        </td>          
        <td>
            &nbsp;</td>
    </tr>
</table>
  </fieldset>
  </div>
    <asp:SqlDataSource ID="EventsSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, EventTBL.EventType, ReservationTBL.grandtotal FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                SelectCommand="SELECT [Balance], [DateChanged] FROM [BalanceTBL] WHERE ([ReservationId] = @ReservationId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

</fieldset>
    <asp:SqlDataSource ID="UserIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ClientTbl.UserId FROM ReservationTBL INNER JOIN ClientTbl ON ReservationTBL.ClientId = ClientTbl.ClientId WHERE (ReservationTBL.ReservationId = @ReservationId)">
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
        SelectCommand="SELECT [ReservationId], [NameofEvent], [ReservationDate] FROM [ReservationTBL] WHERE (ClientId = @ClientId) and (ReservationTBL.tag > 0)  and (ReservationTBL.tag < 8)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ClientID" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="ClientID" runat="server" Visible="False"></asp:TextBox>
    <asp:SqlDataSource ID="ClientIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT ClientId, Tag FROM ReservationTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</div>
</asp:Content>

