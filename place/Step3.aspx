<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Step3.aspx.cs" Inherits="client_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        #sidebar
        {
        width:220px;    
        }
        #maincontent
        {
        width: 650px;    
        height: auto;
        }
        .imgssss
        {
            position:static;
        }
        .center
        {
            text-align:center;
            margin:auto;
        }
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
    .notif
    {
        font-size: x-large;
        color: #000000;
        font-family: "Book Antiqua";
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="wrapper">
 
<div id="maincontent">
        <ul id="mainNav" class="fiveStep" style="margin:0px">
		<li class="done"><a title=""><em>Step 1:</em><span>Know the Service</span></a></li>
		<li class="lastDone"><a title=""><em>Step 2:</em><span>Choose Facility</span></a></li>
		<li class="current"><a title=""><em>Step 3:</em><span>Available Date</span></a></li>
		<li><a title=""><em>Step 4:</em><span>Available Time</span></a></li>
		<li class="mainNavNoBg"><a title=""><em>Step 5:</em> <span>Finalize</span></a></li>
	</ul>
        <div style="text-align:center">
        <br />
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div class="notif">
            <br />
            Dates that are Available for Your Events<br />
            </div>&nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="text-align:center">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
            ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" 
            CssClass="center" ondayrender="Calendar1_DayRender" 
            onselectionchanged="Calendar1_SelectionChanged">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#0088cc" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                Font-Bold="True" Font-Size="12pt" ForeColor="Black" />
                    </asp:Calendar>
                    <br />
                    <asp:TextBox ID="TextBox3" runat="server" style="text-align:center" 
                        ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
        <div style="text-align:center">
        <br /> 
        <asp:Button ID="Button1" runat="server" Text="Back" onclick="Button1_Click" 
                CausesValidation="False" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Go to Next Step" 
            onclick="Button2_Click" />
            </div>
</div>

<div id="sidebar">
  <br />
    &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton4" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/halamanan ni mutya.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
    <br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton5" runat="server" Height="150px" 
            ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/nagsabado.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
    <br />
     <br />
      &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton6" runat="server" Height="150px" 
            
        ImageUrl="~/Resources/Tanghalang Pasigueño Facilities/main lobby.gif" Width="230px" 
        CssClass="imgssss" BorderColor="#FFFF80" 
                    BorderStyle="Outset"/>
       <br />
       <br />
 
      &nbsp;&nbsp;
          <asp:SqlDataSource ID="ReservedDateSelect" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT DateRecord, VenueId, Type FROM DateRepository WHERE (VenueId = @VenueId)">
              <SelectParameters>
                  <asp:SessionParameter Name="VenueId" SessionField="VenueId" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="PracticeDateSelect" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT DateRecord FROM DateRepository WHERE (VenueId = @VenueId) AND (Type = @Type)">
              <SelectParameters>
                  <asp:SessionParameter Name="VenueId" SessionField="VenueId" />
                  <asp:Parameter DefaultValue="prac" Name="Type" />
              </SelectParameters>
          </asp:SqlDataSource>
        
          <asp:SqlDataSource ID="EventType" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
              SelectCommand="SELECT [EventType] FROM [EventTBL] WHERE ([EventID] = @EventID)">
              <SelectParameters>
                  <asp:SessionParameter Name="EventID" SessionField="EventId" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
        
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
        
    </div>
</div>
</asp:Content>

