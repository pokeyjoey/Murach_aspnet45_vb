<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 13: Invoice Line Items</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1
        {
            width: 400px;
        }
        .col-left
        {
            width: 100px;
        }
        .col-right
        {
            width: 100px;
            text-align: right;
        }
    </style>
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <label>Choose an Invoice:&nbsp;</label>
        <asp:DropDownList ID="ddlInvoice" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="InvoiceNumber" DataValueField="InvoiceNumber" 
            AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT [InvoiceNumber] FROM [Invoices] WHERE ([Total] &gt; @Total)">
            <SelectParameters>
                <asp:Parameter DefaultValue="300" Name="Total" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />
        <asp:DataList ID="dlLineItems" runat="server" DataSourceID="SqlDataSource2" 
            CellPadding="4" ForeColor="#333333">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="col-left">
                            Product</td>
                        <td class="col-right">
                            Unit Price</td>
                        <td class="col-right">
                            Quantity</td>
                        <td class="col-right">
                            Extension</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="col-left">
                            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                        </td>
                        <td class="col-right">
                            <asp:Label ID="UnitPriceLabel" runat="server" 
                                Text='<%# Eval("UnitPrice", "{0:C}") %>' />
                        </td>
                        <td class="col-right">
                            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        </td>
                        <td class="col-right">
                            <asp:Label ID="ExtensionLabel" runat="server" 
                                Text='<%# Eval("Extension", "{0:C}") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT [ProductID], [UnitPrice], [Quantity], [Extension] FROM [LineItems] WHERE ([InvoiceNumber] = @InvoiceNumber)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlInvoice" Name="InvoiceNumber" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    </section>
</body>
</html>