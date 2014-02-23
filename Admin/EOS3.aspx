<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="EOS3.aspx.cs" Inherits="Admin_EOS" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    #wrapper
    {
        text-align:left;
    }
    #fleft
    {
        float:left;
        width: 200px;
    }
    #fright
    {
        float:right;
    }
    .newMain
    {
        width:720px;
        margin: auto;
    }
    .einfo
    {
        float:left;
        width:450px;
    }
    .tx
    {
        float:right;
        width:230px;
    }
    .tbcenter
    {
        text-align:center;
    }
    .x1
    {
        float:left;
        width:230px;
    }
    .x2
    {
        text-align:center;
    }
    .l1
    {
        padding-top: 5px;
        float: left;
        width: 60px;
        margin-bottom: 5px;
    }
    .l2
    {
        float:right;
        width: 140px;
        margin-bottom: 5px;
    }
    .m1
    {
        padding-top: 5px;
        float: left;
        width: 140px;
        margin-bottom: 5px;
    }
    .m2
    {
        float:right;
        width: 160px;
        margin-bottom: 5px;
    }
    fieldset
    {
        margin:2px;
    }
    .rd
    {
        color:Red;
    }
    .rd2
    {
        color: #0077dd;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
<div class="newMain">
    <fieldset>
    <legend>Operation Summary</legend>
    <div class="einfo">
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
                </div>
                <div id="fright">
                <div style="visibility: hidden">
                </t>Event Type:
                <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' /></div>
                Start Time:
                <asp:Label ID="ReservationStartTimeLabel" runat="server" 
                    Text='<%# Eval("ReservationStartTime") %>' />
                <br /><br />
                Number of Hours Used:
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
                <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                </asp:DataPager>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="EventsSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, EventTBL.EventType, ReservationTBL.grandtotal FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (ReservationTBL.ReservationId = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>

        </fieldset>
    </div>
    <div class="tx">
    <fieldset>
        
        <p style="text-align:center">Amount to be deducted in Performance Bond</p><br />
        <div style="text-align:center">
                <br />
                <asp:Label ID="Label12" runat="server" Font-Size="20px" Text="Label"></asp:Label>
                <br />
        </div>
        <br />
        
    </fieldset>
    </div>
    <div style="clear:both"></div>
        <fieldset>
    <legend>Damaged Amenity (if any)</legend>
    <p style="color:Red">Note: The Quantity Added to Damaged Amenity will be deducted to the quantity of 
            amenity in the inventory.</p>
    <div style="float:left; width:325px">
                <div class="m1"tyle="visibility: hidden">Select Amenity:</div>
                <div class="m2">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AmntyList" DataTextField="AmenityName" DataValueField="AmenityId">
                    </asp:DropDownList>                
                </div>
                <div class="m1">Quantity</div>
                <div class="m2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>
                <div class="m1"></div>
                <div class="m2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
                </div>

    </div>
    <div style="float:right; width:325px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CssClass="mGrid" DataSourceID="SqlDataSource1" 
            DataKeyNames="ReservationId,AmenityId" EmptyDataText="No Data" 
            onrowdeleted="GridView1_RowDeleted">
            <Columns>
                <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                    SortExpression="ReservationId" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="AmenityId" HeaderText="AmenityId" 
                    SortExpression="AmenityId" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="AmenityName" HeaderText="AmenityName" 
                    SortExpression="AmenityName" />
                <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
                <asp:BoundField DataField="amount" HeaderText="Amount" 
                    SortExpression="amount" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <div style="text-align: right; color: black;">Total:&nbsp<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM eosDmgAmnty WHERE (ReservationId = @ReservationId) AND (AmenityId = @AmenityId)" 
            SelectCommand="SELECT eosDmgAmnty.ReservationId, eosDmgAmnty.AmenityId, AmenityTBL.AmenityName, eosDmgAmnty.qty, eosDmgAmnty.amount FROM AmenityTBL INNER JOIN eosDmgAmnty ON AmenityTBL.AmenityId = eosDmgAmnty.AmenityId WHERE (eosDmgAmnty.ReservationId = @ReservationId)">
            <DeleteParameters>
                <asp:Parameter Name="ReservationId" />
                <asp:Parameter Name="AmenityId" />
            </DeleteParameters>    
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>
            </div>
            </fieldset>  
            <div  style="clear:both; text-align: center;">
                   <asp:Button ID="Button2" runat="server" Font-Size="20px" Text="Done" 
                    onclick="Button2_Click" />
    
                   <asp:ConfirmButtonExtender ID="Button2_ConfirmButtonExtender" runat="server" 
                       ConfirmText="Are You Sure?" Enabled="True" TargetControlID="Button2">
                   </asp:ConfirmButtonExtender>
    
            </div>
            <div style="clear:both;">
    <asp:SqlDataSource ID="AmntyList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [AmenityName], [AmenityId] FROM [AmenityTBL] WHERE ([VenueId] = @VenueId)">
        <SelectParameters>
            <asp:SessionParameter Name="VenueId" SessionField="vvid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dmgFeeSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [dmgFee] FROM [AmenityTBL] WHERE ([AmenityId] = @AmenityId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="AmenityId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
            <asp:SqlDataSource ID="dmgAmntyInsert" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                InsertCommand="INSERT INTO [eosDmgAmnty] ([ReservationId], [AmenityId], [qty], [amount]) VALUES (@ReservationId, @AmenityId, @qty, @amount)" >
                <InsertParameters>
                    <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="AmenityId" 
                    PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox1"  PropertyName="Text" Name="qty" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox2"  PropertyName="Text" Name="amount" Type="Double" />
                </InsertParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="VidSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [VenueId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="sumamnty" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT COALESCE (SUM(Amount), 0) AS SUM FROM eosamnty WHERE (ReservationId = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sumfac" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT COALESCE (SUM(Amount), 0) AS SUM FROM eosfac WHERE (ReservationId = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="summisc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT COALESCE (SUM(Amount), 0) AS SUM FROM eosmisc WHERE (ReservationId = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="ReservationId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Accum" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" 
            SelectCommand="SELECT [TimeExceededAmount] FROM [EOSDetails] WHERE ([ReservationId] = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="accumUpdate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            UpdateCommand="UPDATE [EOSDetails] SET [TotalAccumulatedAmount] = @TotalAccumulatedAmount WHERE [ReservationId] = @ReservationId">
            <UpdateParameters>
                <asp:SessionParameter Name="TotalAccumulatedAmount" Type="Double" SessionField="accum" />
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="dmgSum" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                
                SelectCommand="SELECT COALESCE (SUM(amount), 0) AS Expr1 FROM eosDmgAmnty WHERE (ReservationId = @ReservationId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ReservationId" 
                        QueryStringField="ReservationId" />
                </SelectParameters>
            </asp:SqlDataSource>

                <asp:SqlDataSource ID="amSelect" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    DeleteCommand="DELETE FROM [AmenityTBL] WHERE [AmenityId] = @AmenityId" 
                    InsertCommand="INSERT INTO [AmenityTBL] ([Quantity]) VALUES (@Quantity)" 
                    SelectCommand="SELECT [AmenityId], [Quantity] FROM [AmenityTBL] WHERE ([AmenityId] = @AmenityId)" 
                    UpdateCommand="UPDATE [AmenityTBL] SET [Quantity] = @Quantity WHERE [AmenityId] = @AmenityId">
                    <DeleteParameters>
                        <asp:Parameter Name="AmenityId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Quantity" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox5" Name="AmenityId" PropertyName="Text" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="TextBox4" PropertyName="Text" Name="Quantity" Type="Int32" />
                        <asp:ControlParameter ControlID="TextBox5" Name="AmenityId" PropertyName="Text" 
                            Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="TagUpdate" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
                    <UpdateParameters>
                        <asp:Parameter DefaultValue="7" Name="Tag" Type="Int32" />
                        <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                            Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="TagUpdate0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    
                    UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
                    <UpdateParameters>
                        <asp:Parameter DefaultValue="6" Name="Tag" Type="Int32" />
                        <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                            Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="TagUpdate1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
                    <UpdateParameters>
                        <asp:Parameter DefaultValue="8" Name="Tag" Type="Int32" />
                        <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                            Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="PerformanceBondSelect" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    SelectCommand="SELECT COALESCE (EventTBL.PerformanceBond, 0) AS PerformanceBond FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID WHERE (ReservationTBL.ReservationId = @ReservationId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ReservationId" 
                            QueryStringField="ReservationId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="TotalAccum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    SelectCommand="SELECT [TotalAccumulatedAmount] FROM [EOSDetails] WHERE ([ReservationId] = @ReservationId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="Refunded" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    InsertCommand="INSERT INTO [RefundsTBL] ([ReservationId], [RefundableAmount], [Status]) VALUES (@ReservationId, @RefundableAmount, @Status)">
                    <InsertParameters>
                        <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="amnt" PropertyName="Text" Name="RefundableAmount" Type="Double" />
                        <asp:Parameter Name="Status" Type="String" DefaultValue="onHold" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="BalanceAgain" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                    UpdateCommand="UPDATE [BalanceTBL] SET [Balance] = @Balance WHERE [ReservationId] = @ReservationId">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="amnt" PropertyName="Text" Name="Balance" Type="Double" />
                        <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                            Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />

                <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="TextBox5" runat="server" Visible="False"></asp:TextBox>

                <asp:TextBox ID="amnt" runat="server" Visible="False"></asp:TextBox>

        </div>
    
    <div style="clear:both"></div>
    <div>    
    </div>
    </fieldset>
</div>
</div>
<div>

    
    </div>
</asp:Content>

