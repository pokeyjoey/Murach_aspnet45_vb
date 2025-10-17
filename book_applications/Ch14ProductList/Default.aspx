<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 14: Product List</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <asp:GridView ID="grdProducts" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="ProductID" 
            DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="8"
            AllowSorting="True" CellPadding="4" ForeColor="Black" GridLines="None">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ProductID">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="75px" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="CategoryID" HeaderText="Category" 
                    SortExpression="CategoryID, Name" />
                <asp:BoundField DataField="UnitPrice"
                    HeaderText="Unit Price" DataFormatString="{0:c}">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="OnHand" HeaderText="On Hand">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
            <PagerStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" Font-Bold="True" />
            <PagerSettings Mode="NumericFirstLast" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT [ProductID], [Name], [CategoryID], [UnitPrice], [OnHand] FROM [Products]">
        </asp:SqlDataSource>
    </form>
    </section>
</body>
</html>
