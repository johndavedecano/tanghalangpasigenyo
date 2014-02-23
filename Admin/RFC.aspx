<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="RFC.aspx.cs" Inherits="Admin_RFC" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .command
        {
            float:right;
            height:200px;
            width:400px;
        }
        fieldset
        {
            border:1px solid #0088cc;
            color:Black;
        }
        legend
        {
            color:black;
        }
        .fields
        {
            float:right;
            width:180px;
            height: 20px;
            padding-bottom:10px;
        }
        .labels
        {
            float:left; 
            clear:both;
            width: 120px;
            height: 20px;
            padding-bottom:10px;
            color:#black;
        }
        .imgss
        {
            position:static;
        }
        .eventinfo
        {
            width:720px;
            height:auto;
            margin: auto;
        }
        .s1
        {
            float:left;
            width:350px;

        }
        .s2
        {
            float:right;
            width:340px;
            
        }
        .s3
        {
            float:left;
            width: 350px;
        }
        .command
        {
            float:right;
            width:340px;
            text-align:center;
        }
        .clear
        {
            clear:both;
        }
        .notif
        {
            text-align:center;
            font-size: x-large;
            color: #000000;
        font-family: "Book Antiqua";
    }
        .notif2
        {
            text-align:center;
            font-size: 30px;
            color: #f00;
        }
        
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper" style="text-align:left">
<div style="margin:auto; width:840px">

<br />
<br />
    <div class="notif">Request for Cancellation</div><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataKeyNames="ReservationId" 
        DataSourceID="RqtoCancelEventYSA" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" >
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Id" 
                ReadOnly="True" SortExpression="ReservationId" />
            <asp:BoundField DataField="VenueId" HeaderText="VenueId" 
                SortExpression="VenueId" Visible="False" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="ReservationDate" HeaderText="Reservation Date" 
                SortExpression="ReservationDate" />
            <asp:BoundField DataField="Expr1" HeaderText="Client Name" ReadOnly="True" 
                SortExpression="Expr1" />
            <asp:BoundField DataField="ClientContactNo" HeaderText="Client Contact Number" 
                SortExpression="ClientContactNo" />
            <asp:HyperLinkField DataNavigateUrlFields="ReservationId" 
                DataNavigateUrlFormatString="~/admin/RFC.aspx?ReservationId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>

<div class="notif2"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
<div class="eventinfo">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ReservationId" 
        DataSourceID="Cancel0">
        <EmptyDataTemplate>
            <span></span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">
            <div class="s1">
            <fieldset style="border-color: #FF3300">
            <legend>Reservation Details</legend>
            <div class="labels">Reservation Id:</div>
            <div class="fields">
            <asp:Label ID="ReservationIdLabel" runat="server" 
                Text='<%# Eval("ReservationId") %>' />
            </div>
            <div class="labels">Name of Event:</div>
            <div class="fields">
            <asp:Label ID="NameofEventLabel" runat="server" 
                Text='<%# Eval("NameofEvent") %>' />
            </div>
            <div class="labels">Reservation Date</div>
            <div class="fields">
            <asp:Label ID="ReservationDateLabel" runat="server" 
                Text='<%# Eval("ReservationDate") %>' />
            </div>
            <div class="labels">Start Time:</div>
            <div class="fields">
            <asp:Label ID="ReservationStartTimeLabel" runat="server" 
                Text='<%# Eval("ReservationStartTime") %>' />
            </div>
            <div class="labels">Number of Hours:</div>
            <div class="fields">
            <asp:Label ID="NumberofHoursLabel" runat="server" 
                Text='<%# Eval("NumberofHours") %>' />
            </div>
            <div class="labels">End Time</div>
            <div class="fields">
            <asp:Label ID="ReservationEndTimeLabel" runat="server" 
                Text='<%# Eval("ReservationEndTime") %>' />
            </div>
             <div class="labels" style="visibility: hidden">Venue Name:</div>
            <div class="fields">
            <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' />
            </div>
            </fieldset>
            </div>
            <div class="s2">
            <fieldset style="border-color: #FF3300">
            <legend>Client's Information</legend>
            <div class="labels">Client Name:</div>
            <div class="fields">
            <asp:Label ID="ClientLnameLabel" runat="server" 
                Text='<%# Eval("ClientLname") %>' />
            </div>
            <div class="labels">Contact No.:</div>
            <div class="fields">
            <asp:Label ID="ClientContactNoLabel" runat="server" 
                Text='<%# Eval("ClientContactNo") %>' />
            </div>
            <div class="labels">Address:</div>
            <div class="fields">
            <asp:Label ID="ClientAddressLabel" runat="server" 
                Text='<%# Eval("ClientAddress") %>' />
            </div>
            </fieldset>
            </div>
            <div class="clear"></div>
            <div class="s3">
            <fieldset style="border-color: #FF3300">
            <legend>Cancellation Details</legend>
            <div style="color:black" >Reason for Cancellation:</div>
            <div >
            <asp:Label ID="ReasonForCancellationLabel" runat="server" 
                Text='<%# Eval("ReasonForCancellation") %>' />
            </div>
            <br /><br />
            <div class="labels">Date Requested</div>
            <div class="fields">
            <asp:Label ID="DateRequestedLabel" runat="server" 
                Text='<%# Eval("DateRequested") %>' />
                </div>
            </fieldset>
            </div>
            <div class="command">
            <fieldset style="border-color: #FF3300">
            <legend style="color: #000000">Commands</legend>
             <asp:ImageButton ID="ImageButton1" runat="server" CssClass="imgss" ImageUrl="~/Resources/approved.png" Width="125" Height="47" onclick="ImageButton1_Click"/>
                 <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" 
        ConfirmText="Are you sure?" Enabled="True" TargetControlID="ImageButton1">
    </asp:ConfirmButtonExtender> 
             <asp:ImageButton ID="ImageButton2" runat="server" CssClass="imgss" ImageUrl="~/Resources/reject.png" Width="125" Height="47" onclick="ImageButton2_Click"/>
                 <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" 
        ConfirmText="Are you sure?" Enabled="True" TargetControlID="ImageButton2">
    </asp:ConfirmButtonExtender>
            </fieldset>
            </div>
            <div class="clear"></div>
            <br />

