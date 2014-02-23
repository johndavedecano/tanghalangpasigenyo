<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientAccount.aspx.cs" Inherits="client_ClientAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .newStyle1
        {
            position: static;
            height: 80px;
            width: 250px;
            margin: auto;
        }
        .style1
        {
            text-align: center;   
        }
        #sidebar
        {
        width:250px;
            color: #FF3300;
        }
        #maincontent
        {
        width: 650px;   
        height:auto; 
        }
        .hdn
        {
            font-family: Bookman Old Style;
            font-size: 16px;
            color: #FF3300;
            text-align: center;
        }
        .style2
        {
            color: #000000;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
 
<div id="maincontent">
    <span class="style2">Pay <strong>Tanghalang Pasigueño Administration Office</strong> for the Reservation Fee and 
                Balance of Rental Amount in not later than seven (7) calendar days before the 
                actual date of the use of the Tanghalang Pasigueño.</span><fieldset>
    <legend>Notifications</legend>
        <asp:Label ID="UpdateLabel" runat="server" style="color: black"></asp:Label>
    </fieldset>
    <br />
    <div class="style1">
    <asp:ImageButton ID="ImageButton1" CssClass="newStyle1" runat="server" 
        ImageUrl="~/Resources/reserve.jpg" onclick="ImageButton1_Click" />
    </div>
    <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox><asp:TextBox ID="TextBox2"
        runat="server" Visible="false"></asp:TextBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [Status] FROM [ClientTbl] WHERE ([UserId] = @UserId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="UserId" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [ClientId] FROM [ClientTbl] WHERE ([UserId] = @UserId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="UserId" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <br />
    <div class="hdn">Tentative Reservation</div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource2" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation Number" InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
            <asp:BoundField DataField="Expr2" HeaderText="Facility Name" 
                SortExpression="Expr2" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" Visible="False" />
            <asp:TemplateField HeaderText="Date" SortExpression="Expr5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Expr5") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Expr5","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Expr6" HeaderText="Time" SortExpression="Expr6" />
            <asp:BoundField DataField="Expr7" HeaderText="Number of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Total Amount" SortExpression="Expr13">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Expr13") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Expr13","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Type of Event" 
                SortExpression="EventName" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="Expr1" 
                DataNavigateUrlFormatString="~/Client/Check.aspx?ReservationId={0}" 
                Text="View" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT ReservationTBL.ReservationId AS Expr1, EventTBL.EventName AS Expr2, ReservationTBL.NameofEvent AS Expr4, ReservationTBL.ReservationDate AS Expr5, ReservationTBL.ReservationStartTime AS Expr6, ReservationTBL.NumberofHours AS Expr7, ReservationTBL.grandtotal AS Expr13, EventTBL.EventName, VenueTBL.VenueName FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (EventTBL.EventType = 'Big Event') AND (ReservationTBL.ClientId = @ClientId) AND (ReservationTBL.Tag = 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

    <div class="hdn">Confirmed Reservation</div>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource5" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation Number" InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />

            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
                 <asp:BoundField DataField="Expr2" HeaderText="Facility Name" 
                SortExpression="Expr2" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" Visible="False" />
            <asp:TemplateField HeaderText="Date" SortExpression="Expr5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Expr5") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" 
                        Text='<%# Bind("Expr5","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Expr6" HeaderText="Time" SortExpression="Expr6" />
            <asp:BoundField DataField="Expr7" HeaderText="Number of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Balance Amount " SortExpression="Expr13">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Expr13") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Expr13","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Type of Event" 
                SortExpression="EventName" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="Expr1" 
                DataNavigateUrlFormatString="~/Client/Check.aspx?ReservationId={0}" 
                Text="View" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT ReservationTBL.ReservationId AS Expr1, EventTBL.EventName AS Expr2, ReservationTBL.NameofEvent AS Expr4, ReservationTBL.ReservationDate AS Expr5, ReservationTBL.ReservationStartTime AS Expr6, ReservationTBL.NumberofHours AS Expr7, ReservationTBL.grandtotal AS Expr13, EventTBL.EventName, VenueTBL.VenueName FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (EventTBL.EventType = 'Big Event') and (ReservationTBL.ClientId = @ClientId) and (ReservationTBL.tag > 1) and (ReservationTBL.tag < 8)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <div class="hdn">Cancelled Reservation</div>
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ReservationId" DataSourceID="SqlDataSource7" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Number" InsertVisible="False" 
                ReadOnly="True" SortExpression="ReservationId" />
              
            <asp:BoundField DataField="NameofEvent" HeaderText="Event Name " 
                SortExpression="NameofEvent" />
                   <asp:BoundField DataField="Expr2" HeaderText="Facility Name" 
                SortExpression="Expr2" />
            <asp:TemplateField HeaderText="Date" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReservationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ReservationStartTime" 
                HeaderText="Start Time" SortExpression="ReservationStartTime" 
                Visible="False" />
            <asp:BoundField DataField="NumberofHours" HeaderText="Number of Hours" 
                SortExpression="NumberofHours" />
            <asp:TemplateField HeaderText="Total Amount " SortExpression="grandtotal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("grandtotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("grandtotal","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Event Type" 
                SortExpression="EventName" Visible="False" />
            <asp:BoundField DataField="VenueName" HeaderText="Venue" 
                SortExpression="VenueName" Visible="False" />
            <asp:BoundField DataField="Rrf" HeaderText="Reason" SortExpression="Rrf" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, EventTBL.EventName AS Expr2, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, ReservationTBL.grandtotal, EventTBL.EventName, VenueTBL.VenueName, CancelRrf.Rrf FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId INNER JOIN CancelRrf ON ReservationTBL.ReservationId = CancelRrf.ReservationId WHERE (ReservationTBL.ClientId = @ClientId) AND (ReservationTBL.Tag = 0)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
        <div class="hdn" style="visibility: hidden">Finished Event</div>
    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource8" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display" 
        Visible="False">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation Number" InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
            <asp:TemplateField HeaderText="Date" SortExpression="Expr5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Expr5") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Expr5","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Expr6" HeaderText="Time" SortExpression="Expr6" />
            <asp:BoundField DataField="Expr7" HeaderText="Number of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Total Amount Due" SortExpression="Expr13">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Expr13") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Expr13","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Event Type" 
                SortExpression="EventName" Visible="False" />
            <asp:BoundField DataField="VenueName" HeaderText="Venue" 
                SortExpression="VenueName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        
        SelectCommand="SELECT ReservationTBL.ReservationId AS Expr1, ReservationTBL.NameofEvent AS Expr4, ReservationTBL.ReservationDate AS Expr5, ReservationTBL.ReservationStartTime AS Expr6, ReservationTBL.NumberofHours AS Expr7, ReservationTBL.grandtotal AS Expr13, EventTBL.EventName, VenueTBL.VenueName FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (ReservationTBL.ClientId = @ClientId) and (ReservationTBL.Tag = 8)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="visibility: hidden">
        <div class="hdn">Confirmed (Transportation Rental)</div>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource6" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation No" InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" />
            <asp:TemplateField HeaderText="Date" SortExpression="Expr5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Expr5") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" 
                        Text='<%# Bind("Expr5","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Expr6" HeaderText="Time" SortExpression="Expr6" />
            <asp:BoundField DataField="Expr7" HeaderText="No of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Total Amount Due" SortExpression="Expr13">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Expr13") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Expr13","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Type of Event" 
                SortExpression="EventName" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="Expr1" 
                DataNavigateUrlFormatString="~/Client/Check.aspx?ReservationId={0}" 
                Text="View" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT ReservationTBL.ReservationId AS Expr1, ReservationTBL.NameofEvent AS Expr4, ReservationTBL.ReservationDate AS Expr5, ReservationTBL.ReservationStartTime AS Expr6, ReservationTBL.NumberofHours AS Expr7, ReservationTBL.grandtotal AS Expr13, EventTBL.EventName, VenueTBL.VenueName FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (EventTBL.EventType = 'Small Event') and (ReservationTBL.ClientId = @ClientId) and (ReservationTBL.tag > 1) and (ReservationTBL.tag < 8)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        <div class="hdn">Tentative (Transportation Rental)</div>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource4" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation No" InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" />
            <asp:TemplateField HeaderText="Date" SortExpression="Expr5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Expr5") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Expr5","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Expr6" HeaderText="Time" SortExpression="Expr6" />
            <asp:BoundField DataField="Expr7" HeaderText="No of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Total Amount Due" SortExpression="Expr13">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Expr13") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Expr13","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Type of Event" 
                SortExpression="EventName" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="Expr1" 
                DataNavigateUrlFormatString="~/Client/Check.aspx?ReservationId={0}" 
                Text="View" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT ReservationTBL.ReservationId AS Expr1, ReservationTBL.NameofEvent AS Expr4, ReservationTBL.ReservationDate AS Expr5, ReservationTBL.ReservationStartTime AS Expr6, ReservationTBL.NumberofHours AS Expr7, ReservationTBL.grandtotal AS Expr13, EventTBL.EventName, VenueTBL.VenueName FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (EventTBL.EventType = 'Small Event') and (ReservationTBL.ClientId = @ClientId) and (ReservationTBL.tag = 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </div>

<div id="sidebar">  
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Client Information</asp:LinkButton>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink3" runat="server" 
        NavigateUrl="~/Account/ChangePassword.aspx">Change Password</asp:HyperLink>
    <br />
    <br />
        <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/place/Step1.aspx" Visible="False">Reserve your Event</asp:HyperLink>
    <br />
    <span style="color: #FF3300">Your Active Reservations</span>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ReservationId" 
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
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
 
</div>
</asp:Content>

