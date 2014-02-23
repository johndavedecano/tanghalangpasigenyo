<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="PracticeDates.aspx.cs" Inherits="Admin_PracticeDates" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .testing
        {
            background: pink;
            color:White;
            }
        .testing2
        {
            background: black;
            color:White;    
        }
        #boom
        {
            width: 400px;
            margin:auto;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

          <asp:SqlDataSource ID="ReservedDateSelect" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT DateRecord, VenueId, Type FROM DateRepository WHERE (VenueId = @VenueId)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList1" Name="VenueId" 
                      PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
          </asp:ToolkitScriptManager>
          <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
          <br />
          <br />
          <div id="boom">
          Venue:&nbsp;
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
              DataSourceID="VenueSelect" DataTextField="VenueName" DataValueField="VenueId">
          </asp:DropDownList>
          <asp:SqlDataSource ID="VenueSelect" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              SelectCommand="SELECT [VenueId], [VenueName] FROM [VenueTBL]">
          </asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                ondayrender="Calendar1_DayRender" 
                onselectionchanged="Calendar1_SelectionChanged" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                    VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#0088cc" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                    Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DropDownList1" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <br />
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
        </ContentTemplate>
    </asp:UpdatePanel></div>
    <asp:SqlDataSource ID="PracDateInsert" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              InsertCommand="INSERT INTO [DateRepository] ([DateRecord], [VenueId], [Type]) VALUES (@DateRecord, @VenueId, @Type)" >
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" DbType="Date" Name="DateRecord" />
            <asp:ControlParameter ControlID="DropDownList1" Name="VenueId" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="Type" Type="String" DefaultValue="prac" />
        </InsertParameters>

          </asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;
    </asp:Content>

