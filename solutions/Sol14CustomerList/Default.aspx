<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 14: Customer List</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <asp:GridView ID="grdCustomers" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="175px" />
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="State" HeaderText="State" 
                    SortExpression="State, City">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="75px" />
                </asp:BoundField>
                <asp:BoundField DataField="City" HeaderText="City">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NextPreviousFirstLast" />
            <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT [FirstName], [LastName], [State], [City] FROM [Customers] ORDER BY [LastName]">
        </asp:SqlDataSource>
    </form>
    </section>
</body>
</html>
