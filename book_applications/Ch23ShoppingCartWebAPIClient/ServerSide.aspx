<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ServerSide.aspx.vb" Inherits="ServerSide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 23: Shopping Cart Web API Client</title>
    <link href="/Styles/Main.css" rel="stylesheet" />
</head>
<body>
    <header><img src="/Images/banner.jpg" alt="Halloween Store" /></header>
    <form id="form1" runat="server">
        <section>
            <h1>Categories</h1>
            <asp:GridView ID="grdCategories" runat="server"></asp:GridView>
        </section>
    </form>
</body>
</html>