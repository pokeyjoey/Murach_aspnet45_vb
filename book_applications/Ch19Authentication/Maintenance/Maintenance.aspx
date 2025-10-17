<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Maintenance.aspx.vb" Inherits="Maintenance_Maintenance" %>

<asp:Content ID="main" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>Maintenance</h1>
    (Only users associated with the Admin role can access this page)

    <p><asp:LinkButton ID="lbnCategories" runat="server">Maintain Categories</asp:LinkButton></p>
    <p><asp:LinkButton ID="lbnProducts" runat="server">Maintain Products</asp:LinkButton></p>
    
    <p><asp:LoginName ID="LoginName1" runat="server" FormatString="You are logged in as : {0}" /></p>
    <p><asp:LoginStatus ID="LoginStatus1" runat="server" /></p>

    <div id="message"><asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label></div>
</asp:Content>