<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Contracty.aspx.cs" Inherits="Admin_RFC" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        #wrapper
        {
            height: auto;
            background:white;
        }
        .command
        {
            float:right;
            height:200px;
            width:400px;
        }
        fieldset
        {
            border:1px solid #ff3300;
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
            color:black;
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
            font-size: 30px;
            color: #0088cc;
        }
        .notif2
        {
            text-align:center;
            font-size: 30px;
            color: #f00;
        }
                .Image1
        {
            position:static;
            width: 30px;
            height: 30px;
        }
    .style1
    {
        text-align: center;
        font-size: x-large;
        font-family: "Book Antiqua";
        color: #000000;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="wrapper" style="text-align:left">
<div style="margin:auto; width:840px; height:auto;">
<br /><br />
    <div class="style1">Confirm Billing </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" 
        DataSourceID="RqtoCancelEventYSA" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" DataKeyNames="ReservationId">
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Id" 
                SortExpression="ReservationId" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="NumberofHours" HeaderText="Number of Hours" 
                SortExpression="NumberofHours" />
            <asp:TemplateField HeaderText="Total" SortExpression="GrandTotal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GrandTotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("GrandTotal","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reservation Date" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReservationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Client Name" 
                SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="ClientContactNo" HeaderText="Client Contact Number" 
                SortExpression="ClientContactNo" />
            <asp:HyperLinkField DataNavigateUrlFields="Reservationid" 
                DataNavigateUrlFormatString="~/Admin/Contracty.aspx?rrId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
<div class="eventinfo">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ReservationId" 
        DataSourceID="EventDetails">
        
        
        <EmptyDataTemplate>
            <span></span>
        </EmptyDataTemplate>
     
        <ItemTemplate>
            <span style="">
            <div class="s1">
             <fieldset>
            <legend>Reservation Details</legend>
            <div style="visibility: hidden">
            <div class="labels">VenueName:</div>
            <div class="fields">
            <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' />
            </div></div>
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
            <div class="labels"> Reservation Date:</div>
            <div class="fields">
           
            <asp:Label ID="ReservationDateLabel" runat="server" 
                Text='<%# Eval("ReservationDate") %>' />
             </div>
            <div class="labels">Start Time:</div>
            <div class="fields">
            
            <asp:Label ID="ReservationStartTimeLabel" runat="server" 
                Text='<%# Eval("ReservationStartTime") %>' />
            </div>
            <div class="labels">End Time:</div>
            <div class="fields">
            
            <asp:Label ID="ReservationEndTimeLabel" runat="server" 
                Text='<%# Eval("ReservationEndTime") %>' />
            </div>
            <div class="labels">Number of Hours:</div>
            <div class="fields">
            
            <asp:Label ID="NumberofHoursLabel" runat="server" 
                Text='<%# Eval("NumberofHours") %>' />
            </div>
            <div class="labels">Total Amount:</div>
            <div class="fields">
            
            <asp:Label ID="EventReservedAmountLabel" runat="server" 
                Text='<%# Eval("EventReservedAmount") %>' />
            </div>
            <div style="visibility: hidden">
            <div class="labels">VenueLocation:</div>
            <div class="fields">
            <asp:Label ID="VenueLocationLabel" runat="server" 
                Text='<%# Eval("VenueLocation") %>' />
             </fieldset>
            </div></div>

            </div>
            <div class="s2">
            <fieldset>
            <legend>Client's Information</legend>
            <div class="labels">Client Name:</div>
            <div class="fields">
       
            <asp:Label ID="ClientLnameLabel" runat="server" 
                Text='<%# Eval("ClientLname") %>' />
           </div>
            <div class="labels"> Client Address:</div>
            <div class="fields">
           
            <asp:Label ID="ClientAddressLabel" runat="server" 
                Text='<%# Eval("ClientAddress") %>' />
            </div>
            <div class="labels"> Client Company:</div>
            <div class="fields">
            
            <asp:Label ID="ClientCompanyLabel" runat="server" 
                Text='<%# Eval("ClientCompany") %>' />
           </div>
            <div class="labels">Client Contact No.:</div>
            <div class="fields">
            
            <asp:Label ID="ClientContactNoLabel" runat="server" 
                Text='<%# Eval("ClientContactNo") %>' />
            </div>
            </fieldset>
            </div>
            <div style="clear:both"></div>
            <br />
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
    <div style="width: 720px; margin:auto">
    <div style="width:350px; height:auto; float: left">
    <asp:ListView ID="ListView2" runat="server" DataKeyNames="AmenityId" 
        DataSourceID="AmenityDetails">
   
        <EmptyDataTemplate>
            <span></span>
        </EmptyDataTemplate>
        
        <ItemTemplate>
        <span style="">
          <div class="s3">
            <fieldset>
            <legend>Amenity</legend>
            <div class="labels">Amenity Name:</div>
           <div class="fields"> <asp:Label ID="AmenityIdLabel" runat="server" Text='<%# Eval("AmenityId") %>' />
            </div>
            <div class="labels">Quantity:</div>
            <div class="fields">
            
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
            </div>
            <div style="visibility: hidden">
            <div class="labels"> Amount:</div>
            <div class="fields">
            <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
            <div class="labels">  Price:</div>
            <div class="fields">
          
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
            </div>
            </div>
            <br />
             
            </fieldset>
            </div>

        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <asp:DataPager ID="DataPager2" runat="server" PageSize="1">
            </asp:DataPager>
            <div style="">
            </div>
        </LayoutTemplate>
        
    </asp:ListView>
    </div>
    
    <div style="width:350px; height:auto; float: right; text-align:center">
        <br />
        <br />
        <div id="buttonhide" runat="server">
            <br />
            <asp:Button ID="Button1" runat="server" Font-Size="15pt" 
            Text="Generate Contract" onclick="Button1_Click" />
        </div>
        <br />
        <div id="prntHide" runat="server">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" 
                        ImageUrl="~/Resources/printer.png" Width="30px" CssClass="Image1" />
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="20px">Print Contract</asp:LinkButton>
                    <br />
                    <asp:Button ID="Button2" runat="server" Font-Size="12pt" 
                        onclick="Button2_Click" Text="Done" />
        </div></div>
    </div>
    </div>
    <div style="visibility: hidden">
    <div style="width:350px; height:auto; float: right">
    <asp:ListView ID="ListView3" runat="server" DataSourceID="FacilityDetails">

        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        
        <ItemTemplate>
            <span style="">
            <div class="s2">
            <fieldset>
            <legend>Facility</legend>
            <div class="labels" >Facility Name:</div>
            <div class="fields">
            <asp:Label ID="FacilityNameLabel" runat="server" 
                Text='<%# Eval("FacilityName") %>' />
            </div>
            <div class="labels">Number of Hours:</div>
            <div class="fields">

            <asp:Label ID="NoofHrsLabel" runat="server" Text='<%# Eval("NoofHrs") %>' />
             </div>
            <div class="labels">Rate per Hour:</div>
            <div class="fields">
           
            <asp:Label ID="RateperHourLabel" runat="server" 
                Text='<%# Eval("RateperHour") %>' />
           </div>
            <div class="labels">Amount:</div>
            <div class="fields">
            
            <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
            <br />
            </fieldset>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <asp:DataPager ID="DataPager3" runat="server" PageSize="1">
            </asp:DataPager>
            <div style="">
            </div>
        </LayoutTemplate>
        
    </asp:ListView>
    </div> </div>
   <div style="visibility: hidden">
    <div>
    <div style="width:350px; height:auto; float: left">
    <asp:ListView ID="ListView4" runat="server" DataSourceID="MiscDetails" 
            Visible="False">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        
        <ItemTemplate>
            <span style="">
            <div class="s1">
            <fieldset>
            <legend>Miscellaneous</legend>
            <div class="labels" >Miscellaneous:
            </div>
            
            <div class="fields">
            <asp:Label ID="miscNameLabel" runat="server" Text='<%# Eval("miscName") %>' />
            </div>
            
            <div class="labels">Amount:</div>
            <div class="fields">
          
            <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
            <br />
            </fieldset>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <asp:DataPager ID="DataPager4" runat="server" PageSize="1">
            </asp:DataPager>
            <div style="">
            </div>
        </LayoutTemplate>
        
    </asp:ListView>
    </div>
    <div style="visibility: hidden">
     <div class="notif">Ynares Center</div><br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" 
        DataSourceID="RqtoCancelEventYC" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" DataKeyNames="ReservationId" >
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                SortExpression="ReservationId" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NameofEvent" HeaderText="NameofEvent" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="NumberofHours" HeaderText="NumberofHours" 
                SortExpression="NumberofHours" />
            <asp:TemplateField HeaderText="GrandTotal" SortExpression="GrandTotal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GrandTotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("GrandTotal","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReservationDate" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReservationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="ClientContactNo" HeaderText="ClientContactNo" 
                SortExpression="ClientContactNo" />
            <asp:HyperLinkField DataNavigateUrlFields="Reservationid" 
                DataNavigateUrlFormatString="~/Admin/Contracty.aspx?rrId={0}" Text="View" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView></div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="RqtoCancelEventYSA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 1) AND (ReservationTBL.Tag = 3) ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="RqtoCancelEventYC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.NumberofHours, ReservationTBL.grandtotal AS GrandTotal, ReservationTBL.ReservationDate, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.VenueId = 2) AND (ReservationTBL.Tag = 3) ORDER BY ReservationTBL.ReservationDate DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="EventDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.ReservationEndTime, ReservationTBL.NumberofHours, ReservationTBL.EventReservedAmount, VenueTBL.VenueName, VenueTBL.VenueLocation, ClientTBL.ClientFname + ' ' +ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname As ClientLname, ClientTBL.ClientAddress, ClientTBL.ClientCompany, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="rrId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AmenityDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT AmenityTBL.AmenityName as AmenityId, rsvamntyTBL.Quantity, AmenityTBL.Price, rsvamntyTBL.Amount FROM AmenityTBL INNER JOIN rsvamntyTBL ON AmenityTBL.AmenityId = rsvamntyTBL.AmenityId INNER JOIN ReservationTBL ON rsvamntyTBL.ReservationId = ReservationTBL.ReservationId WHERE (ReservationTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="rrId" QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="FacilityDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT FacilityTBL.FacilityName, rsvfacTBL.NoofHrs, FacilityTBL.RateperHour, rsvfacTBL.amount FROM rsvfacTBL INNER JOIN FacilityTBL ON rsvfacTBL.FacilityId = FacilityTBL.FacilityId INNER JOIN ReservationTBL ON rsvfacTBL.ReservationId = ReservationTBL.ReservationId WHERE (ReservationTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="rrId" QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MiscDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT miscTBL.miscName, rsvmiscTBL.amount FROM miscTBL INNER JOIN rsvmiscTBL ON miscTBL.miscId = rsvmiscTBL.miscId INNER JOIN ReservationTBL ON rsvmiscTBL.ReservationId = ReservationTBL.ReservationId WHERE (ReservationTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="rrId" QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="TagUpdate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
        <UpdateParameters>
            <asp:Parameter Name="Tag" Type="Int32" DefaultValue="4" />
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="rrId" 
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div></div>
</div>
    </asp:Content>

