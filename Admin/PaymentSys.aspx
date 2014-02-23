<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="PaymentSys.aspx.cs" Inherits="Admin_RFC" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .command
        {
            float:right;
            height:200px;
            width:400px;
        }
        fieldset
        {
            border:1px solid #0088cc;
            color:Black;
            margin:0px;
            }
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
            width:350px;

        }
        .s2
        {
            width:350px;
            
        }
        .s3
        {
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
            text-align:left;
            font-size: 30px;
            color: #0088cc;
        }
        .notif2
        {
            text-align:center;
            font-size: 30px;
            color: #000000;
        font-family: "Book Antiqua";
    }
        .lf
        {
            float:left;
            width:355px;
        }
        .rt
        {
            float:right;
            width: 345px;
        }  
        .lr
        {
            float: left;
            width: 360px;
            padding: 20px;
        }
        .rst
        {
            float:right;
            width: 280px;
            padding: 20px;
        }
        .fieldz
        {
            float:right;
            width:210px;
            height: 20px;
            padding-bottom:10px;
        }
        .labelz
        {
            float:left; 
            clear:both;
            width: 120px;
            height: 20px;
            padding-bottom:10px;
            color:black;
        }
        .Image1
        {
            position:static;
            width: 30px;
            height: 30px;
        }
        .ccc
        {
            color:Red;
        }
    .style1
    {
        color: #000000;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper" style="text-align:left">
<div style="margin:auto; width:840px"><br /><br />
<div class="notif2">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div class="style1">Payment Collection</div><br />
    Reservation No:
    <asp:TextBox ID="TextBox4" runat="server" Font-Size="20px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox4" ValidationGroup="b" ForeColor="#FF3300" 
        style="color: #FF3300"></asp:RequiredFieldValidator>
&nbsp;
    <asp:Button ID="Button4" runat="server" Text="Ok" Font-Size="20pt" 
        onclick="Button4_Click" ValidationGroup="b" />
    </div>
<div class="eventinfo">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="Cancel0">
        <EmptyDataTemplate>
            <div style="text-align:center; font-size:20px; font-family:Lucida Sans;">No records found.</div>
        </EmptyDataTemplate>
        <ItemTemplate>
                    <div class="lf">
                <div class="s1">
                    <fieldset style="border-color: #FF3300">
                    <legend>Reservation Details</legend>
                    <div style="visibility: hidden">
                     <div class="labels">Venue Name:</div>
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
                        <div class="labels">Reservation Date</div>
                        <div class="fields">
                        <asp:Label ID="ReservationDateLabel" runat="server" 
                            Text='<%# Eval("ReservationDate", "{0:MMMM dd, yyyy}") %>' />
                        </div>
                        <div class="labels">Start Time:</div>
                        <div class="fields">
                        <asp:Label ID="ReservationStartTimeLabel" runat="server" 
                            Text='<%# Eval("ReservationStartTime") %>' />
                        </div>
                        <div class="labels">No of Hours:</div>
                        <div class="fields">
                        <asp:Label ID="NumberofHoursLabel" runat="server" 
                            Text='<%# Eval("NumberofHours") %>' />
                        </div>
                        <div class="labels">End Time</div>
                        <div class="fields">
                        <asp:Label ID="ReservationEndTimeLabel" runat="server" 
                            Text='<%# Eval("ReservationEndTime") %>' />
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="rt">
                <div class="s2">
                    <fieldset style="border-color: #FF3300">
                        <legend>Clients Info</legend>
                        <div class="labels">Client Name:</div>
                        <div class="fields">
                        <asp:Label ID="ClientLnameLabel" runat="server" 
                            Text='<%# Eval("ClientLname") %>' />
                        </div>
                        <div class="labels">Contact No.:</div>
                        <div class="fields">
                        <asp:Label ID="ClientContactNoLabel" runat="server" 
                            Text='<%# Eval("ClientContactNo") %>' />
                        </div>
                        <div class="labels">Address:</div>
                        <div class="fields">
                        <asp:Label ID="ClientAddressLabel" runat="server" 
                            Text='<%# Eval("ClientAddress") %>' />
                        </div>
                    </fieldset>
                </div>
        
                <div class="s3">
                    <fieldset style="border-color: #FF3300">
                    <legend>Account Details</legend>
                        <div class="labels">Balance:</div>
                        <div class="fields">
                        <asp:Label ID="BalanceLabel" runat="server" Text='<%# Eval("Balance", "{0:n2}") %>' />
                        </div>
                        <div class="labels">Last Payment Date:</div>
                        <div class="fields">
                        <asp:Label ID="DateChangedLabel" runat="server" 
                            Text='<%# Eval("DateChanged", "{0:MMMM dd, yyyy}") %>' />
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="clear"></div>
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
        <div class="clear"></div>
        <br />
        <div>
            <div class="lr">
            <fieldset style="border-color: #FF3300">
            <legend>Payment Info</legend>
            <div style="height:160px;">
            <div class="labelz">Receipt No.:</div>
            <div class="fieldz">
                <asp:TextBox ID="TextBox1" runat="server" ToolTip="weh" Font-Size="15px" 
                    Width="160px"></asp:TextBox> 
                <asp:MaskedEditExtender ID="TextBox1_MaskedEditExtender" runat="server" 
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                    TargetControlID="TextBox1" MaskType="Number" Mask="9999999999" 
                    PromptCharacter="#">
                </asp:MaskedEditExtender>  
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" 
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
            <div class="labelz">Particulars.:</div>
            <div class="fieldz">
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="15px" Width="159px"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" 
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
            <div class="labelz" style="height:40px">Amount Received:</div>
            <div class="fieldz" style="height:40px">
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="15px" Width="159px"></asp:TextBox>        
                <asp:FilteredTextBoxExtender ID="TextBox3_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox3">
                </asp:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" 
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Amount Entered Exceeded" 
                    EnableViewState="False" Type="Double" CssClass="ccc"></asp:RangeValidator>
            </div>
            <div class="labelz">
                </div>
            <div class="fieldz">
                &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Submit" 
                    onclick="Button1_Click" />
                <asp:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" 
                    ConfirmText="Are you sure?" Enabled="True" TargetControlID="Button1">
                </asp:ConfirmButtonExtender>
                &nbsp;&nbsp; 
                <asp:Button ID="Button2"
                    runat="server" Text="Cancel" onclick="Button2_Click" 
                    CausesValidation="False" />
            </div>
            </div>
            </fieldset>
        </div>
        <div class="rst" runat="server">
            <fieldset style="border-color: #FF3300">
            <legend>Print</legend>
                <div style="height:160px; text-align: center;">
                    <br />
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" 
                        ImageUrl="~/Resources/printer.png" Width="30px" CssClass="Image1" />
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="20px">Print Receipt</asp:LinkButton>
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="Done" onclick="Button3_Click" />
                </div>
            </fieldset>
        </div>
        </div>
</div>

</div>
</div>


    <asp:SqlDataSource ID="Cancel0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        SelectCommand="SELECT ReservationTBL.ReservationId, VenueTBL.VenueName, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate, ReservationTBL.ReservationStartTime, ReservationTBL.NumberofHours, ReservationTBL.ReservationEndTime, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS ClientLname, ClientTBL.ClientContactNo, ClientTBL.ClientAddress, BalanceTBL.Balance, BalanceTBL.DateChanged FROM ReservationTBL INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN BalanceTBL ON ReservationTBL.ReservationId = BalanceTBL.ReservationId WHERE (ReservationTBL.ReservationId = @ReservationId) AND ((ReservationTBL.tag = 4) OR (ReservationTBL.tag = 6))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox4" PropertyName="Text" Type="Int32" Name="ReservationId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SelectTag" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [Tag], [ReservationId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Checking" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT COUNT(ReservationId) AS cc FROM ReservationTBL WHERE (ReservationId = @ReservationId) AND ((Tag = 4) or (Tag = 6))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [Balance] FROM [BalanceTBL] WHERE [ReservationId] = @ReservationId" 
        UpdateCommand="UPDATE [BalanceTBL] SET [DateChanged] = @DateChanged, [Balance] = @Balance WHERE [ReservationId] = @ReservationId">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox5" PropertyName="Text" DbType="Date" Name="DateChanged" />
            <asp:ControlParameter ControlID="TextBox6" PropertyName="Text" Name="Balance" Type="Double" />
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [VenueId] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="PaymentInsert" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        InsertCommand="INSERT INTO [PaymentTBL] ([ReservationId], [RecieptNo], [Particulars], [AmountRecieved], [RecievedBy], [VenueId], [DatePaid], [TimePaid]) VALUES (@ReservationId, @RecieptNo, @Particulars, @AmountRecieved, @RecievedBy, @VenueId, @DatePaid, @TimePaid)" >
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="RecieptNo" Type="String" />
            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="Particulars" Type="String" />
            <asp:ControlParameter ControlID="TextBox3" PropertyName="Text" Name="AmountRecieved" Type="Double" />
            <asp:ControlParameter ControlID="Employee" PropertyName="Text" Name="RecievedBy" Type="String" />
            <asp:ControlParameter ControlID="TextBox7" PropertyName="Text" Name="VenueId" Type="Int32" />
            <asp:ControlParameter ControlID="TextBox5" PropertyName="Text" Name="DatePaid" Type="DateTime" />
            <asp:ControlParameter ControlID="TTime" PropertyName="Text" DbType="Time" Name="TimePaid" />
        </InsertParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="TagUpdate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        UpdateCommand="UPDATE [ReservationTBL] SET [Tag] = @Tag WHERE [ReservationId] = @ReservationId">
        <UpdateParameters>
            <asp:Parameter Name="Tag" Type="Int32" DefaultValue="5" />
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>


                    <asp:TextBox ID="Employee" runat="server" Visible="False"></asp:TextBox>

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
            <asp:ControlParameter ControlID="TextBox4" Name="ReservationId" 
                PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:TextBox ID="TTime" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox5" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox7" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox8" runat="server" Visible="False"></asp:TextBox>


    </asp:Content>

