<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Fees.aspx.cs" Inherits="Fees" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
        <link href="../Styles/Site2.css" rel="stylesheet" type="text/css" />
    <script src="../Admin/jquery.js" type="text/javascript"></script>
    <script src="../Admin/sliding_effect.js" type="text/javascript"></script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Fees</legend>
      Select Venue:<br />
      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
          <asp:ListItem Value="1">Ynares Sports Arena</asp:ListItem>
          <asp:ListItem Value="2">Ynares Center</asp:ListItem>
      </asp:DropDownList>
      <br />

      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="FeeId" DataSourceID="SqlDataSource1" 
          EmptyDataText="There are no data records to display.">
          <Columns>
              
              <asp:BoundField DataField="FeeId" HeaderText="FeeId" ReadOnly="True" 
                  SortExpression="FeeId" />
              <asp:BoundField DataField="VenueId" HeaderText="VenueId" 
                  SortExpression="VenueId" Visible="False" />
              <asp:BoundField DataField="FeeName" HeaderText="FeeName" 
                  SortExpression="FeeName" />
              <asp:BoundField DataField="FeeDescription" HeaderText="FeeDescription" 
                  SortExpression="FeeDescription" />
              <asp:BoundField DataField="FeeAmount" HeaderText="FeeAmount" 
                  SortExpression="FeeAmount" />
              <asp:BoundField DataField="LastChangedBy" HeaderText="LastChangedBy" 
                  SortExpression="LastChangedBy" />
              <asp:BoundField DataField="FeeDateUpdated" HeaderText="FeeDateUpdated" 
                  SortExpression="FeeDateUpdated" />
              <asp:HyperLinkField DataNavigateUrlFields="FeeId" 
                  DataNavigateUrlFormatString="~/Maintenance/feesupdate.aspx?FeeId={0}" Text="Edit" />
               <asp:CommandField ShowDeleteButton="True" />
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          DeleteCommand="DELETE FROM [FeeTBL] WHERE [FeeId] = @FeeId" 
          InsertCommand="INSERT INTO [FeeTBL] ([VenueId], [FeeName], [FeeDescription], [FeeAmount], [LastChangedBy], [FeeDateUpdated]) VALUES (@VenueId, @FeeName, @FeeDescription, @FeeAmount, @LastChangedBy, @FeeDateUpdated)" 
          ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" 
          SelectCommand="SELECT [FeeId], [VenueId], [FeeName], [FeeDescription], [FeeAmount], [LastChangedBy], [FeeDateUpdated] FROM [FeeTBL] WHERE ([VenueId] = @VenueId)" 
          UpdateCommand="UPDATE [FeeTBL] SET [VenueId] = @VenueId, [FeeName] = @FeeName, [FeeDescription] = @FeeDescription, [FeeAmount] = @FeeAmount, [LastChangedBy] = @LastChangedBy, [FeeDateUpdated] = @FeeDateUpdated WHERE [FeeId] = @FeeId">
          <DeleteParameters>
              <asp:Parameter Name="FeeId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="VenueId" Type="Int32" />
              <asp:Parameter Name="FeeName" Type="String" />
              <asp:Parameter Name="FeeDescription" Type="String" />
              <asp:Parameter Name="FeeAmount" Type="Decimal" />
              <asp:Parameter Name="LastChangedBy" Type="String" />
              <asp:Parameter DbType="Date" Name="FeeDateUpdated" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="DropDownList1" Name="VenueId" 
                  PropertyName="SelectedValue" Type="Int32" />
          </SelectParameters>
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

      <br />
      <asp:HyperLink ID="HyperLink1" runat="server" 
          NavigateUrl="~/Maintenance/feesInsert.aspx">Add New Fee</asp:HyperLink>
  </fieldset>
  </div>
  <div id="sidebar" style="height: 300px;">
<div class="c1">
<div class="postdate">
        <div class='month m-8'>Jun</div>
        <div class='day d-28'>30</div> 
        <div class='year y-2012'>2009</div> 
</div>


</div>
<div id="navigation-block">  
            <ul id="navlist">  
                <li class="sliding-element" id="logo1"><a href="../Admin/Tentative.aspx">Tentative Reservation</a></li>  
                <li class="sliding-element" id="logo3"><a href="../Admin/RFR.aspx">Request Reschedule</a></li> <br /> 
                <li class="sliding-element" id="logo4"><a href="../Admin/RFC.aspx">Requiest for Cancelation</a></li>  
                <li class="sliding-element" id="logo5"><a href="../Admin/Contracty.aspx">Confirm Billing</a></li>  <br />
                <li class="sliding-element" style="width: 215px;" id="logo2"><a href="../Admin/PaymentSys.aspx">Payment</a></li>  <br />
                <li class="sliding-element" id="logo6"><a href="../Admin/PracticeDates.aspx">Add Practice Date Event</a></li>  
                <li class="sliding-element" id="logo7"><a href="../Admin/Backups.aspx">Backup</a></li>  <br />
                <li class="sliding-element" id="logo2b" style="width: 215px;" ><a href="../Admin/EOS0.aspx">Events Operation Summary</a></li> <br /> 
                <li class="sliding-element" id="logo8"><a href="../Admin/UnsettledReservationd.aspx">Unsettled Reservations</a></li>
                <li class="sliding-element" id="logo9"><a href="../Admin/Refunds.aspx">Release Checks</a></li> 
            </ul>  
</div> 
      </div>
</div>
</asp:Content>

