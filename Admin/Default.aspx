<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT AmenityTBL.AmenityName, rsvamntyTBL.Quantity FROM rsvamntyTBL INNER JOIN AmenityTBL ON rsvamntyTBL.AmenityId = AmenityTBL.AmenityId WHERE (rsvamntyTBL.ReservationId = @ReservationId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" 
                    QueryStringField="rrId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