<br /></span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="1"></asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</div>

</div>
</div>
<div style="visibility: hidden">
<div class="notif">Ynares Center</div></div><br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataKeyNames="ReservationId" 
        DataSourceID="RqtoCancelEventYC" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" Visible="False" >
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                ReadOnly="True" SortExpression="ReservationId" />
            <asp:BoundField DataField="VenueId" HeaderText="VenueId" 
                SortExpression="VenueId" Visible="False" />
            <asp:BoundField DataField="NameofEvent" HeaderText="NameofEvent" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="ReservationDate" HeaderText="ReservationDate" 
                SortExpression="ReservationDate" />
            <asp:BoundField DataField="Expr1" HeaderText="Client Name" ReadOnly="True" 
                SortExpression="Expr1" />
            <asp:BoundField DataField="ClientContactNo" HeaderText="ClientContactNo" 
                SortExpression="ClientContactNo" />
            <asp:HyperLinkField DataNavigateUrlFields="ReservationId" 
                DataNavigateUrlFormatString="~/admin/RFC.aspx?ReservationId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="Cancel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
        <UpdateParameters>
            <asp:Parameter Name="Tag" Type="Int32" DefaultValue="0" />
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Approved" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [cancellationTBL] SET [Status] = @Status WHERE [ReservationId] = @ReservationId" >
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" DefaultValue="Approved" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>    
    <asp:SqlDataSource ID="Reject" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [cancellationTBL] SET [Status] = @Status WHERE [ReservationId] = @ReservationId" >
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" DefaultValue="Rejected" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Cancel0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, VenueTBL.VenueName, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, ReservationTBL.ReservationEndTime, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS ClientLname, ClientTBL.ClientContactNo, ClientTBL.ClientAddress, cancellationTBL.ReasonForCancellation, cancellationTBL.DateRequested FROM ReservationTBL INNER JOIN cancellationTBL ON ReservationTBL.ReservationId = cancellationTBL.ReservationId INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="RqtoCancelEventYSA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT cancellationTBL.ReservationId, ReservationTBL.VenueId, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Expr1, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN cancellationTBL ON ReservationTBL.ReservationId = cancellationTBL.ReservationId WHERE (ReservationTBL.VenueId = 1) AND (cancellationTBL.Status = 'Request') ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="RqtoCancelEventYC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT cancellationTBL.ReservationId, ReservationTBL.VenueId, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Expr1, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN cancellationTBL ON ReservationTBL.ReservationId = cancellationTBL.ReservationId WHERE (ReservationTBL.VenueId = 2) AND (cancellationTBL.Status = 'Request') ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ccancel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [CancelRrf] ([ReservationId], [Rrf]) VALUES (@ReservationId, @Rrf)" >
            <InsertParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
                <asp:SessionParameter SessionField="gg" Name="Rrf" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>


</asp:Content>

