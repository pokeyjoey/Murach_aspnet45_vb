<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="Order" %>

<asp:Content ID="main" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>Order Page</h1>
    <h2>All users can access this page</h2>

    <p>
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                You are logged in<br />
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </LoggedInTemplate>
            <AnonymousTemplate>
                You are not logged in<br />
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </AnonymousTemplate>
        </asp:LoginView>
    </p>

</asp:Content>