<%@ Page Language="C#" AutoEventWireup="true" CodeFile="res.aspx.cs" Inherits="Admin_res" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Tanghalang Pasigueño</title>
    <style type="text/css" media="print">
        .wrapper
        { 
            margin: auto;
            width:400px;
            border: 1px solid black;
            height:auto;
            padding:10px;
        }
        img
        {
            position:static;
            width:70px;
            height:70px;
         
        }
        .header
        {
            text-align:center;
            height:auto;
            clear:both;
        }
        .x1
        {
            float:left;
            width: 100px;
        }
        .x2
        {
            float: left;
            width: 200px;
        }
        .x3
        {
            float: left;
            width: 100px;
        }
        .s1
        {
            padding: 4px;
            width:190px;
            float:left;
            border-right: 1px solid black;
            border-bottom: 1px solid black;
        }
        .s2
        {
            padding: 4px;
            width:191px;
            float:right;
            border-bottom: 1px solid black;
        }
        .clear
        {
            clear:both;
        }
        .wborder3
        {
            border: 1px solid black;
            border-bottom: 0px;
            height: 90px;
        }
        .wborder
        {
            border: 1px solid black;
            border-bottom: 0px;
        }
        .wborder2
        {
            border: 1px solid black;
        }
        .txt
        {
            font-family: Times New Roman;
            font-size: 14px;
        }
    </style>
    <style type="text/css" media="screen">
        .wrapper
        { 
            margin: auto;
            width:400px;
            border: 1px solid black;
            height:auto;
            padding:10px;
        }
        img
        {
            position:static;
            width:70px;
            height:70px;
         
        }
        .header
        {
            text-align:center;
            height:auto;
            clear:both;
        }
        .x1
        {
            float:left;
            width: 100px;
        }
        .x2
        {
            float: left;
            width: 200px;
        }
        .x3
        {
            float: left;
            width: 100px;
        }
        .s1
        {
            padding: 4px;
            width:190px;
            float:left;
            border-right: 1px solid black;
            border-bottom: 1px solid black;
        }
        .s2
        {
            padding: 4px;
            width:191px;
            float:right;
            border-bottom: 1px solid black;
        }
        .clear
        {
            clear:both;
        }
        .wborder3
        {
            border: 1px solid black;
            border-bottom: 0px;
            height: 90px;
        }
        .wborder
        {
            border: 1px solid black;
            border-bottom: 0px;
        }
        .wborder2
        {
            border: 1px solid black;
        }
        .opt
        {
            font-weight:bolder;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <div>
          <div class="header">
            <div class="x1">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl="~/Resources/pasig city logo.jpg" />
            </div>
            <div class="x2">
            <span>Republic of the Philippines</span><br />
            <span>Government of Pasig City</span><br />
            <span class="opt">OFFICE OF THE CITY TREASURER</span>
        <br />
            </div>
            <div class="x3">
            &nbsp;
            </div>
        </div>
        <br />
        <div class="clear"></div>
        <br />
        <div>
        <div style="width:40px;float: left">Tel:</div>
        <div style="width:160px;float: left; margin-bottom: 0px;">620-2463</div>
        <div style="width:200px;float: left">620-2400 loc 5901</div>
        <div style="width:40px;float: left">Fax:</div>
        <div style="width:160px;float: left; margin-bottom: 0px;">620-2400 loc 5909</div> 
        <div style="width:200px;float: left">&nbsp;</div>
        </div>

       <br />&nbsp;
        <div style="border: 1px solid black">
            <div class="s1">
                <br />
                <br />
            Date:&nbsp;
            <br />
                <asp:Label ID="ddate" runat="server" Text="Label"></asp:Label>
                <br />&nbsp;
            </div>
            <div class="s2">
            
                Reservation No.:&nbsp;
                <asp:Label ID="rno" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
            
                No.:<br />
                <div><asp:Label ID="rxno" runat="server" Text="Label"></asp:Label>
                    <br />&nbsp;
                </div>
            </div>
            <div>
            Payor:&nbsp;&nbsp;
            <asp:TextBox ID="payortb" runat="server" Width="300px" CssClass="txt"></asp:TextBox>

            </div>
        </div>
        
            <br />
            <div>
                <div class="wborder" style="width:243px;float: left; text-align:center;">Particulars</div>
                <div class="wborder" style="width:10px;float: left; border-left: 0px;border-right: 0px">&nbsp;</div>
                <div class="wborder" style="width:143px;float: left; border-left: 0px; text-align:center;">Amount</div>  

                <div class="wborder3" style="width:243px;float: left;">
                    <br />
                    <asp:Label 
                        ID="partic" runat="server" Text="Label"></asp:Label>
                    <br />
                </div>
                <div class="wborder3" style="width:10px;float: left; border-left: 0px;border-right: 0px"><br />₱
                </div>
                <div class="wborder3" style="width:143px;float: left; border-left: 0px; text-align:right"><br />
                    <asp:Label ID="amnt" runat="server" Text="Label"></asp:Label></div>  
                
                <div class="wborder2" style="width:243px;float: left;text-align:right;">Total&nbsp;&nbsp;&nbsp; </div>
                <div class="wborder2" style="width:10px;float: left; border-left: 0px;border-right: 0px">₱</div>
                <div class="wborder2" style="width:143px;float: left; border-left: 0px;text-align:right;">
                    <asp:Label ID="total" runat="server" Text="Label"></asp:Label></div>  
                
            </div>
            <br />
            <br />
            <div>&nbsp;<br />&nbsp;</div>
            <div>
                <div style="width:60px;float: left">Rec&#39;d By:</div>
                <div style="width:164px;float:left;  border-bottom:1px solid black">&nbsp;</div>
                <div style="width:8px;float:left;">&nbsp;</div>
                <div style="width:164px;float: left;  border-bottom:1px solid black">
                    <asp:Label ID="recby" runat="server" Text="Label"></asp:Label>
                </div> 

                <div style="width:60px;float: left">&nbsp;</div>
                <div style="width:164px;float:left; text-align:center; height: 19px;">Signature</div>
                <div style="width:8px;float:left;">&nbsp;</div>
                <div style="width:164px;float: left; text-align:center">Print Name</div> 
            </div>
            
            <div>
            
            </div>
        <asp:SqlDataSource ID="DetailsSelect" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
            SelectCommand="SELECT PaymentTBL.ReservationId, PaymentTBL.RecieptNo, ClientTBL.ClientFname + ' ' + ClientTBL.ClientMname + ' ' + ClientTBL.ClientLname AS Name, PaymentTBL.Particulars, PaymentTBL.AmountRecieved, PaymentTBL.RecievedBy, PaymentTBL.DatePaid FROM ReservationTBL INNER JOIN ClientTBL ON ReservationTBL.ClientId = ClientTBL.ClientId INNER JOIN PaymentTBL ON ReservationTBL.ReservationId = PaymentTBL.ReservationId WHERE (PaymentTBL.ReservationId = @ReservationId) AND (PaymentTBL.RecieptNo = @RecieptNo)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ReservationId" QueryStringField="rrgh" />
                <asp:QueryStringParameter Name="RecieptNo" QueryStringField="rqw" />
            </SelectParameters>
        </asp:SqlDataSource>
            <div style="text-align:right; font-family: Monotype Corsiva; font-size: 20px;"><br>&nbsp;<br>&nbsp;<br />Thank You</div><br />
    </div>
    </div>
    </form>
</body>
</html>
