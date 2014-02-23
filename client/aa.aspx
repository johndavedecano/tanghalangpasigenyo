<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="aa.aspx.cs" Inherits="Additionals" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 313px;
        }
        .style2
        {
            width: 154px;
            text-align: right;
           
        }
        .style111
        {
            width: 154px;
            text-align: right;
            font-size: large;
           
        }
        .mydiv
        {
         width: 322px;
         
         }
         #one
         {
             width: 100%;
       
             
         }
         #sidebox
         {
             width: 350px;
             float: left;
          
             }
         #mainbox
         {
               width: 550px;
             float: right;   
      
       
             }
             
        .style112
        {
            width: 145px;
        }
             
        .style113
        {
            width: 144px;
        }
        .style114
        {
            width: 144px;
            height: 26px;
        }
        .style115
        {
            height: 26px;
        }
        .imgss
        {
            position:static;
            padding: 0px;
            margin
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
             
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="one">
<div id="sidebox">
    <asp:TextBox ID="TextBox4" runat="server" AutoPostBack="True" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox5" runat="server" Visible="False" ></asp:TextBox>
    <asp:TextBox ID="TextBox8" runat="server" Visible="False" ></asp:TextBox>
<fieldset>
<legend>Reservation Info</legend>

    <div class="mydiv">
    <table class="style1">
        <tr>
            <td class="style2">
                Name of Event:</td>
            <td>
                &nbsp;
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Venue:</td>
            <td>
                &nbsp;
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Date:</td>
            <td>
                &nbsp;
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Venue Rental:</td>
            <td align="right">
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Operational Expense:</td>
            <td align="right">
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="right">
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style111">
                Total:</td>
            <td align="right" style="font-size: large;">
                <asp:Label ID="Label8" runat="server" Text="Label"  ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Reservation Fee:</td>
            <td align="right">
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    </div>


</fieldset>

<fieldset>
<legend>Facilities Reservation Info</legend>
    <table class="mydiv">
        <tr>
            <td class="style112">
                Facility Name:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style112">
                Rate per Hour:</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style112">
                No. of Hours:</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="TextBox3_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox3">
                </asp:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style112">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" 
                    CausesValidation="False" />
&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Clear" onclick="Button2_Click" 
                    CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td class="style112">
                &nbsp;</td>
            <td style="color:Red">
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ErrorMessage="Please Input Valid Entry" MaximumValue="99" MinimumValue="1" 
                    ControlToValidate="TextBox3"></asp:RangeValidator>
            </td>
        </tr>
    </table>
</fieldset>

    
    <fieldset>
    <legend>List of Facilities Added</legend>

    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ReservationId,FacilityId" DataSourceID="FacilitiesSelect" 
            onrowdeleted="GridView1_RowDeleted" Width="316px" CssClass="mGrid">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                    ReadOnly="True" SortExpression="ReservationId" Visible="False" />
                <asp:BoundField DataField="FacilityId" HeaderText="FacilityId" ReadOnly="True" 
                    SortExpression="FacilityId" Visible="False" />
                <asp:BoundField DataField="FacilityName" HeaderText="FacilityName" 
                    SortExpression="FacilityName" />
                <asp:TemplateField HeaderText="Amount" SortExpression="amount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("amount","{0:n2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="groupId" HeaderText="groupId" 
                    SortExpression="groupId" Visible="False" />
                <asp:CommandField DeleteText="Cancel" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    <asp:SqlDataSource ID="FacilitiesSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM rsvfacTBL WHERE (ReservationId = @ReservationId) AND (FacilityId = @FacilityId)" 
            SelectCommand="SELECT rsvfacTBL.ReservationId, rsvfacTBL.FacilityId, FacilityTBL.FacilityName, rsvfacTBL.amount, rsvfacTBL.groupId FROM rsvfacTBL INNER JOIN FacilityTBL ON rsvfacTBL.FacilityId = FacilityTBL.FacilityId WHERE (rsvfacTBL.ReservationId = @ReservationId)">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" />
            <asp:Parameter Name="FacilityId" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="font-size:large; text-align:right">
    Total Facility Cost: 
        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
    </div>
    </fieldset>
    <fieldset>
    <legend>Amenity Reservation Info</legend>
        <table class="mydiv">
            <tr>
                <td class="style113">
                    Amenity Name:</td>
                <td>
                    <asp:TextBox ID="a1" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style114">
                    Description:</td>
                <td class="style115">
                    <asp:TextBox ID="a2" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style113">
                    Price (per piece):</td>
                <td>
                    <asp:TextBox ID="a3" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style113">
                    Quanity:</td>
                <td>
                    <asp:TextBox ID="a4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="a4" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btn1" runat="server" Text="Submit" onclick="btn1_Click" 
                        CausesValidation="False" />
&nbsp;&nbsp;
                    <asp:Button ID="btn2" runat="server" Text="Clear" />
                </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td style="color:Red">
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="a4" ErrorMessage="Input Integer" 
                        ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                    
                </td>
            </tr>
        </table>

    </fieldset>
    <fieldset>
    <legend>List of Amenities Added</legend>

        <asp:SqlDataSource ID="rsvamntySelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM rsvamntyTBL WHERE (ReservationId = @ReservationId) AND (AmenityId = @AmenityId)" 
            SelectCommand="SELECT rsvamntyTBL.ReservationId, rsvamntyTBL.AmenityId, AmenityTBL.AmenityName, rsvamntyTBL.Amount, AmenityTBL.Description FROM AmenityTBL INNER JOIN rsvamntyTBL ON AmenityTBL.AmenityId = rsvamntyTBL.AmenityId WHERE (rsvamntyTBL.ReservationId = @ReservationId)">
            <DeleteParameters>
                <asp:Parameter Name="ReservationId" />
                <asp:Parameter Name="AmenityId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ReservationId,AmenityId" DataSourceID="rsvamntySelect" 
            Width="326px" onrowdeleted="GridView2_RowDeleted" CssClass="mGrid">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                    ReadOnly="True" SortExpression="ReservationId" Visible="False" />
                <asp:BoundField DataField="AmenityId" HeaderText="AmenityId" ReadOnly="True" 
                    SortExpression="AmenityId" Visible="False" />
                <asp:BoundField DataField="AmenityName" HeaderText="AmenityName" 
                    SortExpression="AmenityName" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Amount","{0:n2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField DeleteText="Cancel" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
                   <br />
                    <div style="font-size:large; text-align:right">
    Total Amenity Cost: 
        <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
    </div>
    </fieldset>
    <fieldset>
    <legend>List of Miscellaneous Added</legend>

        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ReservationId,miscId" DataSourceID="rsvmiscSelect" 
            Width="312px" onrowdeleted="GridView3_RowDeleted" CssClass="mGrid">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="ReservationId" HeaderText="ReservationId" 
                    ReadOnly="True" SortExpression="ReservationId" Visible="False" />
                <asp:BoundField DataField="miscId" HeaderText="miscId" ReadOnly="True" 
                    SortExpression="miscId" Visible="False" />
                <asp:BoundField DataField="miscName" HeaderText="Miscellaneuos Name" 
                    SortExpression="miscName" />
                <asp:TemplateField HeaderText="Amount" SortExpression="amount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("amount","{0:n2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField DeleteText="Cancel" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
                            <div style="font-size:large; text-align:right">
    Total Miscellaneous Cost: 
        <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
    </div>
        <asp:SqlDataSource ID="rsvmiscSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM rsvmiscTBL WHERE (miscId = @miscId) AND (ReservationId = @ReservationId)" 
            SelectCommand="SELECT rsvmiscTBL.ReservationId, rsvmiscTBL.miscId, miscTBL.miscName, rsvmiscTBL.amount FROM miscTBL INNER JOIN rsvmiscTBL ON miscTBL.miscId = rsvmiscTBL.miscId WHERE (rsvmiscTBL.ReservationId = @ReservationId)">
            <DeleteParameters>
                <asp:Parameter Name="miscId" />
                <asp:Parameter Name="ReservationId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

    </fieldset>
    <br />
    <asp:TextBox ID="TextBox9" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox10" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox7" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="amntyid" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="amntyamount" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="miscid" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="miscamount" runat="server" Visible="False"></asp:TextBox>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ReservationTBL.ReservationId, ReservationTBL.NameofEvent, VenueTBL.VenueName, EventTBL.OperationalExpense, ReservationTBL.EventReservedAmount, EventTBL.PerformanceBond, ReservationTBL.ReservationDate, EventTBL.ReservationFee, VenueTBL.VenueId FROM EventTBL INNER JOIN ReservationTBL ON EventTBL.EventID = ReservationTBL.EventId INNER JOIN VenueTBL ON EventTBL.VenueID = VenueTBL.VenueId WHERE (ReservationTBL.ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="newId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT SUM(amount) AS sums FROM rsvfacTBL GROUP BY ReservationId HAVING (ReservationId = @reservationid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="reservationid" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [FacilityId], [FacilityName], [RateperHour], [GroupId] FROM [FacilityTBL] WHERE ([FacilityId] = @FacilityId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox5" Name="FacilityId" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [rsvfacTBL] WHERE [ReservationId] = @ReservationId AND [FacilityId] = @FacilityId" 
        InsertCommand="INSERT INTO [rsvfacTBL] ([ReservationId], [FacilityId], [NoofHrs], [groupId], [amount]) VALUES (@ReservationId, @FacilityId, @NoofHrs, @groupId, @amount)" 
        SelectCommand="SELECT * FROM [rsvfacTBL]" 
        UpdateCommand="UPDATE [rsvfacTBL] SET [groupId] = @groupId, [amount] = @amount WHERE [ReservationId] = @ReservationId AND [FacilityId] = @FacilityId">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" Type="Int32" />
            <asp:Parameter Name="FacilityId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:QueryStringParameter Name="ReservationId" 
                QueryStringField="newId" />
            <asp:ControlParameter ControlId="Textbox5" PropertyName="Text" Name="FacilityId" Type="Int32" />
            <asp:ControlParameter ControlId="Textbox4" PropertyName="Text" Name="NoofHrs" Type="Int32" />
            <asp:ControlParameter ControlId="Textbox6" PropertyName="Text" Name="groupId" Type="Int32" />
            <asp:ControlParameter ControlId="Textbox7" PropertyName="Text" Name="amount" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="groupId" Type="Int32" />
            <asp:Parameter Name="amount" Type="Double" />
            <asp:Parameter Name="ReservationId" Type="Int32" />
            <asp:Parameter Name="FacilityId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT COUNT(ReservationId) AS Expr1 FROM rsvfacTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT COUNT(ReservationId) AS Expr1 FROM rsvfacTBL WHERE (ReservationId = @ReservationId) AND (groupId = @groupId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox6" Name="groupId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AmenitySelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [AmenityId], [AmenityName], [Description], [Price], [Quantity] FROM [AmenityTBL] WHERE ([AmenityId] = @AmenityId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="amntyid" Name="AmenityId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="rsvamntyTBL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        InsertCommand="INSERT INTO [rsvamntyTBL] ([ReservationId], [AmenityId], [Quantity], [Amount]) VALUES (@ReservationId, @AmenityId, @Quantity, @Amount)" 
        SelectCommand="SELECT [ReservationId], [AmenityId], [Amount] FROM [rsvamntyTBL]" >
    <InsertParameters>
             <asp:QueryStringParameter Name="ReservationId" QueryStringField="newId" />
            <asp:ControlParameter ControlId="amntyid" PropertyName="Text" Name="AmenityId" Type="Int32" />
            <asp:ControlParameter ControlId="a4" PropertyName="Text" Name="Quantity" Type="Int32" />
            <asp:ControlParameter ControlId="amntyamount" PropertyName="Text" Name="Amount" Type="Double" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="rsvamntyCount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT COUNT(ReservationId) AS Expr1 FROM rsvamntyTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="rsvamntySum" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT SUM(Amount) AS Expr1 FROM rsvamntyTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="rsvmiscCount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT COUNT(ReservationId) AS Expr1 FROM rsvmiscTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="rsvmiscSum" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT SUM(amount) AS Expr1 FROM rsvmiscTBL WHERE (ReservationId = @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>




    <asp:SqlDataSource ID="rsvupdatetotal" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [ReservationTBL] WHERE [ReservationId] = @ReservationId" 
        InsertCommand="INSERT INTO [ReservationTBL] ([grandtotal]) VALUES (@grandtotal)" 
        SelectCommand="SELECT [ReservationId], [grandtotal] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)" 
        UpdateCommand="UPDATE [ReservationTBL] SET [grandtotal] = @grandtotal WHERE [ReservationId] = @ReservationId">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="grandtotal" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox8" Name="ReservationId" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlId="Label14" PropertyName="Text" Name="grandtotal" Type="Double" />
            <asp:ControlParameter ControlId="Textbox8" PropertyName="Text" Name="ReservationId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>




</div>
<div id="mainbox">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <fieldset>
    <legend>Facilities Available</legend>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="FacilityId" 
        DataSourceID="SqlDataSource2" GroupItemCount="3" 
            onitemcommand="ListView1_ItemCommand" >
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server" style="width:200px">
                <br />
                <br />
                [picture here]
                <br />
                <br />
                <asp:Label ID="FacilityNameLabel" runat="server" 
                    Text='<%# Eval("FacilityName") %>' />
                <br />
                <asp:Label ID="FacilityDescriptionLabel" runat="server" 
                    Text='<%# Eval("FacilityDescription") %>' />
                <br />RateperHour:
                <asp:Label ID="RateperHourLabel" runat="server" 
                    Text='<%# Eval("RateperHour","{0:n2}") %>' />
                <br />
                    <asp:LinkButton runat="server" 
                    ID="atl" 
                    Text="Add To List" 
                    CommandName="AddToList" 
                    CommandArgument='<%#Eval("facilityId") %>' CausesValidation="False"/>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server" >
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    </fieldset>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT * FROM [FacilityTBL] WHERE ([VenueId] = @VenueId) and (isDeleted = 0)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox4" Name="VenueId" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <fieldset>
    <legend>Amenities Available</legend>

        <asp:ListView ID="ListView2" runat="server" DataKeyNames="AmenityId" 
            DataSourceID="amenityView" GroupItemCount="3" 
            onitemcommand="ListView2_ItemCommand">
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" style="width:200px">
                    <br />
                    <br />
                    [picture here]
                    <br />
                    <br /><asp:Label ID="AmenityNameLabel" runat="server" 
                        Text='<%# Eval("AmenityName") %>' />
                    <br /><asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Eval("Description") %>' />
                    <br />Quantity:
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                    <br />Price (per piece):
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price","{0:n2}") %>' />
                    <br />
                    <asp:LinkButton runat="server" 
                    ID="atl2" 
                    Text="Add To List" 
                    CommandName="AddToList" 
                    CommandArgument='<%#Eval("AmenityId") %>' CausesValidation="False"/>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="amenityView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [AmenityId], [VenueId], [AmenityName], [Description], [Quantity], [Price] FROM [AmenityTBL] WHERE ([VenueId] = @VenueId) and (isDeleted = 0)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox4" Name="VenueId" PropertyName="Text" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </fieldset>
    <fieldset>
    <legend>Miscellaneous Available</legend>

        <asp:ListView ID="ListView3" runat="server" DataKeyNames="miscId" 
            DataSourceID="miscView" GroupItemCount="3" 
            onitemcommand="ListView3_ItemCommand">
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" style="width: 200px">
                    <br />
                    <br />
                    [picture here]
                    <br /><br />
                    <asp:Label ID="miscNameLabel" runat="server" Text='<%# Eval("miscName") %>' />
                    <br />
                    <asp:Label ID="miscDescriptionLabel" runat="server" 
                        Text='<%# Eval("miscDescription") %>' />
                    <br />Rate:
                    <asp:Label ID="miscRateLabel" runat="server" Text='<%# Eval("miscRate","{0:n2}") %>' />
                    <br />
                    <asp:LinkButton runat="server" 
                    ID="atl3" 
                    Text="Add To List" 
                    CommandName="AddToList" 
                    CommandArgument='<%#Eval("miscId") %>' CausesValidation="False"/>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="miscView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [miscId], [miscName], [miscDescription], [miscRate], [venueId] FROM [miscTBL] WHERE ([venueId] = @venueId) and (isDeleted = 0)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox4" Name="venueId" PropertyName="Text" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="miscInsert" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            DeleteCommand="DELETE FROM [rsvmiscTBL] WHERE [ReservationId] = @ReservationId AND [miscId] = @miscId" 
            InsertCommand="INSERT INTO [rsvmiscTBL] ([ReservationId], [miscId], [amount]) VALUES (@ReservationId, @miscId, @amount)" 
            SelectCommand="SELECT [ReservationId], [miscId], [amount] FROM [rsvmiscTBL]" 
            UpdateCommand="UPDATE [rsvmiscTBL] SET [amount] = @amount WHERE [ReservationId] = @ReservationId AND [miscId] = @miscId">
            <DeleteParameters>
                <asp:Parameter Name="ReservationId" Type="Int32" />
                <asp:Parameter Name="miscId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="newId" />
                <asp:ControlParameter ControlId="miscid" PropertyName="Text" Name="miscId" Type="Int32" />
                <asp:ControlParameter ControlId="miscamount" PropertyName="Text" Name="amount" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="amount" Type="Double" />
                <asp:Parameter Name="ReservationId" Type="Int32" />
                <asp:Parameter Name="miscId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="miscselect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT [miscId], [miscRate] FROM [miscTBL] WHERE ([miscId] = @miscId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="miscid" Name="miscId" PropertyName="Text" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </fieldset>
    <fieldset>
    <legend>Grand TOTAL:</legend>
        <div style="text-align:center;font-size:90px;padding: auto;">₱<asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
        </div>
    </fieldset>
    <div style="text-align:center">
    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="imgss" 
            ImageUrl="~/Resources/Done.png" onclick="ImageButton1_Click" /></div>
    </div>
</div>
    </asp:Content>
