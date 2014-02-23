<%@ Page Title="Tanghalang Pasigueño" Language="C#" AutoEventWireup="true" CodeFile="MiscReports.aspx.cs" Inherits="Reports_MiscReports" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Button ID="Button1" runat="server" Text="Back to Admin Page" 
            Font-Size="20pt" onclick="Button1_Click" /></div>
    <div>
        
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
            ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
            ToolPanelWidth="200px" Width="1104px" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="C:\Users\seph\Documents\Visual Studio 2010\WebSites\YBAROS\Reports\Misc.rpt">
            </Report>
        </CR:CrystalReportSource>
        
    </div>
    </form>
</body>
</html>
