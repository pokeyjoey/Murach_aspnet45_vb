<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 17: Customer List</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <asp:DropDownList ID="ddlStates" runat="server" AutoPostBack="True" 
            DataSourceID="ObjectDataSource1" DataTextField="StateName" 
            DataValueField="StateCode">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllStates" 
            TypeName="CustomerDB"></asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource2" 
            AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="LastName" HeaderText="Last Name">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="First Name">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetCustomersByState" TypeName="CustomerDB">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlStates" Name="state" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
    </section>
</body>
</html>