<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 16: Product List</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" 
            DataSourceID="SqlDataSource1">
            <LayoutTemplate>
                <p id="product">Product</p>
                <div id="itemPlaceholderContainer" runat="server">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div id="pager">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" 
                                ShowFirstPageButton="True" ShowLastPageButton="True" 
                                FirstPageText="&lt;&lt;" PreviousPageText="&lt;" 
                                NextPageText="&gt;" LastPageText="&gt;&gt;" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div id="itemtemplate">
                    <p class="name">
                        <asp:Label ID="NameLabel" runat="server" 
                            Text='<%# Eval("Name") %>' />
                    </p>
                    <div class="info">
                        <p class="label">Category:</p>
                        <p class="control">
                            <asp:Label ID="CategoryLabel" runat="server" 
                                Text='<%# Eval("Category") %>' />
                        </p>
                        <p class="label">ShortDescription:</p>
                        <p class="control">
                            <asp:Label ID="ShortDescriptionLabel" runat="server" 
                                Text='<%# Eval("ShortDescription") %>' />
                        </p>
                        <p class="label"> LongDescription:</p>
                        <p class="control">
                            <asp:Label ID="LongDescriptionLabel" runat="server" 
                                Text='<%# Eval("LongDescription") %>' />
                        </p>
                        <p class="label">UnitPrice:</p>
                        <p class="control">
                            <asp:Label ID="UnitPriceLabel" runat="server" 
                                Text='<%# Eval("UnitPrice", "{0:c}") %>' />
                        </p>
                        <p class="label">OnHand:</p>
                        <p class="control">
                            <asp:Label ID="OnHandLabel" runat="server" 
                                Text='<%# Eval("OnHand") %>' />
                        </p>
                    </div>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div id="alternatetemplate">
                    <p class="name">
                        <asp:Label ID="NameLabel" runat="server" 
                            Text='<%# Eval("Name") %>' />
                    </p>
                    <div class="info">
                        <p class="label">Category:</p>
                        <p class="control">
                        <asp:Label ID="CategoryLabel" runat="server" 
                            Text='<%# Eval("Category") %>' />
                        </p>
                        <p class="label">ShortDescription:</p>
                        <p class="control">
                        <asp:Label ID="ShortDescriptionLabel" runat="server" 
                            Text='<%# Eval("ShortDescription") %>' />
                        </p>
                        <p class="label"> LongDescription:</p>
                        <p class="control">
                        <asp:Label ID="LongDescriptionLabel" runat="server" 
                            Text='<%# Eval("LongDescription") %>' />
                        </p>
                        <p class="label">UnitPrice:</p>
                        <p class="control">
                        <asp:Label ID="UnitPriceLabel" runat="server" 
                            Text='<%# Eval("UnitPrice", "{0:c}") %>' />
                        </p>
                        <p class="label">OnHand:</p>
                        <p class="control">
                        <asp:Label ID="OnHandLabel" runat="server" 
                            Text='<%# Eval("OnHand") %>' />
                        </p>
                    </div>
                </div>
            </AlternatingItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT Products.ProductID, Products.Name, 
                Categories.LongName AS Category, Products.ShortDescription, 
                Products.LongDescription, Products.UnitPrice, Products.OnHand 
                FROM Products INNER JOIN Categories 
                ON Products.CategoryID = Categories.CategoryID 
                ORDER BY Products.Name">
        </asp:SqlDataSource>
    </form>
    </section>
</body>
</html>