<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="EOS2.aspx.cs" Inherits="Admin_EOS" %>

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
        width:730px;
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
        width:232px;
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
          <div style="clear:both"></div>
    <div>
        <div class="x1">
            <fieldset>
            <legend>Amenities Used</legend>
                <div class="x2">
                    <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" 
                        AutoGenerateColumns="False" DataSourceID="Amnty" 
                        EmptyDataText="Empty List">
                        <Columns>
                            <asp:BoundField DataField="AmenityName" HeaderText="AmenityName" 
                                SortExpression="AmenityName" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                                SortExpression="Quantity" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" 
                                SortExpression="Amount" Visible="False" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </div>
        <div style="visibility: hidden">
        <div class="x1">
            <fieldset>
            <legend>Facilities Used</legend>
                <div class="x2">
                    <asp:GridView ID="GridView2" runat="server" CssClass="mGrid" 
                        EmptyDataText="Empty List" AutoGenerateColumns="False" 
                        DataSourceID="fclty">
                        <Columns>
                            <asp:BoundField DataField="FacilityName" HeaderText="FacilityName" 
                                SortExpression="FacilityName" />
                            <asp:BoundField DataField="NoofHrs" HeaderText="NoofHrs" 
                                SortExpression="NoofHrs" />
                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                SortExpression="amount" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </div>
        <div class="x1">
            <fieldset>
            <legend>Miscellaneous Used</legend>
                <div class="x2">
                    <asp:GridView ID="GridView3" runat="server" CssClass="mGrid" 
                        EmptyDataText="Empty List" AutoGenerateColumns="False" DataSourceID="misc">
                        <Columns>
                            <asp:BoundField DataField="miscName" HeaderText="miscName" 
                                SortExpression="miscName" />
                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                SortExpression="amount" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </div></div>
    </div>
    <div style="clear:both"></div>
    <div>
        <div class="x1">
            <fieldset>
            <legend>Addtional Amenities Used</legend>
                <div>
                <div>
                    <div>
                   
                        <div class="l1">Amenity:</div>
                         <div class="l2">
                         <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AmntyList" 
                                 DataTextField="AmenityName" DataValueField="AmenityId">
                        </asp:DropDownList>
                        </div>
                        <div class="l1">Quantity:</div>
                        <div class="l2"><asp:TextBox ID="TextBox2" runat="server" Width="104px"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="TextBox2_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox2">
                            </asp:FilteredTextBoxExtender>
                        </div>
                        <div class="l1">&nbsp</div>
                        <div class="l2">

                            <asp:Button ID="Button2" runat="server" Text="Add" onclick="Button2_Click" 
                                style="height: 26px" />
                        </div>
                    </div>    
                </div>
                </div>
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                            CssClass="mGrid" DataKeyNames="ReservationId,AmenityId" DataSourceID="eosamnty" 
                            EmptyDataText="Empty List" onrowdeleted="GridView4_RowDeleted">
                            <Columns>
                                <asp:BoundField DataField="AmenityName" HeaderText="AmenityName" 
                                    SortExpression="AmenityName" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                                    SortExpression="Quantity" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" 
                                    Visible="False" />
                                <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                                    ReadOnly="True" SortExpression="ReservationId" Visible="False" />
                                <asp:BoundField DataField="AmenityId" HeaderText="AmenityId" ReadOnly="True" 
                                    SortExpression="AmenityId" Visible="False" />
                                <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                <div style="text-align:right">Total: 
                    <asp:Label ID="amntytotal" runat="server" Text="Label"></asp:Label>
                </div>
            </fieldset>
        </div>
        <div style="visibility: hidden">

        <div class="x1">
            <fieldset>
            <legend>Addtional Facilities Used</legend>
                <div>
                    <div>
                        <div class="l1">Facility:</div>
                         <div class="l2">
                         <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="facList" 
                                 DataTextField="FacilityName" DataValueField="FacilityId">
                        </asp:DropDownList>
                        </div>
                        <div class="l1">No of hrs:</div>
                        <div class="l2"><asp:TextBox ID="TextBox3" runat="server" Width="104px"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="TextBox3_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox3">
                            </asp:FilteredTextBoxExtender>
                        </div>
                        <div class="l1">&nbsp</div>
                        <div class="l2">
                            <asp:Button ID="Button3" runat="server" Text="Add" onclick="Button3_Click" />
                        &nbsp;<asp:Label ID="Label11" runat="server" Text="Label" CssClass="rd"></asp:Label>
                        </div>
                    </div>
                    <asp:GridView ID="GridView5" runat="server" CssClass="mGrid" 
                        EmptyDataText="Empty List" AutoGenerateColumns="False" 
                        DataSourceID="eosfclty" DataKeyNames="ReservationId,FacilityId" 
                        onrowdeleted="GridView5_RowDeleted">
                        <Columns>
                            
                            <asp:BoundField DataField="FacilityName" HeaderText="FacilityName" 
                                SortExpression="FacilityName" />
                            <asp:BoundField DataField="NoofHrs" HeaderText="NoofHrs" 
                                SortExpression="NoofHrs" />
                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                SortExpression="amount" Visible="False" />
                            <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                                ReadOnly="True" SortExpression="ReservationId" Visible="False" />
                            <asp:BoundField DataField="FacilityId" HeaderText="FacilityId" ReadOnly="True" 
                                SortExpression="FacilityId" Visible="False" />
                            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                <div style="text-align:right">Total: 
                    <asp:Label ID="factotal" runat="server" Text="Label"></asp:Label>
                </div>
                </div>
            </fieldset>
        </div>
        <div class="x1">
            <fieldset>
            <legend>Addtional Misc Used</legend>
                <div>
                    <div>
                        <div class="l1">Misc:</div>
                         <div class="l2">
                         <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="miscSelect" 
                                 DataTextField="miscName" DataValueField="miscId" Width="119px">
                        </asp:DropDownList>
                        </div>
                        <div class="l1">&nbsp</div>
                        <div class="l2">
                            <asp:Button ID="Button4" runat="server" Text="Add" onclick="Button4_Click" />
                        </div><div class="l1"></div><div class="l2"></div>
                    </div>
                    <asp:GridView ID="GridView6" runat="server" CssClass="mGrid" 
                        EmptyDataText="Empty List" AutoGenerateColumns="False" 
                        DataSourceID="eosmisc" DataKeyNames="ReservationId,miscId" 
                        onrowdeleted="GridView6_RowDeleted">
                        <Columns>
                            <asp:BoundField DataField="miscName" HeaderText="miscName" 
                                SortExpression="miscName" />
                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                SortExpression="amount" Visible="False" />
                            <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                                ReadOnly="True" SortExpression="ReservationId" Visible="False" />
                            <asp:BoundField DataField="miscId" HeaderText="miscId" ReadOnly="True" 
                                SortExpression="miscId" Visible="False" />
                            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <div style="text-align:right">Total: 
                    <asp:Label ID="misctotal" runat="server" Text="Label"></asp:Label>
                </div>
                 </div>
                </div>
            </fieldset>
        </div>
        <div style="clear:both; text-align:center;">    
                <asp:Button ID="Button1" runat="server" Font-Size="20px" Text="Next" 
                    onclick="Button1_Click" style="text-align: left" />
    </div>
    </div>
    </fieldset>
