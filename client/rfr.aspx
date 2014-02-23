<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="rfr.aspx.cs" Inherits="client_rfc" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        #sidebar
        {
        width:250px;    
        }
        #maincontent
        {
        width: 650px;    
        }
                #fleft
        {float:left;
         width: 300px;
         }
        #fright
        {float:right;}
        .testing
        {
            background: pink;
            color:White;
            }
        .testing2
        {
            background: black;
            color:White;    
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
                  <div style="visibility: hidden">Service Name:
            <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' /></div>
              </t><div style="visibility: hidden">Event Type:
            <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' /></div>
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
    </fieldset>
     <asp:SqlDataSource ID="EventsSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, EventTBL.EventType, ReservationTBL.grandtotal FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <fieldset>
    <legend>Request for Reschedule Reservation</legend>
          
        New Date:&nbsp; 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
     ControlToValidate="TextBox1"  forecolor="red"  ErrorMessage="*"></asp:RequiredFieldValidator>
       
        <asp:PopupControlExtender ID="TextBox1_PopupControlExtender" runat="server" 
            DynamicServicePath="" Enabled="True" ExtenderControlID="" 
            PopupControlID="Panel1" Position="Bottom" TargetControlID="TextBox1">
        </asp:PopupControlExtender>
        <br />
        <br />
        Reason for Reschedule of Reservation:<br />
        <asp:TextBox ID="TextBox3" runat="server" Height="75px" TextMode="MultiLine" 
            Width="562px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 ControlToValidate="TextBox3"  forecolor="red"  ErrorMessage="*"></asp:RequiredFieldValidator>
          
          
        <br />
        <div style="text-align:right; padding-right:55px;">
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
          </div>
    </fieldset>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">
    </asp:ToolkitScriptManager>
      <asp:Panel ID="Panel1" runat="server" Width="275px" BackColor="White" style="border: 1px solid gray">
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
          <ContentTemplate>
              <asp:Calendar ID="Calendar1" runat="server" Width="275px" BackColor="#ffffff"
                  ondayrender="Calendar1_DayRender" 
                  onselectionchanged="Calendar1_SelectionChanged" style="color: #000000"></asp:Calendar>
          </ContentTemplate>
          </asp:UpdatePanel>
          &nbsp;</asp:Panel>

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
    <span style="color: #FF3300">Your Reservationss</span>
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
        SelectCommand="SELECT [ClientId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
          <asp:SqlDataSource ID="ReservedDateSelect" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              
              
        SelectCommand="SELECT DateRecord, VenueId, Type FROM DateRepository WHERE (VenueId = @VenueId)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="VenueId" Name="VenueId" 
                      PropertyName="Text" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="PracticeDateSelect" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              
              
        SelectCommand="SELECT DateRecord FROM DateRepository WHERE (VenueId = @VenueId) AND (Type = @Type)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="VenueId" Name="VenueId" 
                      PropertyName="Text" />
                  <asp:Parameter DefaultValue="prac" Name="Type" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="VenueIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [VenueId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
              <SelectParameters>
                  <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                      Type="Int32" />
              </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="VenueId" runat="server" Visible="False"></asp:TextBox>
    <br />
    <asp:SqlDataSource ID="DateTimeUpdate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [ReservationTBL] WHERE [ReservationId] = @ReservationId" 
        InsertCommand="INSERT INTO [ReservationTBL] ([ReservationDate], [ReservationStartTime]) VALUES (@ReservationDate, @ReservationStartTime)" 
        SelectCommand="SELECT [ReservationDate], [ReservationStartTime], [ReservationId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)" 
        UpdateCommand="UPDATE [ReservationTBL] SET [ReservationDate] = @ReservationDate WHERE [ReservationId] = @ReservationId">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="ReservationDate" />
            <asp:Parameter DbType="Time" Name="ReservationStartTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="Textbox1" PropertyName="Text" DbType="Date" Name="ReservationDate" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </div>
</div>
</asp:Content>

