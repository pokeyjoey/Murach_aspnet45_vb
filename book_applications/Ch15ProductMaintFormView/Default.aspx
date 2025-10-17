<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  <title>Chapter 15: Product Maintenance (FormView)</title>
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
            <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="LightGray" ForeColor="Black" />
            <SelectedRowStyle BackColor="#F46D11" ForeColor="White" />
            <PagerStyle BackColor="Gray" ForeColor="White"
                HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            SelectCommand="SELECT [ProductID], [Name], [CategoryID]
                FROM [Products] ORDER BY [ProductID]">
        </asp:SqlDataSource>
    </div>
    <div id="formview">
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="ProductID"
            DataSourceID="SqlDataSource2" Width="350px">
            <EditItemTemplate>
                <p class="label">Product ID:</p>
                <p class="display">
                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("ProductID") %>'>
                    </asp:Label>
                </p>
                <p class="label">Name:</p>
                <p class="entry">
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' 
                        Width="200px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtName" Display="Dynamic" 
                        ErrorMessage="Name is a required field." ForeColor="White">*
                    </asp:RequiredFieldValidator>
                </p>
                <p class="label">Short Description:</p>
                <p class="entry">
                     <asp:TextBox ID="txtShortDescription" runat="server" 
                         Text='<%# Bind("ShortDescription") %>' Width="200px" MaxLength="200">
                     </asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                         ControlToValidate="txtShortDescription" Display="Dynamic" 
                         ErrorMessage="Short Description is a required field." ForeColor="White">*
                     </asp:RequiredFieldValidator>
                </p>
                <p class="label">Long Description:</p>
                <p class="entry">
                   <asp:TextBox ID="txtLongDescription" runat="server" 
                       Text='<%# Bind("LongDescription") %>' Rows="5" TextMode="MultiLine" 
                       Width="200px" MaxLength="2000"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                       ControlToValidate="txtShortDescription" Display="Dynamic" 
                       ErrorMessage="Long Description is a required field." ForeColor="White">*
                   </asp:RequiredFieldValidator>
                </p>
                <p class="label">Category ID:</p>
                <p class="entry">
                    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource3" 
                        DataTextField="LongName" DataValueField="CategoryID" 
                        SelectedValue='<%# Bind("CategoryID") %>' Width="130px">
                    </asp:DropDownList>
                </p>
                <p class="label">Image File:</p>
                <p class="entry">
                    <asp:TextBox ID="txtImageFile" runat="server" Text='<%# Bind("ImageFile") %>' 
                        Width="125px" MaxLength="50"></asp:TextBox>
                </p>
                <p class="label">Unit Price:</p>
                <p class="entry">
                    <asp:TextBox ID="txtUnitPrice" runat="server" Text='<%# Bind("UnitPrice") %>' 
                        Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtUnitPrice" Display="Dynamic" 
                        ErrorMessage="Unit Price is a required field." ForeColor="White">*
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="txtUnitPrice" Display="Dynamic" 
                        ErrorMessage="Unit Price must be a decimal value greater than 0." 
                        ForeColor="White" Operator="GreaterThan" Type="Double" 
                        ValueToCompare="0.00">*</asp:CompareValidator>
                </p>
                <p class="label">On Hand:</p>
                <p class="entry">
                    <asp:TextBox ID="txtOnHand" runat="server" Text='<%# Bind("OnHand") %>' 
                        Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="txtOnHand" Display="Dynamic" 
                        ErrorMessage="On Hand is a required field." ForeColor="White">*
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" 
                        ControlToValidate="txtOnHand" Display="Dynamic" 
                        ErrorMessage="On Hand must be a positive integer." ForeColor="White" 
                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0">*
                    </asp:CompareValidator>
                </p>
                <p>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" ForeColor="White">
                    </asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ForeColor="White">
                    </asp:LinkButton>
                </p>
            </EditItemTemplate>
            <InsertItemTemplate>
                <p class="label">Product ID:</p>
                <p class="entry">
                    <asp:TextBox ID="txtID" runat="server" Text='<%# Bind("ProductID") %>' 
                        Width="100px" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtID" Display="Dynamic" 
                        ErrorMessage="Product ID is a required field." ForeColor="White">*
                    </asp:RequiredFieldValidator>
                </p>
                <p class="label">Name:</p>
                <p class="entry">
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' 
                        Width="200px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtName" Display="Dynamic" 
                        ErrorMessage="Name is a required field." ForeColor="White">*
                    </asp:RequiredFieldValidator>
                </p>
                <p class="label">Short Description:</p>
                <p class="entry">
                     <asp:TextBox ID="txtShortDescription" runat="server" 
                         Text='<%# Bind("ShortDescription") %>' Width="200px" MaxLength="200">
                     </asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                         ControlToValidate="txtShortDescription" Display="Dynamic" 
                         ErrorMessage="Short Description is a required field." ForeColor="White">*
                     </asp:RequiredFieldValidator>
                </p>
                <p class="label">Long Description:</p>
                <p class="entry">
                   <asp:TextBox ID="txtLongDescription" runat="server" 
                       Text='<%# Bind("LongDescription") %>' Rows="5" TextMode="MultiLine" 
                       Width="200px" MaxLength="2000"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                       ControlToValidate="txtShortDescription" Display="Dynamic" 
                       ErrorMessage="Long Description is a required field." ForeColor="White">*
                   </asp:RequiredFieldValidator>
                </p>
                <p class="label">Category ID:</p>
                <p class="entry">
                    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource3" 
                        DataTextField="LongName" DataValueField="CategoryID" 
                        SelectedValue='<%# Bind("CategoryID") %>' Width="130px">
                    </asp:DropDownList>
                </p>
                <p class="label">Image File:</p>
                <p class="entry">
                    <asp:TextBox ID="txtImageFile" runat="server" Text='<%# Bind("ImageFile") %>' 
                        Width="125" MaxLength="50"></asp:TextBox>
                </p>
                <p class="label">Unit Price:</p>
                <p class="entry">
                    <asp:TextBox ID="txtUnitPrice" runat="server" Text='<%# Bind("UnitPrice") %>' 
                        Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtUnitPrice" Display="Dynamic" 
                        ErrorMessage="Unit Price is a required field." ForeColor="White">*
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="txtUnitPrice" Display="Dynamic" 
                        ErrorMessage="Unit Price must be a decimal value greater than 0." 
                        ForeColor="White" Operator="GreaterThan" Type="Double" 
                        ValueToCompare="0.00">*</asp:CompareValidator>
                </p>
                <p class="label">On Hand:</p>
                <p class="entry">
                    <asp:TextBox ID="txtOnHand" runat="server" Text='<%# Bind("OnHand") %>' 
                        Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="txtOnHand" Display="Dynamic" 
                        ErrorMessage="On Hand is a required field." ForeColor="White">*
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" 
                        ControlToValidate="txtOnHand" Display="Dynamic" 
                        ErrorMessage="On Hand must be a positive integer." ForeColor="White" 
                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0">*
                    </asp:CompareValidator>
                </p>
                <p>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" ForeColor="White">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ForeColor="White">
                    </asp:LinkButton>
                </p>
            </InsertItemTemplate>
            <ItemTemplate>
                <p class="label">Product ID:</p>
                <p class="display">
                    <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>'>
                    </asp:Label>
                </p>
                <p class="label">Name:</p>
                <p class="display">
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'>
                    </asp:Label>
                </p>
                <p class="label">Short Description:</p>
                <p class="display">
                    <asp:Label ID="ShortDescriptionLabel" runat="server" 
                        Text='<%# Bind("ShortDescription") %>'> </asp:Label>
                </p>
                <p class="label">Long Description:</p>
                <p class="display">
                    <asp:Label ID="LongDescriptionLabel" runat="server" 
                        Text='<%# Bind("LongDescription") %>'> </asp:Label>
                </p>
                <p class="label">Category ID:</p>
                <p class="display">
                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>'>
                    </asp:Label>
                </p>
                <p class="label">Image File:</p>
                <p class="display">
                    <asp:Label ID="ImageFileLabel" runat="server" Text='<%# Bind("ImageFile") %>'>
                    </asp:Label>
                </p>
                <p class="label">Unit Price:</p>
                <p class="display">
                    <asp:Label ID="UnitPriceLabel" runat="server" 
                        Text='<%# Bind("UnitPrice", "{0:c}") %>'></asp:Label>
                </p>
                <p class="label">On Hand:</p>
                <p class="display">
                    <asp:Label ID="OnHandLabel" runat="server"
                        Text='<%# Bind("OnHand") %>'></asp:Label>
                </p>
                <p>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit">
                    </asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete">
                    </asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                        CommandName="New" Text="New">
                    </asp:LinkButton>
                </p>
            </ItemTemplate>
            <RowStyle BackColor="LightGray" ForeColor="Black" />
            <EditRowStyle BackColor="Gray" ForeColor="White" />
            <InsertRowStyle BackColor="Gray" ForeColor="White" />
        </asp:FormView>
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
        </p>
        <p>
          <asp:Label ID = "lblError" runat="server" EnableViewState="False" CssClass="error">
          </asp:Label>
        </p>
      </div>
  </form>
  </section>
</body>
</html>