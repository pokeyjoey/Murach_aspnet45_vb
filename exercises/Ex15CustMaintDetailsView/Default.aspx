<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Chapter 15: Customer Maintenance</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" "Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <div id="gridview">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                DataKeyNames="Email" DataSourceID="SqlDataSource1"
                AutoGenerateColumns="False" CellPadding="4" GridLines="None" 
                ForeColor="Black" Width="320px" >
                <Columns>
                    <asp:BoundField DataField="Email" HeaderText="Email"
                        ReadOnly="True" Visible="False">
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="LastName">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="120px" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="White" ForeColor="Black" />
                <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
                <SelectedRowStyle BackColor="#F46D11" ForeColor="White" />
                <PagerSettings Mode="NextPreviousFirstLast" />
                <PagerStyle BackColor="#1C5E55" ForeColor="White"
                    HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
                SelectCommand="SELECT [Email], [LastName], [FirstName] 
                               FROM [Customers] ORDER BY [LastName]">
            </asp:SqlDataSource>
        </div>
        <div id="detailsview">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please correct the following errors:" CssClass="error" />
            <p>
                <asp:Label ID = "lblError" runat="server" EnableViewState="False" CssClass="error">
                </asp:Label>
            </p>
        </div>
    </form>
    </section>
</body>
</html>
