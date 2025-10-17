<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Theme="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 17: Category Maintenance</title>
    <link href="App_Themes/Default/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <h1>Category Maintenance</h1>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="CategoryID" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:BoundField DataField="CategoryID" HeaderText="ID" ReadOnly="True">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ShortName" HeaderText="Short Name">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="LongName" HeaderText="Long Name">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="Category" 
            DeleteMethod="DeleteCategory" InsertMethod="InsertCategory" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategories" 
            TypeName="CategoryDB" UpdateMethod="UpdateCategory" ConflictDetection="CompareAllValues">
            <UpdateParameters>
                <asp:Parameter Name="original_Category" Type="Object" />
                <asp:Parameter Name="category" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <p id="new">To create a new category, enter the category information and click Insert.</p>
        <p>
            <asp:Label ID="lblError" runat="server" EnableViewState="False">
            </asp:Label>
        </p>
        <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" DataSourceID="ObjectDataSource1" 
            DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="CategoryID" HeaderText="Category ID:" 
                    SortExpression="CategoryID" />
                <asp:BoundField DataField="ShortName" HeaderText="Short Name:" 
                    SortExpression="ShortName" />
                <asp:BoundField DataField="LongName" HeaderText="Long Name:" 
                    SortExpression="LongName" />
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </form>
    </section>
</body>
</html>
