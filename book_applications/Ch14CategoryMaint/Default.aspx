<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 14: Category Maintenance</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <h1>Category Maintenance</h1>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="CategoryID" 
            DataSourceID="SqlDataSource1" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="CategoryID" HeaderText="ID" 
                    ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ShortName" HeaderText="Short Name" 
                    SortExpression="ShortName" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="LongName" HeaderText="Long Name" 
                    SortExpression="LongName" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" CausesValidation="False" 
                    ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" CausesValidation="False" 
                    ShowDeleteButton="True" />
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
            <EditRowStyle BackColor="#F46D11" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [CategoryID], [ShortName], [LongName] 
                FROM [Categories]" 
            DeleteCommand="DELETE FROM [Categories] 
                WHERE [CategoryID] = @original_CategoryID 
                  AND [ShortName] = @original_ShortName 
                  AND [LongName] = @original_LongName" 
            InsertCommand="INSERT INTO [Categories] 
                ([CategoryID], [ShortName], [LongName]) 
                VALUES (@CategoryID, @ShortName, @LongName)" 
            UpdateCommand="UPDATE [Categories] 
                  SET [ShortName] = @ShortName, 
                      [LongName] = @LongName 
                WHERE [CategoryID] = @original_CategoryID 
                  AND [ShortName] = @original_ShortName 
                  AND [LongName] = @original_LongName">
            <DeleteParameters>
                <asp:Parameter Name="original_CategoryID" Type="String" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_LongName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="String" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
                <asp:Parameter Name="original_CategoryID" Type="String" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_LongName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <p>To create a new category, enter the category information and click Add New Category.</p>
        <p>
            <asp:Label ID="lblError" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <label>ID:</label>
        <asp:TextBox ID="txtID" runat="server" MaxLength="10" CssClass="entry">
        </asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" ControlToValidate="txtID" CssClass="validator"  
                ErrorMessage="ID is a required field.">
            </asp:RequiredFieldValidator><br />
        <label>Short Name:</label>
        <asp:TextBox ID="txtShortName" runat="server" MaxLength="15" CssClass="entry">
        </asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                runat="server" ControlToValidate="txtShortName" CssClass="validator" 
                ErrorMessage="Short Name is a required field.">
            </asp:RequiredFieldValidator><br />
        <label>Long Name:</label>
        <asp:TextBox ID="txtLongName" runat="server" MaxLength="50" CssClass="entry">
        </asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                runat="server" ControlToValidate="txtLongName" CssClass="validator"
                ErrorMessage="Long Name is a required field.">
            </asp:RequiredFieldValidator><br />
        <asp:Button ID="btnAdd" runat="server" Text="Add New Category" />
    </form>
    </section>
</body>
</html>