</div>
</div>
<div>
<div style="float:left; width:300px; height:auto;">
    <asp:SqlDataSource ID="Amnty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT AmenityTBL.AmenityName, rsvamntyTBL.Quantity, rsvamntyTBL.Amount FROM rsvamntyTBL INNER JOIN AmenityTBL ON rsvamntyTBL.AmenityId = AmenityTBL.AmenityId WHERE (rsvamntyTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="fclty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT FacilityTBL.FacilityName, rsvfacTBL.NoofHrs, rsvfacTBL.amount FROM FacilityTBL INNER JOIN rsvfacTBL ON FacilityTBL.FacilityId = rsvfacTBL.FacilityId WHERE (rsvfacTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="misc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT miscTBL.miscName, rsvmiscTBL.amount FROM rsvmiscTBL INNER JOIN miscTBL ON rsvmiscTBL.miscId = miscTBL.miscId WHERE (rsvmiscTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="miscSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT miscName, miscId FROM miscTBL WHERE (miscId NOT IN (SELECT miscId FROM rsvmiscTBL WHERE (ReservationId = @ReservationId))) AND (venueId = @venueId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
            <asp:SessionParameter Name="VenueId" SessionField="vvid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AmntyList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [AmenityName], [AmenityId] FROM [AmenityTBL] WHERE ([VenueId] = @VenueId)">
        <SelectParameters>
            <asp:SessionParameter Name="VenueId" SessionField="vvid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="facList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [FacilityId], [FacilityName] FROM [FacilityTBL] WHERE ([VenueId] = @VenueId)">
        <SelectParameters>
            <asp:SessionParameter Name="VenueId" SessionField="vvid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="VidSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [VenueId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="eosamnty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM eosamnty WHERE (ReservationId = @ReservationId) AND (AmenityId = @AmenityId)" 
        SelectCommand="SELECT AmenityTBL.AmenityName, eosamnty.Quantity, eosamnty.Amount, eosamnty.ReservationId, eosamnty.AmenityId FROM eosamnty INNER JOIN AmenityTBL ON eosamnty.AmenityId = AmenityTBL.AmenityId WHERE (eosamnty.ReservationId = @ReservationId)">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" />
            <asp:Parameter Name="AmenityId" />
        </DeleteParameters>        
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="eosfclty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM eosfac WHERE (ReservationId = @ReservationId) AND (FacilityId = @FacilityId)" 
        
        SelectCommand="SELECT FacilityTBL.FacilityName, eosfac.NoofHrs, eosfac.amount, eosfac.ReservationId, eosfac.FacilityId FROM eosfac INNER JOIN FacilityTBL ON eosfac.FacilityId = FacilityTBL.FacilityId WHERE (eosfac.ReservationId = @ReservationId)">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" />
            <asp:Parameter Name="FacilityId" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="eosmisc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM eosmisc WHERE (miscId = @miscId) AND (ReservationId = @ReservationId)" 
        
        SelectCommand="SELECT miscTBL.miscName, eosmisc.amount, eosmisc.ReservationId, eosmisc.miscId FROM eosmisc INNER JOIN miscTBL ON eosmisc.miscId = miscTBL.miscId WHERE (eosmisc.ReservationId = @ReservationId)">
        <DeleteParameters>
                <asp:Parameter Name="miscId" />
                <asp:Parameter Name="ReservationId" />
            </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    <div style="float:left; width:300px">
        <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox5" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:SqlDataSource ID="PriceSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [Price] FROM [AmenityTBL] WHERE ([AmenityId] = @AmenityId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="AmenityId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="eosamntyInsert" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [eosamnty] ([ReservationId], [AmenityId], [Quantity], [Amount]) VALUES (@ReservationId, @AmenityId, @Quantity, @Amount)" >
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
                <asp:ControlParameter ControlID="DropDownList1" Name="AmenityId" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox2"  PropertyName="Text" Name="Quantity" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox4"  PropertyName="Text" Name="Amount" Type="Double" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="PriceSelect2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            
            SelectCommand="SELECT RateperHour, GroupId FROM FacilityTBL WHERE (FacilityId = @FacilityId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="FacilityId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="eosfacInsert" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [eosfac] ([ReservationId], [FacilityId], [NoofHrs], [groupId], [amount]) VALUES (@ReservationId, @FacilityId, @NoofHrs, @groupId, @amount)" >
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
                <asp:ControlParameter ControlID="DropDownList2" Name="FacilityId" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox3"  PropertyName="Text" Name="NoofHrs" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox5"  PropertyName="Text" Name="groupId" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox4"  PropertyName="Text" Name="amount" Type="Double" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT COUNT(ReservationId) AS Expr1 FROM eosfac WHERE (ReservationId = @ReservationId) AND (groupId = @groupId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
            <asp:ControlParameter ControlID="TextBox5" Name="groupId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="Price3Select" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [miscRate] FROM [miscTBL] WHERE ([miscId] = @miscId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="miscId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="eosmiscinsert" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [eosmisc] ([ReservationId], [miscId], [amount]) VALUES (@ReservationId, @miscId, @amount)" >
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
                <asp:ControlParameter ControlID="DropDownList3" Name="miscId" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox4"  PropertyName="Text" Name="amount" Type="Double" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    <div style="float:left; width:300px">
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
    </div>
    </div>
</asp:Content>

