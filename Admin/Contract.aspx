<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contract.aspx.cs" Inherits="Contract" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
    <style type="text/css" media="print">
      .break { page-break-before: always; }
   
        .wrapper
        { 
            margin: auto;
            width:600px;
        }
        img
        {
            position:static;
            width:100px;
            height:100px
            
        }
        .header
        {
            text-align:center;
        }
        .opt
        {
            font-weight:bolder;
        }
        .top
        {
            padding-left: 400px;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 544px;
        }
       .style3
        {
            width: 339px;
        }
        .style4
        {
            width: auto ;
              
        }    
    </style>
    <style type="text/css" media="screen">
        .wrapper
        { 
            margin: auto;
            width:600px;
        }
        img
        {
            position:static;
            width:100px;
            height:100px
            
        }
        .header
        {
            text-align:center;
        }
        .opt
        {
            font-weight:bolder;
        }
        .top
        {
            padding-left: 400px;
        }
        .clientinfo
        {
            width: 250px;
        }
        .style4{ width: auto;}
        .break { page-break-before: always; }
        .table { page-break-before: always;
                 position: static;}
    p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	        margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
    ol
	{margin-bottom:0in;}
 li.MsoNormal
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	        margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
        .style3
        {
            width: 402px;
        }
        .style5
        {
            width: 593px;
        }
        .style6
        {
            font-size: large;
        }
        .style7
        {
            text-align: justify;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <div class="header">
        <div class="style5">
            &nbsp;<asp:Label ID="Label14" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label33" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label34" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <span class="style6">&nbsp;</span><strong><span class="style6">Letter of 
            Agreement</span></strong></div>
        </div>
        <br />
        <br />
        <br />
        <div class="top">
            &nbsp;&nbsp; <asp:Label ID="Label2" 
                runat="server" Text="System Date"></asp:Label>
        </div>
        <br />
        THE ADMINISTRATOR<br />
        Tanghalang Pasigueño<br />
        City of Pasig
        <br />
        <br />
        <div>
            Dear Sir / Madam:
        <asp:Label ID="Label16" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <p style="margin-left: 40px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp In 
                approval of our request to use the Tanghalang Pasigueño. I/we are amenable to 
                the following conditions and subject myself/ourselves to the following house 
                rules:</p>
            </div>
       <div>
       <p>Conditions:</p>
           <ol><li class="style7">
      To pay to the Tanghalang Pasigueño a Reservation Fee upon reservation and/or confirmation of the specific date and time of the Lessee's activity / event.</li>
               <li class="style7">
                   To pay to the Office of the City Treasurer of Pasig fifty percent (50%) not 
                   later than seven (7) calendar days before the actual date of the use of the 
                   Tanghalang Pasigueño. Non compliance shall cause the automatic cancellation of 
                   the approval of lease of the Tanghalang Pasigueño and the City Government of 
                   Pasig will not liable for any consequences thereof.</li>
               <li class="style7">
                   In case of postponement or cancellation of the use of Tanghalang Pasigueño 
                   without any fault from Administration, fifty percent (50%) of the down payment 
                   shall be forfeited by the City Government of Pasig and the same is considered as 
                   penalty. </li>
               <li class="style7">
                   Cancellation of reserved schedules of change of schedules shall be made in 
                   written form. A cancellation / change of schedule form is available at the 
                   Administrator&#39;s Office. </li>
               <li class="style7">
                   The City Government of Pasig is free from any liability, claim or suit arising 
                   from any casualty or injury that may arise in the preparation for the use of the 
                   Tanghalang Pasigueño which may occur due to gross negligence on my / our the 
                   part.</li>
               <li class="style7">
                   I / We will be liable for damage(s) caused to equipments / facilities of the 
                   Tanghalang Pasigueño by the undersigned and the staff. The cost of damage shall 
                   be settled within five (5) calendar days upon receipt of letter / advise from 
                   the Administrator of the Tanghalang Pasigueño</li>
  </ol>
        <p>House Rules:</p>
           <ol><li class="style7">
               The Tanghalang Pasigueño is a Smoke Free Area and that NO SMOKING plociy shall 
               be enforced inside the tanghalan at all times.</li>
               <li class="style7">
                   No deadly weapons, probihited drugs and liquor will be allowed inside the 
                   Tanghalang Pasigueño.</li>
               <li class="style7">
                   No food shall be allowed inside the Asemblea Magna (,Main Theather) of the 
                   Tanghalang Pasigueño.</li>
               <li class="style7">
                   The Tanghalang Pasigueño reserves the right to reject or to prohibit anyone from 
                   entering the tanhalan if caught to be vandalizing or tampering the tanghalan 
                   decors, walls and furniture.</li>
               <li class="style7">
                   Removal of theater chairs, mounting of backdrops directly on the tanghalan&#39;s 
                   walls. use of nails, gun tuckers or anything that can damage the stage is 
                   strictly probihited.</li>
               <li class="style7">
                   Observe orderliness and cleanliness inside the tanghalan. Return any furniture 
                   used to its original place after use.</li>
               <li class="style7">
                   Upon confirmation and approval the Lessee shall accomplish the Agreement Form 
                   which shall serve as the usage permit of the Lessee. This form shall be 
                   presented to the tanghalan staff or security personnel on the day of the use.</li>
               <li class="style7">
                   Strict compliance of these rules should be observed of the usage permit may br 
                   cancelled by the tanghalan authority</li>
  </ol>
        <br />
        <br />
        
 
        
                   <div class="table" style="width: 596px"> 
                    <table style="width: 592px; height: 27px;"><tr>  
                    <td class="style3"> </td><td class="style4"> Very truly yours,</td></tr>
                    <td class="style3"> </td><td class="style4"> </td></tr>
                    <td class="style3"> &nbsp;</td><td class="style4"> </td></tr>
                    <td class="style3"> </td><td class="style4"> Mr/Ms. <asp:Label ID="Label24" runat="server" Text="Name of Client"></asp:Label>
                        </td></tr>
                    <td class="style3" align =left> &nbsp;</td> <td class="style4">  
                            <asp:Label ID="Label35" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
                        </td></tr>
                     <td class="style3"> </td><td class="style4">  
                            <asp:Label ID="Label36" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
                        </td></tr>
                      </table>
                    </div>
               
        </div>

    
     </div>

    </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT ClientTBL.ClientFname + ' ' + ClientTBL.ClientLname AS Cname, ClientTBL.ClientAddress, ClientTBL.ClientCompany FROM ClientTBL INNER JOIN ReservationTBL ON ClientTBL.ClientId = ReservationTBL.ClientId WHERE (ReservationTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="rrId" 
                QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT VenueTBL.VenueName, VenueTBL.VenueLocation, ReservationTBL.NameofEvent, ReservationTBL.ReservationDate FROM ReservationTBL INNER JOIN VenueTBL ON ReservationTBL.VenueId = VenueTBL.VenueId WHERE (ReservationTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="rrId" 
                QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT TOP (1) EventTBL.ReservationFee, EventTBL.OperationalExpense, EventTBL.PerformanceBond, EventTBL.RateperHour, ReservationTBL.EventReservedAmount, DATEADD(day, - PaymentDeadlineTBL.NoDays, ReservationTBL.ReservationDate) AS DL FROM EventTBL INNER JOIN ReservationTBL ON EventTBL.EventID = ReservationTBL.EventId CROSS JOIN PaymentDeadlineTBL WHERE (ReservationTBL.ReservationId = @rrId) ORDER BY PaymentDeadlineTBL.Id DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="rrId" 
                QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT [ReservationDate], [ReservationStartTime], [ReservationEndTime] FROM [ReservationTBL] WHERE ([ReservationId] = @ReservationId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="ReservationId" 
                QueryStringField="rrId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        
        
        SelectCommand="SELECT AmenityTBL.AmenityName, rsvamntyTBL.Quantity, ReservationTBL.ReservationId, AmenityTBL.Description FROM AmenityTBL INNER JOIN rsvamntyTBL ON AmenityTBL.AmenityId = rsvamntyTBL.AmenityId INNER JOIN ReservationTBL ON rsvamntyTBL.ReservationId = ReservationTBL.ReservationId WHERE (ReservationTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="rrId" 
                QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT FacilityTBL.FacilityName, FacilityTBL.FacilityDescription FROM FacilityTBL INNER JOIN rsvfacTBL ON FacilityTBL.FacilityId = rsvfacTBL.FacilityId INNER JOIN ReservationTBL ON rsvfacTBL.ReservationId = ReservationTBL.ReservationId WHERE (ReservationTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="rrId" 
                QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        SelectCommand="SELECT miscTBL.miscName, miscTBL.miscDescription FROM miscTBL INNER JOIN rsvmiscTBL ON miscTBL.miscId = rsvmiscTBL.miscId INNER JOIN ReservationTBL ON rsvmiscTBL.ReservationId = ReservationTBL.ReservationId WHERE (rsvmiscTBL.ReservationId = @rrId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="rrId" 
                QueryStringField="rrId" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
    <div class="labels" style="visibility: hidden"><strong>Conditions:</strong> 
     <br/>
     <div>
    <ul>  ₱
        <asp:Label ID="Label40" runat="server" Text="ReservationFee" style="visibility: hidden"></asp:Label>
&nbsp;as Reservation fee which amount shall serve as part of the contract agreement;  
 ₱   
    <asp:Label ID="Label41" runat="server" Text="RentalFee" style="visibility: hidden"></asp:Label>
   &nbsp;Rental fee ; 
    ₱&nbsp;<asp:Label ID="Label43" runat="server" Text="OperEx" style="visibility: hidden"></asp:Label>&nbsp;Operational expenses; 
    ₱&nbsp;<asp:Label ID="Label44" runat="server" Text="PB" style="visibility: hidden"></asp:Label>
       &nbsp;Performance Bond; (Refundable) 
    Full payment of Rental Fee and Performance Bond shall be made not later than 
       <asp:Label ID="Label1" runat="server" Text="Deadline"></asp:Label>; 
    Additional Charge-Event Proper: - ₱ 
       <asp:Label ID="Label42" runat="server" Text="rateperhour" style="visibility: hidden"></asp:Label>
       &nbsp;per hour or any fraction thereof in excess of the time mentioned above.
-	The amount equivalent to the excess hours, additional facilities used and any damages inside and outside of the arena will be deducted from the Performance Bond.
 </ul>
    </div><br/>

    <div>
   <strong>Mode of Payment:</strong> 
        <p style="margin-left: 40px">
        Cash, Manager’s or Cashier’s Check payable to the Rizal Provincial Government.
        </p></div>
        <div class="break" >
         <strong>The Rizal Provincial Government will provide following:</strong> 
        <br />
        <ul> Venue – 
            <asp:Label ID="Label45" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
             
            <asp:Label ID="Label3" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
                <asp:Label ID="Label46" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
            <asp:Label ID="Label5" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
                <asp:Label ID="Label47" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
                 
                Miscellaneous - 
                
                 <asp:Label ID="Label48" runat="server" Text="Label" style="visibility: hidden"></asp:Label>
&nbsp;Maintanance/Utilities and Security Support;  </ul>
         </div>
         <br/>
          <div >
           
         &nbsp;Concessionaires and/ or selling or distribution of promotional materials within the 
             venue  who  are  not  directly  competitors of  the Sponsors of  the event shall  be
             approved by the Rizal Provincial Government only. 
         </div>
         <br/>
          <div >
          Guests list will be filled-up by all guests entering the arena. 
          </div>
         </ol>
         </div>
    <div class="labels" style="visibility: hidden">We wish to inform you that your request to use the 
                <asp:Label ID="Venue" runat="server" Text="Venue" style="visibility: hidden"></asp:Label>
&nbsp;<asp:Label ID="VAdd" runat="server" Text="VAdd" style="visibility: hidden"></asp:Label>
&nbsp;for the “<asp:Label ID="N" runat="server" Text="NEvent" style="visibility: hidden"></asp:Label>
                ”  
                <asp:Label ID="Label37" runat="server" Text="Date"></asp:Label>
&nbsp;has been favorably given due course by this office under joint sponsorship to promote tourism subject to the following terms and manner of payment:</div>
    </body>
</html>

