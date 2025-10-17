<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Theme="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 17: Product List with Sorting and Paging</title>
    <link href="App_Themes/Default/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
       <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <asp:GridView ID="grdProducts" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="ProductID" 
            DataSourceID="ObjectDataSource1" AllowPaging="True" PageSize="8" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ID" 
                    ReadOnly="True" SortExpression="ProductID">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="75px" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" 
                    SortExpression="Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="CategoryID" HeaderText="Category" 
                    SortExpression="CategoryID, Name" />
                <asp:BoundField DataField="UnitPrice"
                    HeaderText="Unit Price" DataFormatString="{0:c}">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="OnHand" HeaderText="On Hand">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetProducts" TypeName="ProductDB" 
            EnablePaging="true" StartRowIndexParameterName="startIndex" 
            SelectCountMethod="SelectCount" MaximumRowsParameterName="maxRows" 
            SortParameterName="sortOrder">
        </asp:ObjectDataSource>
    </form>
    </section>
</body>
</html>