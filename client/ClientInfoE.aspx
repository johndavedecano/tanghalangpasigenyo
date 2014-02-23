<%@ Page Title="Tanghalang Pasigueño" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientInfoE.aspx.cs" Inherits="client_ClientInfoE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .fields
        {
            float:right;
            width:180px;
            height: 20px;
            padding-bottom:10px;
        }
        .labels
        {
            float:left; 
            clear:both;
            width: 120px;
            height: 20px;
            padding-bottom:10px;
            color:ff3300;
        }

        .notif
        {
            color: #000000;
            font-family: "Book Antiqua";
            font-size: x-large;
        }
                
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="wrapper">
<div id="maincontent">
    <div class="notif">Client Information</div>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ClientId" 
        DataSourceID="SqlDataSource1" 
        onitemupdated="ListView1_ItemUpdated" 
        onitemcommand="ListView1_ItemCommand">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">
            <div style="width:400px;">
            <div class="labels"></div>
            <div class="fields">
            <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' Visible="False" />
            </div>
            <div class="labels">Last Name:</div>
            <div class="fields">
            <asp:TextBox ID="ClientLnameTextBox" runat="server" 
                Text='<%# Bind("ClientLname") %>' />
            </div>
            <div class="labels">Middle Name:</div>
            <div class="fields">
            <asp:TextBox ID="ClientMnameTextBox" runat="server" 
                Text='<%# Bind("ClientMname") %>' />
            </div>
            <div class="labels">First Name:</div>
            <div class="fields">
            <asp:TextBox ID="ClientFnameTextBox" runat="server" 
                Text='<%# Bind("ClientFname") %>' />
            </div>
            <div class="labels">Address:</div>
            <div class="fields">
            <asp:TextBox ID="ClientAddressTextBox" runat="server" 
                Text='<%# Bind("ClientAddress") %>' />
            </div>
            <div class="labels">Contact No:</div>
            <div class="fields">
            <asp:TextBox ID="ClientContactNoTextBox" runat="server" 
                Text='<%# Bind("ClientContactNo") %>' />
            </div>
            <div class="labels">Company:</div>
            <div class="fields">
            <asp:TextBox ID="ClientCompanyTextBox" runat="server" 
                Text='<%# Bind("ClientCompany") %>' />
            </div>
            <div class="labels"></div>
            <div class="fields">
            <asp:Label ID="ClientIdLabel1" runat="server" Text='<%# Eval("ClientId") %>' Visible="False" />
            </div>
            <div class="labels"></div>
            <div class="fields">
            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' Visible="False" />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            </div>
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div><asp:DataPager ID="DataPager1" runat="server" PageSize="1"></asp:DataPager>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ybaros_db_cs %>" 
        DeleteCommand="DELETE FROM [ClientTbl] WHERE [ClientId] = @ClientId" 
        InsertCommand="INSERT INTO [ClientTbl] ([UserId], [ClientLname], [ClientMname], [ClientFname], [ClientAddress], [ClientContactNo], [ClientCompany], [Status]) VALUES (@UserId, @ClientLname, @ClientMname, @ClientFname, @ClientAddress, @ClientContactNo, @ClientCompany, @Status)" 
        SelectCommand="SELECT * FROM [ClientTbl] WHERE ([ClientId] = @ClientId)" 
        UpdateCommand="UPDATE [ClientTbl] SET [UserId] = @UserId, [ClientLname] = @ClientLname, [ClientMname] = @ClientMname, [ClientFname] = @ClientFname, [ClientAddress] = @ClientAddress, [ClientContactNo] = @ClientContactNo, [ClientCompany] = @ClientCompany, [Status] = @Status WHERE [ClientId] = @ClientId">
        <DeleteParameters>
            <asp:Parameter Name="ClientId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="ClientLname" Type="String" />
            <asp:Parameter Name="ClientMname" Type="String" />
            <asp:Parameter Name="ClientFname" Type="String" />
            <asp:Parameter Name="ClientAddress" Type="String" />
            <asp:Parameter Name="ClientContactNo" Type="String" />
            <asp:Parameter Name="ClientCompany" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ClientId" QueryStringField="ClientId" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="ClientLname" Type="String" />
            <asp:Parameter Name="ClientMname" Type="String" />
            <asp:Parameter Name="ClientFname" Type="String" />
            <asp:Parameter Name="ClientAddress" Type="String" />
            <asp:Parameter Name="ClientContactNo" Type="String" />
            <asp:Parameter Name="ClientCompany" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="ClientId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</div>
<div id="sidebar"> 
<br />
    </div>


</div>

</asp:Content>

