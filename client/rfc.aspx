<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="rfc.aspx.cs" Inherits="client_rfc" %>

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
            <div>
            Start Time:
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
            <div style="visibility: hidden"> Venue:
            <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' />
            </t><div style="visibility: hidden">Event Type:
            <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' />
            </div></div>
            </div>
</span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
            </asp:DataPager>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>

    <fieldset>
    <legend>Reason to Cancel Reservation</legend>

        <div style="text-align:center">

                    <asp:TextBox ID="TextBox1" runat="server" Height="67px" TextMode="MultiLine" 
                        Width="569px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
 ControlToValidate="TextBox1"  forecolor="red"  ErrorMessage="*"></asp:RequiredFieldValidator>

</div>
<div style="text-align:right; padding-right: 10px;">
    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
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

        <asp:SqlDataSource ID="ccancel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [CancelRrf] ([ReservationId], [Rrf]) VALUES (@ReservationId, @Rrf)" >
            <InsertParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
                <asp:SessionParameter SessionField="gg" Name="Rrf" Type="String" />
            </InsertParameters>
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
        SelectCommand="SELECT [ClientId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
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
            <asp:Parameter Name="Tag" DefaultValue=0 Type="Int32" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
</div>
</asp:Content>

