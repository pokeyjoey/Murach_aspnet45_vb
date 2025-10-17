<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="main" ContentPlaceHolderID="formPlaceholder" Runat="Server">

    <h1>Welcome to the Halloween Store</h1>
    <asp:Login ID="Login1" runat="server" 
        CreateUserText="Create A New Account" 
        CreateUserUrl="~/CreateUser.aspx" 
        PasswordRecoveryText="Forgot My Password" 
        PasswordRecoveryUrl="~/PasswordRecovery.aspx" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt">
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
    </asp:Login>

</asp:Content>