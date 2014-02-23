<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="ConfirmSEvent.aspx.cs" Inherits="ConfirmEvent" %>

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
        {float:right;}       
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div id="wrapper">
    <div id="maincontent" style="height: auto;">
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
            Reservation ID:
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
            <br /><br />Total:
            <asp:Label ID="grandtotalLabel" runat="server" 
                Text='<%# Eval("grandtotal", "{0:n2}") %>' />
            </div>
<br /></span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style=""><asp:DataPager ID="DataPager1" runat="server" PageSize="1"></asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>

</fieldset>
<fieldset>
<legend>Confirm Reservation</legend>
<div style="text-align:center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ReservationId" DataSourceID="SESelect" CssClass="mGrid" 
        EmptyDataText="Empty List">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Id" 
                ReadOnly="True" SortExpression="ReservationId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
            <asp:TemplateField HeaderText="Event Date" SortExpression="EventDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("EventDate", "{0:MMMM dd, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# ConvertTime((TimeSpan)Eval("StartTime"))%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Time" SortExpression="EndTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EndTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# ConvertTime((TimeSpan)Eval("EndTime"))%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="VenueId" HeaderText="Venue Id" 
                SortExpression="VenueId" Visible="False" />
        </Columns>
    </asp:GridView>
</div>
    <asp:SqlDataSource ID="SESelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT SERepository.ReservationId, ReservationTBL.NameofEvent, SERepository.EventDate, SERepository.StartTime, SERepository.EndTime, SERepository.VenueId FROM SERepository INNER JOIN ReservationTBL ON SERepository.ReservationId = ReservationTBL.ReservationId WHERE (SERepository.EventDate = @EventDate) AND (SERepository.VenueId = @VenueId) AND (SERepository.ReservationId &lt;&gt; @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="EventDate" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="VenueId" PropertyName="Text" 
                Type="Int32" />
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="text-align:center">
        <asp:Button ID="Button2" runat="server" Text="Confirm" 
            onclick="Button2_Click" style="height: 26px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Cancel" onclick="Button1_Click" />
    </div>
    <br />

</fieldset> </div>
    <div id="sidebar" style="height: auto;">
        <asp:SqlDataSource ID="EventSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [NameofEvent] FROM [ReservationTBL] WHERE ([ReservationDate] = @ReservationDate) and ([VenueId] = @VenueId) and ([ReservationId] != @ReservationId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="ReservationDate" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="VenueId" 
                    PropertyName="Text" />
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
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
            UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
            <UpdateParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                 <asp:Parameter DefaultValue=2 Name="Tag" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Tag0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
            <UpdateParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                 <asp:Parameter DefaultValue=0 Name="Tag" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="EventDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [ReservationDate], [ReservationStartTime], [ReservationEndTime] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SEInsert" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            InsertCommand="INSERT INTO [SERepository] ([ReservationId], [EventDate], [StartTime], [EndTime], [VenueId]) VALUES (@ReservationId, @EventDate, @StartTime, @EndTime, @VenueId)" >
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="ReservationId" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="rdate" PropertyName="Text" DbType="Date" Name="EventDate" />
                <asp:ControlParameter ControlID="stime" PropertyName="Text" DbType="Time" Name="StartTime" />
                <asp:ControlParameter ControlID="etime" PropertyName="Text" DbType="Time" Name="EndTime" />
                <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="VenueId" Type="Int32" />
            </InsertParameters>

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
        <asp:TextBox ID="rdate" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="stime" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="etime" runat="server"></asp:TextBox>
        <br />

        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

        <br />

        <asp:TextBox ID="TextBox5" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="tera" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="tgt" runat="server" Visible="False"></asp:TextBox>


        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>


        <br />

    </div>
    <div id="footer">
    </div>
  </div>
</asp:Content>

