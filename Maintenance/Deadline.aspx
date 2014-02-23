<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Deadline.aspx.cs" Inherits="events" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
   
  <div id="maincontent">
  <fieldset>
  <legend>Deadline of Payment Maintenance</legend>
      
      <br />      
      <br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" 
          BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
          ForeColor="Black" GridLines="Vertical">
          <AlternatingRowStyle BackColor="#CCCCCC" />
          <Columns>
              <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                  <EditItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="NoDays" HeaderText="Number Days" 
                  SortExpression="NoDays" >
              <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:TemplateField HeaderText="Last Date Changed" 
                  SortExpression="LastDateChanged">
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LastDateChanged") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastDateChanged","{0:MM/dd/yyyy}")%>'></asp:Label>
                  </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />
              </asp:TemplateField>
              <asp:BoundField DataField="ChangedBy" HeaderText="Changed By" 
                  SortExpression="ChangedBy" >
              <ItemStyle HorizontalAlign="Left" />
              </asp:BoundField>
          </Columns>
          <FooterStyle BackColor="#CCCCCC" />
          <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#808080" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#383838" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT * FROM [PaymentDeadlineTBL]"></asp:SqlDataSource>
      <br />
      <br />
      Current 
      Deadline of Payment:&nbsp;&nbsp;&nbsp;
      <asp:TextBox ID="TextBox2" runat="server" Width="90px" ReadOnly="True"></asp:TextBox>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
          SelectCommand="SELECT TOP (1) NoDays FROM PaymentDeadlineTBL ORDER BY Id DESC">
      </asp:SqlDataSource>
      <br />
      <br />
      New Deadline of Payment:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox ID="TextBox3" runat="server" Width="90px"></asp:TextBox>
      <br />
      <br />
      <asp:Button ID="Button1" runat="server" Text="CHANGE" onclick="Button1_Click" 
          PostBackUrl="~/Maintenance/Deadline.aspx" />
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>"          
          InsertCommand="INSERT INTO [PaymentDeadlineTBL] ([NoDays]) VALUES (@NoDays)">          
          <InsertParameters>
              <asp:ControlParameter ControlID="TextBox3" PropertyName="Text" Name="NoDays" Type="Int32" />
          </InsertParameters>          
      </asp:SqlDataSource>
  </fieldset>
  </div>
<div id="sidebar" style="height: 200px">

          <br />
          <br />

      </div>
</div>
</asp:Content>

