<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" 
    CodeFile="Order.aspx.vb" Inherits="Order" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">  
    <link href="Styles/Order.css" rel="stylesheet" />    
</asp:Content>

<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <label>Please select a product:&nbsp;</label>
    <asp:DropDownList ID="ddlProducts" runat="server"
        AutoPostBack="True" DataSourceID="SqlDataSource1"
        DataTextField="Name" DataValueField="ProductID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
        SelectCommand="SELECT [ProductID], [Name] FROM [Products]
            ORDER BY [Name]">
    </asp:SqlDataSource>
    <div id="productData">
        <asp:FormView ID="FormView1" runat="server"
            DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <div id="product">
                    <asp:Label ID="lblName" runat="server"
                        Text='<%# Bind("Name") %>' >
                    </asp:Label>
                    <asp:Label ID="lblShortDescription" runat="server"
                        Text='<%# Bind("ShortDescription") %>'>
                    </asp:Label>
                    <asp:Label ID="lblLongDescription" runat="server"
                        Text='<%# Bind("LongDescription") %>'>
                    </asp:Label>
                    <asp:Label ID="lblUnitPrice" runat="server"
                        Text='<%# Bind("UnitPrice", "{0:c} each") %>'>
                    </asp:Label>
                </div>
                <asp:Image ID="imgProduct" runat="server" width="200px"
                    ImageUrl='<%# Bind("ImageFile", "Images/Products/{0}") %>' />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            SelectCommand="SELECT [ProductID], [Name], [ShortDescription],
                [LongDescription], [ImageFile], [UnitPrice] 
                FROM [Products] 
                WHERE ([ProductID] = @ProductID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProducts" Name="ProductID"
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div id="order">
        <p id="quantity">
            <asp:Label ID="Label2" runat="server" Text="Quantity:"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtQuantity" Display="Dynamic" 
                ErrorMessage="Quantity is a required field." 
                CssClass="validator">
            </asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ControlToValidate="txtQuantity" Display="Dynamic" 
                ErrorMessage="Quantity must range from 1 to 500."
                MaximumValue="500" MinimumValue="1" Type="Integer" 
                CssClass="validator">
            </asp:RangeValidator>
        </p>
        <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" 
            CssClass="button" />
        <asp:Button ID="Button1" runat="server"  Text="Go to Cart"
            CausesValidation="False" PostBackUrl="~/Cart.aspx" CssClass="button" />
    </div>
</asp:Content>