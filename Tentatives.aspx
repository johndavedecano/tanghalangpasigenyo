<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Tentatives.aspx.cs" Inherits="Tentatives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset>
<legend> Tentative Reservations </legend>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ReservationId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="Reservation Id" InsertVisible="False" 
                SortExpression="ReservationId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ReservationId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReservationId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="VenueId" HeaderText="Service Id" 
                SortExpression="VenueId" />
            <asp:BoundField DataField="NameofEvent" HeaderText="Name of Event" 
                SortExpression="NameofEvent" />
            <asp:TemplateField HeaderText="Reservation Date" 
                SortExpression="ReservationDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReservationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReservationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ReservationStartTime" 
                HeaderText="Reservation Start Time" SortExpression="ReservationStartTime" />
            <asp:BoundField DataField="NumberofHours" HeaderText="No. of Hours" 
                SortExpression="NumberofHours" />
            <asp:BoundField DataField="letterurl" HeaderText="letterurl" 
                SortExpression="letterurl" />
            <asp:BoundField DataField="ClientId" HeaderText="Client Id" 
                SortExpression="ClientId" />
            <asp:HyperLinkField DataNavigateUrlFields="letterurl" 
                DataNavigateUrlFormatString="letterdownload.aspx?letterurl={0}" 
                HeaderText="Letter of Intent" Text="Download" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [ReservationTBL] WHERE [ReservationId] = @ReservationId" 
        InsertCommand="INSERT INTO [ReservationTBL] ([VenueId], [NameofEvent], [ReservationDate], [ReservationStartTime], [NumberofHours], [letterurl], [ClientId]) VALUES (@VenueId, @NameofEvent, @ReservationDate, @ReservationStartTime, @NumberofHours, @letterurl, @ClientId)" 
        SelectCommand="SELECT [ReservationId], [VenueId], [NameofEvent], [ReservationDate], [ReservationStartTime], [NumberofHours], [letterurl], [ClientId] FROM [ReservationTBL]" 
        UpdateCommand="UPDATE [ReservationTBL] SET [VenueId] = @VenueId, [NameofEvent] = @NameofEvent, [ReservationDate] = @ReservationDate, [ReservationStartTime] = @ReservationStartTime, [NumberofHours] = @NumberofHours, [letterurl] = @letterurl, [ClientId] = @ClientId WHERE [ReservationId] = @ReservationId">
        <DeleteParameters>
            <asp:Parameter Name="ReservationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VenueId" Type="Int32" />
            <asp:Parameter Name="NameofEvent" Type="String" />
            <asp:Parameter DbType="Date" Name="ReservationDate" />
            <asp:Parameter DbType="Time" Name="ReservationStartTime" />
            <asp:Parameter Name="NumberofHours" Type="Int32" />
            <asp:Parameter Name="letterurl" Type="String" />
            <asp:Parameter Name="ClientId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="VenueId" Type="Int32" />
            <asp:Parameter Name="NameofEvent" Type="String" />
            <asp:Parameter DbType="Date" Name="ReservationDate" />
            <asp:Parameter DbType="Time" Name="ReservationStartTime" />
            <asp:Parameter Name="NumberofHours" Type="Int32" />
            <asp:Parameter Name="letterurl" Type="String" />
            <asp:Parameter Name="ClientId" Type="Int32" />
            <asp:Parameter Name="ReservationId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</fieldset>
</asp:Content>

