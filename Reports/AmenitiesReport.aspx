﻿<%@ Page Title="Tanghalang Pasigueño" Language="C#" AutoEventWireup="true" CodeFile="AmenitiesReport.aspx.cs" Inherits="Reports_AmenitiesReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
    
        <asp:ImageButton ID="BackAdminBtn" runat="server" Height="50px" 
             ImageUrl="~/Resources/gelo/1.png" onclick="BackAdminBtn_Click" Width="300px" /><br />
      <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:ImageButton ID="YSABtn" runat="server" Height="48px" 
            ImageUrl="~/Resources/gelo/2.png" visible="false" Width="200px" onclick="YSABtn_Click" />
    
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="YCBtn" runat="server" Height="48px" 
            ImageUrl="~/Resources/gelo/3.png" Width="200px" onclick="YCBtn_Click" Visible="false" />
&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="YCYSABtn" runat="server" Enabled="False" Height="48px" 
            ImageUrl="~/Resources/gelo/Red/4.png" Width="200px" Visible="false" />
    
    </div>
    <div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" 
            ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
            ToolPanelWidth="200px" Width="350px" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="Amenities.rpt">
            </Report>
        </CR:CrystalReportSource>
    </div>
    </form>
</body>
</html>
