<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Menu.aspx.vb" Inherits="Menu" %>

<asp:Content ID="main" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>Menu</h1>

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Order.aspx">Order a Product</asp:HyperLink><br />
        (All users including anonymous users)<br /><br />

    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/MyAccount/MyAccount.aspx">Edit My Account</asp:HyperLink><br />
        (All authenticated users)<br /><br />

    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Maintenance/Maintenance.aspx">Maintain Data Tables</asp:HyperLink><br />
        (Only users associated with the Admin role)

</asp:Content>