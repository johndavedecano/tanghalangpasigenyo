
<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="EOS.aspx.cs" Inherits="Admin_EOS" %>

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
        width: 180px;
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
    .xx
    {
        color:Gray;
    }
        .notif
        {
            text-align:center;
            font-size: 30px;
            color: #0088cc;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <br><br>
<div class="newMain">
   
    
    <div class="notif"> </div>
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
                Reservation Id:
                <asp:Label ID="ReservationIdLabel" runat="server" 
                    Text='<%# Eval("ReservationId") %>' />
                <br /><br />
                Name of Event:
                <asp:Label ID="NameofEventLabel" runat="server" 
                    Text='<%# Eval("NameofEvent") %>' />
                <br /><br />
                Service Name:
                <asp:Label ID="VenueNameLabel" runat="server" Text='<%# Eval("VenueName") %>' />
                <br /><br />
                Reservation Date:
                <asp:Label ID="ReservationDateLabel" runat="server" 
                    Text='<%# Eval("ReservationDate", "{0:MMMM dd, yyyy}") %>' />
                <br /><br />
                </div>
                <div id="fright">
                Start Time:
                <asp:Label ID="ReservationStartTimeLabel" runat="server" 
                    Text='<%# Eval("ReservationStartTime") %>' />
                <br /><br />
                Number of hours:
                <asp:Label ID="NumberofHoursLabel" runat="server" 
                    Text='<%# Eval("NumberofHours") %>' />
                <br /><br />
                 Total:
                <asp:Label ID="grandtotalLabel" runat="server" 
                    Text='<%# Eval("grandtotal", "{0:n2}") %>' />
                <br /><br />
                  </t>       <div class="labels" style="visibility: hidden">Event Type:
                <asp:Label ID="EventTypeLabel" runat="server" Text='<%# Eval("EventType") %>' />
                </div>
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

  
    </div>
    <div class="tx">
    <fieldset>
    <legend>
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Time Exceeded" 
            AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" /></legend>
        
        No of Hours:<br />
        <div style="text-align:center"><asp:UpdatePanel ID="UpdatePanel1" runat="server" 
                UpdateMode="Conditional">
            <ContentTemplate>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="40px" Height="40px" 
                    Width="194px" CssClass="tbcenter"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="TextBox1" WatermarkText=" ">
                </asp:TextBoxWatermarkExtender>
                <br />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="*" ValidationGroup="a" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="CheckBox1" EventName="CheckedChanged" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
        <br />
        
    </fieldset>
    </div>
    <div style="clear:both"></div>
        <fieldset>
        <div style="float:left; width:325px">
            <div class="m1">Ingress:</div>
            <div class="m2">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox6_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="TextBox6" WatermarkCssClass="xx" 
                    WatermarkText="No of Hours">
                </asp:TextBoxWatermarkExtender>
                <asp:FilteredTextBoxExtender ID="TextBox6_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox6">
                </asp:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </div>
            <div class="m1">Engress:</div>
            <div class="m2">
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox8_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="TextBox8" WatermarkCssClass="xx" 
                    WatermarkText="No of Hours">
                </asp:TextBoxWatermarkExtender>
                <asp:FilteredTextBoxExtender ID="TextBox8_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox8">
                </asp:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox8" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </div>
            <div class="m1" style="visibility: hidden"> Airconditioning System:</div>
            <div class="m2">
                
            </div>
            <div class="m1" style="visibility: hidden">Number of hours Used:</div>
            <div class="m2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Font-Size="20px" Text="Next" 
                    ValidationGroup="a" onclick="Button1_Click" />
                </div>
        &nbsp;
        </div>
        <div style="float:left; width:325px">
            <div class="m1"style="visibility: hidden">Blower:</div>
            <div class="m2">
                <asp:TextBox ID="TextBox9" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox9_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="TextBox9" WatermarkCssClass="xx" 
                    WatermarkText="No of Hours">
                </asp:TextBoxWatermarkExtender>
                <asp:FilteredTextBoxExtender ID="TextBox9_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox9">
                </asp:FilteredTextBoxExtender>
                </div>
            <div class="m1"style="visibility: hidden">Lights:</div>
            <div class="m2">
                <asp:TextBox ID="TextBox10" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox10_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="TextBox10" WatermarkCssClass="xx" 
                    WatermarkText="No of Hours">
                </asp:TextBoxWatermarkExtender>
                <asp:FilteredTextBoxExtender ID="TextBox10_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox10">
                </asp:FilteredTextBoxExtender>
                </div>
            <div class="m1" style="visibility: hidden">High Bay Floodlights:</div>
            <div class="m2">
                <asp:TextBox ID="TextBox11" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox11_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="TextBox11" WatermarkCssClass="xx" 
                    WatermarkText="No of Hours">
                </asp:TextBoxWatermarkExtender>
                <asp:FilteredTextBoxExtender ID="TextBox11_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox11">
                </asp:FilteredTextBoxExtender>
                </div><div style="clear:both; text-align:center">
                <asp:TextBox ID="TextBox12" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox12_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="TextBox12" WatermarkCssClass="xx" 
                    WatermarkText="No of Hours">
                </asp:TextBoxWatermarkExtender>
                <asp:FilteredTextBoxExtender ID="TextBox12_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox12">
                </asp:FilteredTextBoxExtender>
                </div>
        </div>
    </fieldset>  <div style="clear:both;">
            <asp:SqlDataSource ID="eosInsert" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                DeleteCommand="DELETE FROM [EOSDetails] WHERE [ReservationId] = @ReservationId" 
                InsertCommand="INSERT INTO [EOSDetails] ([ReservationId], [Ingress], [Engress], [NoofHrsUsed], [Blower], [Light], [HighBayFloodLights], [TimeExceeded], [TimeExceededAmount], [TotalAccumulatedAmount]) VALUES (@ReservationId, @Ingress, @Engress, @NoofHrsUsed, @Blower, @Light, @HighBayFloodLights, @TimeExceeded, @TimeExceededAmount, @TotalAccumulatedAmount)" 
                SelectCommand="SELECT * FROM [EOSDetails]" 
                
                UpdateCommand="UPDATE [EOSDetails] SET [Ingress] = @Ingress, [Engress] = @Engress, [NoofHrsUsed] = @NoofHrsUsed, [Blower] = @Blower, [Light] = @Light, [HighBayFloodLights] = @HighBayFloodLights, [TimeExceeded] = @TimeExceeded, [TimeExceededAmount] = @TimeExceededAmount, [TotalAccumulatedAmount] = @TotalAccumulatedAmount WHERE [ReservationId] = @ReservationId">
                <DeleteParameters>
                    <asp:Parameter Name="ReservationId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter Name="ReservationId" Type="Int32" QueryStringField="ReservationId" />
                    <asp:ControlParameter ControlID="TextBox6" PropertyName="Text" Name="Ingress" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox8" PropertyName="Text" Name="Engress" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox12" PropertyName="Text" Name="NoofHrsUsed" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox9" PropertyName="Text" Name="Blower" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox10" PropertyName="Text" Name="Light" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox11" PropertyName="Text" Name="HighBayFloodLights" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="TimeExceeded" Type="Double" />
                    <asp:ControlParameter ControlID="TextBox13" PropertyName="Text" Name="TimeExceededAmount" Type="Double" />
                    <asp:ControlParameter ControlID="TextBox13" PropertyName="Text" Name="TotalAccumulatedAmount" Type="Double" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="rphSelect" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
                SelectCommand="SELECT EventTBL.RateperHour FROM EventTBL INNER JOIN ReservationTBL ON EventTBL.EventID = ReservationTBL.EventId WHERE (ReservationTBL.ReservationId = @ReservationId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ReservationId" 
                        QueryStringField="ReservationId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="TextBox13" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="TextBox14" runat="server" Visible="False"></asp:TextBox>
        </div>
    </fieldset>
</div>
</div>
<div>

    
    </div>
</asp:Content>

