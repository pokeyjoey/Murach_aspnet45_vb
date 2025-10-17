<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <link href='<%= ResolveUrl("~/Styles/Home.css") %>' rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>Our Most Popular Products</h1>
    <div class="product">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Products/cat1.jpg" AlternateText="Deranged Cat" /><br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Shopping/Order/cat01">Deranged Cat</asp:HyperLink>
    </div>
    <div class="product">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Products/hippie1.jpg" AlternateText="Hippie" /><br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Shopping/Order/hippie01">Hippie</asp:HyperLink>
    </div>
    <div class="product">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Products/vader1.jpg" AlternateText="Darth Vader" /><br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Shopping/Order/vader01">Darth Vader</asp:HyperLink>
    </div>
    <div class="product">
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Products/cool1.jpg" AlternateText="Flying Bats" /><br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Shopping/Order/bats01">Flying Bats</asp:HyperLink>
    </div><br /><br />
    <div id="goto">
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Shopping/Order">Go to Orders page</asp:HyperLink>
    </div>
    
</asp:Content>