<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  <title>Chapter 15: Product Maintenance</title>
  <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
      <div id="gridview">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
            DataKeyNames="ProductID" DataSourceID="SqlDataSource1"
            AutoGenerateColumns="False" SelectedIndex="0"
            CellPadding="4" GridLines="None" ForeColor="Black" Width="320px">
          <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID"
                ReadOnly="True">
              <HeaderStyle HorizontalAlign="Left" />
              <ItemStyle Width="75px" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name">
              <HeaderStyle HorizontalAlign="Left" />
              <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="CategoryID" HeaderText="Category" >
              <HeaderStyle HorizontalAlign="Left" />
              <ItemStyle Width="95px" />
            </asp:BoundField>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
          </Columns>
          <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <RowStyle BackColor="White" ForeColor="Black" />
          <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
          <SelectedRowStyle BackColor="#F46D11" ForeColor="White" />
          <PagerStyle BackColor="#1C5E55" ForeColor="White"
              HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            SelectCommand="SELECT [ProductID], [Name], [CategoryID]
                FROM [Products] ORDER BY [ProductID]">
        </asp:SqlDataSource>
      </div>
      <div id="detailsview">
        <asp:DetailsView ID="DetailsView1" runat="server"
            DataSourceID="SqlDataSource2"  DataKeyNames="ProductID"
            Height="50px" Width="350px" AutoGenerateRows="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" 
            BorderWidth="2px" CellPadding="3" CellSpacing="1" 
            GridLines="None">
          <Fields>
            <asp:TemplateField HeaderText="Product ID:">
              <ItemTemplate>
                <asp:Label ID="Label4" runat="server"
                    Text='<%# Bind("ProductID") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:Label ID="Label1" runat="server"
                    Text='<%# Eval("ProductID") %>'></asp:Label>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="txtID" runat="server"
                    Text='<%# Bind("ProductID") %>' Width="100px"
                    MaxLength="10">
                </asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtID" 
                    ErrorMessage="Product ID is a required field.">*
                </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name:">
              <ItemTemplate>
                <asp:Label ID="Label8" runat="server"
                    Text='<%# Bind("Name") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox ID="txtName" runat="server"
                    Text='<%# Bind("Name") %>' Width="200px" MaxLength="50">
                </asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtName" 
                    ErrorMessage="Name is a required field.">*
                </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="txtName" runat="server"
                    Text='<%# Bind("Name") %>' Width="200px" MaxLength="50">
                </asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtName"  
                    ErrorMessage="Name is a required field.">*
                </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Short Description:">
              <ItemTemplate>
                <asp:Label ID="Label1" runat="server"
                    Text='<%# Bind("ShortDescription") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox ID="txtShortDescription" runat="server" 
                    Text='<%# Bind("ShortDescription") %>'
                    Width="200px" MaxLength="200">
                </asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtShortDescription"
                    ErrorMessage="Short Description is a required field.">*
                </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="txtShortDescription" runat="server" 
                    Text='<%# Bind("ShortDescription") %>' Width="200px" 
                    MaxLength="200">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                    runat="server" ControlToValidate="txtShortDescription"
                    ErrorMessage="Short Description is a required field.">*
                </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Long Description:">
              <ItemTemplate>
                <asp:Label ID="Label2" runat="server"
                    Text='<%# Bind("LongDescription") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox ID="txtLongDescription" runat="server" Rows="5" 
                    Text='<%# Bind("LongDescription") %>' TextMode="MultiLine" 
                    Width="200px" MaxLength="2000">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                    runat="server" ControlToValidate="txtLongDescription"
                    ErrorMessage="Long Description is a required field.">*
                </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="txtLongDescription" runat="server" Rows="5" 
                    Text='<%# Bind("LongDescription") %>' TextMode="MultiLine" 
                    Width="200px" MaxLength="2000">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                    runat="server" ControlToValidate="txtLongDescription"
                    ErrorMessage="Long Description is a required field.">*
                </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category:">
              <ItemTemplate>
                <asp:Label ID="Label3" runat="server"
                    Text='<%# Bind("CategoryID") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:DropDownList ID="ddlCategory" runat="server"
                    DataSourceID="SqlDataSource3" 
                    DataTextField="LongName" DataValueField="CategoryID" 
                    SelectedValue='<%# Bind("CategoryID") %>' Width="130px">
                </asp:DropDownList>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:DropDownList ID="ddlCategory" runat="server"
                    DataSourceID="SqlDataSource3" 
                    DataTextField="LongName" DataValueField="CategoryID" 
                    SelectedValue='<%# Bind("CategoryID") %>' Width="130px">
                </asp:DropDownList>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image File:">
              <ItemTemplate>
                <asp:Label ID="Label7" runat="server"
                    Text='<%# Bind("ImageFile") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox ID="txtImage" runat="server"
                    Text='<%# Bind("ImageFile") %>' Width="125px" MaxLength="30">
                </asp:TextBox>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="txtImage" runat="server"
                    Text='<%# Bind("ImageFile") %>' Width="125px" MaxLength="30">
                </asp:TextBox>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price:">
              <ItemTemplate>
                <asp:Label ID="Label5" runat="server"
                    Text='<%# Bind("UnitPrice", "{0:c}") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox ID="txtUnitPrice" runat="server"
                    Text='<%# Bind("UnitPrice") %>' Width="75px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                    runat="server" ControlToValidate="txtUnitPrice"
                    ErrorMessage="Unit Price is a required field.">*
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtUnitPrice"  
                    ErrorMessage="Unit Price must be a decimal value
                    greater than 0." Operator="GreaterThan"
                    Type="Double" ValueToCompare="0.00">*</asp:CompareValidator>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="txtUnitPrice" runat="server" 
                    Text='<%# Bind("UnitPrice") %>' Width="75px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                    runat="server" ControlToValidate="txtUnitPrice"
                    ErrorMessage="Unit Price is a required field.">*
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtUnitPrice" 
                    ErrorMessage="Unit price must be a decimal value
                    greater than 0." Operator="GreaterThan"
                    Type="Double" ValueToCompare="0">*</asp:CompareValidator>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="On Hand:">
              <ItemTemplate>
                <asp:Label ID="Label6" runat="server"
                    Text='<%# Bind("OnHand") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox ID="txtOnHand" runat="server"
                    Text='<%# Bind("OnHand") %>' Width="75px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                    runat="server" ControlToValidate="txtOnHand"
                    ErrorMessage="On Hand is a required field.">*
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="txtOnHand" 
                    ErrorMessage="On Hand must be a positive integer."
                    Operator="GreaterThanEqual"
                    Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="txtOnHand" runat="server"
                    Text='<%# Bind("OnHand") %>' Width="75px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                    runat="server" ControlToValidate="txtOnHand"
                    ErrorMessage="On Hand is a required field.">*
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator4" runat="server" 
                    ControlToValidate="txtOnHand" 
                    ErrorMessage="On Hand must be a positive integer."
                    Operator="GreaterThanEqual"
                    Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
              </InsertItemTemplate>
              <HeaderStyle HorizontalAlign="Left" Width="130px" />
              <ItemStyle Width="220px" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" 
                ShowDeleteButton="True" 
                ShowEditButton="True"
                ShowInsertButton="True" />
          </Fields>
          <RowStyle BackColor="#E3EAEB" ForeColor="Black" />
          <EditRowStyle BackColor="#1C5E55" ForeColor="White" />
          <FooterStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT [ProductID], [Name], [ShortDescription],
                  [LongDescription], [CategoryID], [ImageFile], 
                  [UnitPrice], [OnHand]
                FROM [Products] 
                WHERE ([ProductID] = @ProductID)"
            DeleteCommand="DELETE FROM [Products]
                WHERE [ProductID] = @original_ProductID
                  AND [Name] = @original_Name 
                  AND [ShortDescription] = @original_ShortDescription 
                  AND [LongDescription] = @original_LongDescription 
                  AND [CategoryID] = @original_CategoryID 
                  AND (([ImageFile] = @original_ImageFile) 
                   OR (ImageFile IS NULL AND @original_ImageFile IS NULL))
                  AND [UnitPrice] = @original_UnitPrice 
                  AND [OnHand] = @original_OnHand"
            InsertCommand="INSERT INTO [Products] ([ProductID], [Name],
                  [ShortDescription], [LongDescription], [CategoryID], 
                  [ImageFile], [UnitPrice], [OnHand]) 
                VALUES (@ProductID, @Name, @ShortDescription,
                  @LongDescription, @CategoryID, @ImageFile, 
                  @UnitPrice, @OnHand)"
            UpdateCommand="UPDATE [Products] SET [Name] = @Name,
                  [ShortDescription] = @ShortDescription, 
                  [LongDescription] = @LongDescription, 
                  [CategoryID] = @CategoryID, 
                  [ImageFile] = @ImageFile, 
                  [UnitPrice] = @UnitPrice, 
                  [OnHand] = @OnHand 
                WHERE [ProductID] = @original_ProductID 
                  AND [Name] = @original_Name 
                  AND [ShortDescription] = @original_ShortDescription 
                  AND [LongDescription] = @original_LongDescription 
                  AND [CategoryID] = @original_CategoryID 
                  AND (([ImageFile] = @original_ImageFile) 
                   OR (ImageFile IS NULL AND @original_ImageFile IS NULL))
                  AND [UnitPrice] = @original_UnitPrice 
                  AND [OnHand] = @original_OnHand">
            <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="ProductID"
                  PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <DeleteParameters>
              <asp:Parameter Name="original_ProductID" Type="String" />
              <asp:Parameter Name="original_Name" Type="String" />
              <asp:Parameter Name="original_ShortDescription" Type="String" />
              <asp:Parameter Name="original_LongDescription" Type="String" />
              <asp:Parameter Name="original_CategoryID" Type="String" />
              <asp:Parameter Name="original_ImageFile" Type="String" />
              <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
              <asp:Parameter Name="original_OnHand" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
              <asp:Parameter Name="Name" Type="String" />
              <asp:Parameter Name="ShortDescription" Type="String" />
              <asp:Parameter Name="LongDescription" Type="String" />
              <asp:Parameter Name="CategoryID" Type="String" />
              <asp:Parameter Name="ImageFile" Type="String" />
              <asp:Parameter Name="UnitPrice" Type="Decimal" />
              <asp:Parameter Name="OnHand" Type="Int32" />
              <asp:Parameter Name="original_ProductID" Type="String" />
              <asp:Parameter Name="original_Name" Type="String" />
              <asp:Parameter Name="original_ShortDescription" Type="String" />
              <asp:Parameter Name="original_LongDescription" Type="String" />
              <asp:Parameter Name="original_CategoryID" Type="String" />
              <asp:Parameter Name="original_ImageFile" Type="String" />
              <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
              <asp:Parameter Name="original_OnHand" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
              <asp:Parameter Name="ProductID" Type="String" />
              <asp:Parameter Name="Name" Type="String" />
              <asp:Parameter Name="ShortDescription" Type="String" />
              <asp:Parameter Name="LongDescription" Type="String" />
              <asp:Parameter Name="CategoryID" Type="String" />
              <asp:Parameter Name="ImageFile" Type="String" />
              <asp:Parameter Name="UnitPrice" Type="Decimal" />
              <asp:Parameter Name="OnHand" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT [CategoryID], [LongName] FROM [Categories] 
                ORDER BY [LongName]"> 
        </asp:SqlDataSource>
        <p>
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            HeaderText="Please correct the following errors:" CssClass="error" />
        <p><asp:Label ID = "lblError" runat="server" EnableViewState="False" CssClass="error"></asp:Label></p>
      </div>
    </form>
    </section>
</body>
</html>