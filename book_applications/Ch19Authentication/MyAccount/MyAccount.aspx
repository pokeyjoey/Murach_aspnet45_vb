<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MyAccount.aspx.vb" Inherits="MyAccount_MyAccount" %>

<asp:Content ID="main" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>My Account</h1>
    (Only authenticated users can access this page)

    <p><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MyAccount/ChangePassword.aspx">Change Password</asp:HyperLink></p>

    <p><asp:LinkButton ID="lbnTrack" runat="server">Track Packages</asp:LinkButton></p>

    <p><asp:LinkButton ID="lbnBilling" runat="server">Change Billing Address</asp:LinkButton></p>

    <p><asp:LinkButton ID="lbnShipping" runat="server">Change Shipping Address</asp:LinkButton></p>

    <p><asp:LinkButton ID="lbnPref" runat="server">Change Preferences</asp:LinkButton></p>

    <p>
        <asp:LoginName ID="LoginName1" runat="server"
        FormatString="You are logged in as : {0}" />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </p>

    <div id="message"><asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label></div>
</asp:Content>