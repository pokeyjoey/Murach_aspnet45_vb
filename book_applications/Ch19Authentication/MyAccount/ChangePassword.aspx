<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="MyAccount_ChangePassword" %>

<asp:Content ID="main" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>My Account</h1>

    <asp:ChangePassword ID="ChangePassword1" runat="server"
        CancelDestinationPageUrl="~/MyAccount/MyAccount.aspx" 
        ContinueDestinationPageUrl="~/MyAccount/MyAccount.aspx">
    </asp:ChangePassword>

</asp:Content>