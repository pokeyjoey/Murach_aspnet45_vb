<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 23: Shopping Cart WCF Client</title>
    <link href="/Styles/Main.css" rel="stylesheet" />
</head>
<body>
    <header><img src="/Images/banner.jpg" alt="Halloween Store" /></header>
    <form id="form1" runat="server">
        <section>
            <h1>Edit Categories</h1>
            <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" DataSourceID="ddlDataSource" 
                DataTextField="LongName" DataValueField="CategoryID">
            </asp:DropDownList><br /><br />
            <asp:ObjectDataSource runat="server" ID="ddlDataSource" SelectMethod="GetCategories" 
                TypeName="CategoryService.CategoryServiceClient">
            </asp:ObjectDataSource>

            <asp:DetailsView ID="dvCategory" runat="server" DataKeyNames="CategoryID" Height="75px" Width="250px" AutoGenerateRows="False" 
                DataSourceID="detailsDataSource">
                <Fields>
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID"></asp:BoundField>
                    <asp:BoundField DataField="ShortName" HeaderText="ShortName" SortExpression="ShortName"></asp:BoundField>
                    <asp:BoundField DataField="LongName" HeaderText="LongName" SortExpression="LongName"></asp:BoundField>
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                </Fields>
            </asp:DetailsView><br /><br />
            <asp:ObjectDataSource runat="server" ID="detailsDataSource" DataObjectTypeName="CategoryService.Category"
                DeleteMethod="DeleteCategory" InsertMethod="InsertCategory" SelectMethod="GetCategoryById"
                TypeName="CategoryService.CategoryServiceClient" UpdateMethod="UpdateCategory">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategories" PropertyName="SelectedValue" 
                        Name="id" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </section>
    </form>
</body>
</html>
