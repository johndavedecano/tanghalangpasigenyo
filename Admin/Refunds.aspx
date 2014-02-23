<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Refunds.aspx.cs" Inherits="Admin_RFC" %>

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
         #fleft
    {
        float:left;
        width: 200px;
    }
        fieldset
        {
            border:1px solid #0088cc;
            color:Black;
        }
        legend
        {
            color:#0088cc;
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
            color:#0088cc;
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
            color: #000000;
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
        width: 100%;
    }
    .style2
    {
        width: 171px;
        color: #000000;
    }
    .style3
    {
        width: 171px;
        height: 21px;
        color: #000000;
    }
    .style4
    {
        height: 21px;
    }
    .style5
    {
        text-align: center;
        font-size: 30px;
        color: #000000;
        font-family: "Book Antiqua";
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper" style="text-align:left">
<div style="margin:auto; width:840px; height:auto;">
<br /><br />
    <div class="style5">Refunds</div><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" 
        DataSourceID="YSA" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" DataKeyNames="ReservationId">
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="Reservation Id" 
                ReadOnly="True" SortExpression="ReservationId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="Name" HeaderText="Client Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:TemplateField HeaderText="Refundable Amount" 
                SortExpression="RefundableAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("RefundableAmount") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RefundableAmount","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ReservationId" 
                DataNavigateUrlFormatString="~/Admin/Refunds.aspx?ReservationId={0}" 
                Text="Release Check" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" Visible="False" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
 
    <div></div>
    <div>
    
    <div ID="SHOWHIDE" style="width: 357px; margin:auto;" runat="server">
        <table class="style1">
            <tr>
                <td class="style3">
                    </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    Check No.</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*" style="color: #FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Bank:</td>
                <td class="style4">
                    <asp:Label ID="Label1" runat="server" Text="Label" style="color: #000000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Release Date:</td>
                <td class="style4">
                    <asp:Label ID="Label2" runat="server" Text="Label" style="color: #000000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" 
                        style="height: 26px" />
                    <asp:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" 
                        ConfirmText="Are you sure?" Enabled="True" TargetControlID="Button1">
                    </asp:ConfirmButtonExtender>
&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Cancel" 
                        onclick="Button2_Click1" CausesValidation="False" />
                </td>
            </tr>
        </table>
        <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>

                    <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="Employee" runat="server" Visible="False"></asp:TextBox>

    </div>
    
    </div>

<div class="eventinfo">
<div style="visibility: hidden">
   <div class="notif">Ynares Center</div>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" 
        DataSourceID="YC" AllowPaging="True" PageSize="8" 
        EmptyDataText="No Request" DataKeyNames="ReservationId" >
        <Columns>
            <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                ReadOnly="True" SortExpression="ReservationId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="NameofEvent" 
                SortExpression="NameofEvent" />
            <asp:BoundField DataField="VenueName" HeaderText="VenueName" 
                SortExpression="VenueName" />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:TemplateField HeaderText="RefundableAmount" 
                SortExpression="RefundableAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("RefundableAmount") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RefundableAmount","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ReservationId" 
                DataNavigateUrlFormatString="~/Admin/Refunds.aspx?ReservationId={0}" 
                Text="Release Check" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView></div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="YSA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>"  
        SelectCommand="SELECT RefundsTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, RefundsTBL.RefundableAmount FROM RefundsTBL INNER JOIN ReservationTBL ON RefundsTBL.ReservationId = ReservationTBL.ReservationId INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId WHERE (RefundsTBL.Status = 'onHold') AND (ReservationTBL.VenueId = 1)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        ProviderName="<%$ ConnectionStrings:ybaros_db_cs.ProviderName %>" 
        UpdateCommand="UPDATE [RefundsTBL] SET [CheckNo] = @CheckNo, [Bank] = @Bank, [ReleasedDate] = @ReleasedDate, [ReleasedTime] = @ReleasedTime, [ReleasedBy] = @ReleasedBy, [Status] = @Status WHERE [ReservationId] = @ReservationId">
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="CheckNo" Type="Int32" />
            <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Bank" Type="String" />
            <asp:ControlParameter ControlID="Label2" PropertyName="Text" DbType="Date" Name="ReleasedDate" />
            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" DbType="Time" Name="ReleasedTime" />
            <asp:ControlParameter ControlID="Employee" PropertyName="Text" Name="ReleasedBy" Type="String" />
            <asp:Parameter Name="Status" Type="String" DefaultValue="Released" />
            <asp:QueryStringParameter Name="ReservationId" 
                        QueryStringField="ReservationId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="YC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT RefundsTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, RefundsTBL.RefundableAmount FROM RefundsTBL INNER JOIN ReservationTBL ON RefundsTBL.ReservationId = ReservationTBL.ReservationId INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId WHERE (RefundsTBL.Status = 'onHold') AND (ReservationTBL.VenueId = 2)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="EmpIdSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT EmpId, UserId, EmpFName + ' ' + EmpLName AS Name, Position FROM EmployeeTBL WHERE (UserId = @UserId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Employee" Name="UserId" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="TagUpdate0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
        <UpdateParameters>
            <asp:Parameter Name="Tag" Type="Int32" DefaultValue="8" />
            <asp:QueryStringParameter Name="ReservationId" 
                        QueryStringField="ReservationId" />
        </UpdateParameters>
    </asp:SqlDataSource>


    </div>
</div>
    </asp:Content>

