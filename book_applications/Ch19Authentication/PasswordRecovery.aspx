<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PasswordRecovery.aspx.vb" Inherits="PasswordRecovery" %>

<asp:Content ID="main" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>Welcome to the Halloween Store</h1>

    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
        <MailDefinition From="support@murach.com">
        </MailDefinition>
    </asp:PasswordRecovery>
</asp:Content>