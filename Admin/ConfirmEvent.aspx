<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="ConfirmEvent.aspx.cs" Inherits="ConfirmEvent" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        
        .link
        {
            color: Blue;
            text-decoration: underline;
        }
        
        .g
        {
            width: 20px;
        }
        #sidebar
        {
        width:250px;    
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
        {
            float:right;
        }       
        .hdn
        {
            color: #FF3300;
            font-family: Bookman Old Style;
            font-size: 20px;
        }
        .Image1
        {
            position:static;
            width: 30px;
            height: 30px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div id="wrapper">
 
    </div>
    <div id="maincontent" style="height: auto;">

        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>

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
             Venue:
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
            <div style="visibility: hidden">
             </t>Event Type:
            <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' /></div>
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
            <br />
            </div>
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

</fieldset>
<fieldset>

    <div style="float: left; width:300px;">
    <div class="hdn"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Receipt No."></asp:Label>
    &nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:MaskedEditExtender ID="TextBox1_MaskedEditExtender" runat="server" 
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                    TargetControlID="TextBox3" MaskType="Number" Mask="9999999999" 
                    PromptCharacter="#">
                </asp:MaskedEditExtender>  
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" 
                    ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
        <br />
    <br />
    <div style="text-align: center"><asp:Button ID="Button1" runat="server" 
            Text="Confirm" onclick="Button1_Click" />&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
        <br />
        </div>
    </div>
    <div runat="server" ID="printhead" style="float: right; width:300px;">
        <div class="hdn" style="color:Red;  text-align:center;font-size: 15px;">Confirmed! </div>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Done" />
        <div style="text-align: center; visibility: hidden">
        <asp:Image ID="Image1" runat="server" 
                ImageUrl="~/Resources/printer.png" CssClass="Image1" />
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="20px">Print Receipt</asp:LinkButton>
        </div>
    
    </div>
</fieldset> </div>
    <div id="sidebar" style="height: auto;">

        <div class="hdn" style="font-size:16px">Reservations the are Affected</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="EventSelect" CssClass="mGrid">
            <Columns>
                <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                    SortExpression="NameofEvent" />
                <asp:BoundField DataField="ClientLname" HeaderText="Client Lastname" 
                    SortExpression="ClientLname" />
                <asp:BoundField DataField="ClientContactNo" HeaderText="Client Contact Number" 
                    SortExpression="ClientContactNo" />
            </Columns>
        </asp:GridView>

        <br />
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
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, EventTBL.EventType, ReservationTBL.grandtotal FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="DateSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [ReservationDate], [VenueId], [EventReservedAmount], [grandtotal] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="tera" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="tgt" runat="server" Visible="False"></asp:TextBox>
        <asp:SqlDataSource ID="EventSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            
            SelectCommand="SELECT ReservationTBL.NameofEvent, ClientTBL.ClientLname, ClientTBL.ClientContactNo FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId WHERE (ReservationTBL.ReservationDate = @ReservationDate) AND (ReservationTBL.VenueId = @VenueId) AND (ReservationTBL.ReservationId &lt;&gt; @ReservationId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="ReservationDate" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="VenueId" 
                    PropertyName="Text" />
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ReservationFetch" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT EventTBL.ReservationFee FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID WHERE (ReservationTBL.ReservationId = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="deduct" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM [ReservationTBL] WHERE [ReservationId] = @ReservationId" 
            InsertCommand="INSERT INTO [ReservationTBL] ([EventReservedAmount], [grandtotal]) VALUES (@EventReservedAmount, @grandtotal)" 
            SelectCommand="SELECT [ReservationId], [EventReservedAmount], [grandtotal] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)" 
            UpdateCommand="UPDATE [ReservationTBL] SET [EventReservedAmount] = @EventReservedAmount, [grandtotal] = @grandtotal, [tag] = @tag WHERE [ReservationId] = @ReservationId">
            <DeleteParameters>
                <asp:Parameter Name="ReservationId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EventReservedAmount" Type="Double" />
                <asp:Parameter Name="grandtotal" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="tera" PropertyName="text" Name="EventReservedAmount" Type="Double" />
                <asp:ControlParameter ControlID="tgt" PropertyName="text" Name="grandtotal" Type="Double" />
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                 <asp:Parameter DefaultValue=2 Name="Tag" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="UpdateTag" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT Tag FROM ReservationTBL WHERE (ReservationDate = @ReservationDate) AND (VenueId = @VenueId) AND (ReservationId &lt;&gt; @ReservationId)" 
            UpdateCommand="UPDATE ReservationTBL SET Tag = 0 WHERE (ReservationDate = @ReservationDate) AND (VenueId = @VenueId) AND (ReservationId &lt;&gt; @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationDate" 
                    QueryStringField="ReservationId" />
                <asp:Parameter Name="VenueId" />
                <asp:Parameter Name="ReservationId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="ReservationDate" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="VenueId" 
                    PropertyName="Text" />
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AfftectedSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            
            SelectCommand="SELECT ReservationId FROM ReservationTBL WHERE (ReservationDate = @ReservationDate) AND (VenueId = @VenueId) AND (ReservationId &lt;&gt; @ReservationId)" >
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="ReservationDate" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="VenueId" 
                    PropertyName="Text" />
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="UpdateDate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM [DateRepository] WHERE [DateRecord] = @DateRecord AND [VenueId] = @VenueId" 
            InsertCommand="INSERT INTO [DateRepository] ([ReservationId], [DateRecord], [VenueId], [Type]) VALUES (@ReservationId, @DateRecord, @VenueId, @Type)" 
            SelectCommand="SELECT * FROM [DateRepository]" 
            UpdateCommand="UPDATE [DateRepository] SET [ReservationId] = @ReservationId, [Type] = @Type WHERE [DateRecord] = @DateRecord AND [VenueId] = @VenueId">
            <DeleteParameters>
                <asp:Parameter DbType="Date" Name="DateRecord" />
                <asp:Parameter Name="VenueId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="DateRecord" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="VenueId" 
                    PropertyName="Text" />
                <asp:Parameter Name="Type" DefaultValue="res" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ReservationId" Type="Int32" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter DbType="Date" Name="DateRecord" />
                <asp:Parameter Name="VenueId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="BalanceInsert" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [BalanceTBL] ([ReservationId], [GrandTotal], [Balance]) VALUES (@ReservationId, @GrandTotal, @Balance)" 
            SelectCommand="SELECT * FROM [BalanceTBL]" >
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="tgt" PropertyName="Text" Name="GrandTotal" Type="Double" />
                <asp:ControlParameter ControlID="tera" PropertyName="Text" Name="Balance" Type="Double" />
            </InsertParameters>

        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Tag2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM [ReservationTBL] WHERE [ReservationId] = @ReservationId" 
            InsertCommand="INSERT INTO [ReservationTBL] ([Tag]) VALUES (@Tag)" 
            SelectCommand="SELECT [ReservationId], [Tag] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)" 
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
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                 <asp:Parameter DefaultValue=2 Name="Tag" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ccancel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [CancelRrf] ([ReservationId], [Rrf]) VALUES (@ReservationId, @Rrf)" >
            <InsertParameters>
                <asp:SessionParameter SessionField="rr" Name="ReservationId" Type="Int32" />
                <asp:SessionParameter SessionField="gg" Name="Rrf" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="PaymentInsert" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [PaymentTBL] ([ReservationId], [RecieptNo], [Particulars], [AmountRecieved], [RecievedBy], [VenueId], [DatePaid], [TimePaid]) VALUES (@ReservationId, @RecieptNo, @Particulars, @AmountRecieved, @RecievedBy, @VenueId, @DatePaid, @TimePaid)" 
            ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" >
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="TextBox3" PropertyName="Text" Name="RecieptNo" Type="String" />
                <asp:Parameter Name="Particulars" Type="String" DefaultValue="Reservation Fee" />
                <asp:ControlParameter ControlID="AR" PropertyName="Text" Name="AmountRecieved" Type="Double" />
                <asp:ControlParameter ControlID="Employee" PropertyName="Text" Name="RecievedBy" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="VenueId" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DT" PropertyName="Text" DbType="DateTime" Name="DatePaid" />
                <asp:ControlParameter ControlID="TTime" PropertyName="Text" DbType="Time" Name="TimePaid" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="DT" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TTime" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="AR" runat="server" Visible="False"></asp:TextBox>


                    <asp:TextBox ID="Employee" runat="server" Visible="False"></asp:TextBox>

    <asp:SqlDataSource ID="EmpIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT EmpId, UserId, EmpFName + ' ' + EmpLName AS Name, Position FROM EmployeeTBL WHERE (UserId = @UserId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Employee" Name="UserId" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>


    </div>
    <div id="footer">
    </div>
  </div>
</asp:Content>

