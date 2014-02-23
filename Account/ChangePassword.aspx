<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="Account_ChangePassword" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style3
        {
            font-size: xx-large;
            font-family: "Matura MT Script Capitals";
            font-weight: 700;
            text-align: center;
            color: #FF3300;
        }
        .style4
        {
            font-size: x-large;
            font-family: "Book Antiqua";
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="wrapper">
 
<div id="maincontent">
<br />
    <span class="style4">Change Password
    </span>
    <p>
        Use the form below to change your password.
    </p>
    <p>
        New passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
    </p>
    <asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/" EnableViewState="false" RenderOuterTable="false" 
         SuccessPageUrl="ChangePasswordSuccess.aspx">
        <ChangePasswordTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="ChangeUserPasswordValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="changePassword">
                    <legend>Account Information</legend>
                    <p>
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                        <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                        <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                             CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                        <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                             ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" 
                         ValidationGroup="ChangeUserPasswordValidationGroup"/>
                </p>
            </div>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
    <div style="visibility: hidden">
    <fieldset>
    <legend>Notifications</legend>
        <asp:Label ID="UpdateLabel" runat="server" style="color: red"></asp:Label>
    </fieldset>
    <br />
    <div class="style1" style="visibility: hidden">
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
    <div class="hdn">Tentative </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource2" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation No." InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
            <asp:BoundField DataField="VenueName" HeaderText="Service Name" 
                SortExpression="VenueName" />
            <asp:TemplateField HeaderText="Date" SortExpression="Expr5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Expr5") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Expr5","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Expr6" HeaderText="Time" SortExpression="Expr6" />
            <asp:BoundField DataField="Expr7" HeaderText="No. of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Total Amount Due" SortExpression="Expr13">
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
        SelectCommand="SELECT ReservationTBL.ReservationId AS Expr1, ReservationTBL.NameofEvent AS Expr4, ReservationTBL.ReservationDate AS Expr5, ReservationTBL.ReservationStartTime AS Expr6, ReservationTBL.NumberofHours AS Expr7, ReservationTBL.grandtotal AS Expr13, EventTBL.EventName, VenueTBL.VenueName FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (EventTBL.EventType = 'Big Event') and (ReservationTBL.ClientId = @ClientId) and (ReservationTBL.tag = 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <br />
    <div class="hdn">Confirmed </div>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource5" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation No." InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
            <asp:BoundField DataField="VenueName" HeaderText="Service Name" 
                SortExpression="VenueName" />
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
            <asp:BoundField DataField="Expr7" HeaderText="No. of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Total Amount Due" SortExpression="Expr13">
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
        
        SelectCommand="SELECT ReservationTBL.ReservationId AS Expr1, ReservationTBL.NameofEvent AS Expr4, ReservationTBL.ReservationDate AS Expr5, ReservationTBL.ReservationStartTime AS Expr6, ReservationTBL.NumberofHours AS Expr7, ReservationTBL.grandtotal AS Expr13, EventTBL.EventName, VenueTBL.VenueName FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId WHERE (EventTBL.EventType = 'Big Event') and (ReservationTBL.ClientId = @ClientId) and (ReservationTBL.tag > 1) and (ReservationTBL.tag < 8)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div class="hdn">Cancelled Event</div>
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ReservationId" DataSourceID="SqlDataSource7" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation No." InsertVisible="False" 
                ReadOnly="True" SortExpression="ReservationId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
                   <asp:BoundField DataField="VenueName" HeaderText="Service Name" 
                SortExpression="VenueName" />
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
            <asp:BoundField DataField="NumberofHours" HeaderText="No. of Hours" 
                SortExpression="NumberofHours" />
            <asp:TemplateField HeaderText="Grand Total" SortExpression="grandtotal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("grandtotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("grandtotal","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Event Type" 
                SortExpression="EventName" Visible="False" />
            <asp:BoundField DataField="Rrf" HeaderText="Reason" SortExpression="Rrf" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, ReservationTBL.grandtotal, EventTBL.EventName, VenueTBL.VenueName, CancelRrf.Rrf FROM ReservationTBL INNER JOIN EventTBL ON ReservationTBL.EventId = EventTBL.EventID INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId AND EventTBL.VenueID = VenueTBL.VenueId INNER JOIN CancelRrf ON ReservationTBL.ReservationId = CancelRrf.ReservationId WHERE (ReservationTBL.ClientId = @ClientId) AND (ReservationTBL.Tag = 0)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="ClientId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
        <div class="hdn">Finished Event</div>
    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Expr1" DataSourceID="SqlDataSource8" CssClass="mGrid" 
        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Data to Display">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Expr1" HeaderText="Reservation No." InsertVisible="False" 
                ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="Expr4" HeaderText="Event Name" 
                SortExpression="Expr4" />
                <asp:BoundField DataField="VenueName" HeaderText="Service Name" 
                SortExpression="VenueName" />
            <asp:TemplateField HeaderText="Date" SortExpression="Expr5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Expr5") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Expr5","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Expr6" HeaderText="Time" SortExpression="Expr6" />
            <asp:BoundField DataField="Expr7" HeaderText="No. of Hours" 
                SortExpression="Expr7" />
            <asp:TemplateField HeaderText="Grand Total" SortExpression="Expr13">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Expr13") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Expr13","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EventName" HeaderText="Event Type" 
                SortExpression="EventName" visible ="false"/>
            
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

    
    <div class="hdn">Confirmed (Transportation Rental)</div>
    <br />
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
      </div>
      </div>
         </div>

<div id="sidebar">  
<br> 
<marquee  behavior="scroll" direction="up" speed="2" class="style3">
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
Pasig's New Seat of Culture<br /> 
and<br /> 
the Arts<br /> 
is also the stunning background of your event. <br /> 
<br /></marquee><br />
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /></div>

</asp:Content>