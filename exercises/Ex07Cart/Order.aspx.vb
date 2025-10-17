Imports System.Data

Partial Class Order
    Inherits System.Web.UI.Page

    Private selectedProduct As Product

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'bind drop-down list on first load; get and show product data on every load        
        If Not IsPostBack Then ddlProducts.DataBind()
        If Trace.IsEnabled Then Trace.Warn("Binding products drop-down list")
        selectedProduct = Me.GetSelectedProduct
        lblName.Text = selectedProduct.Name
        lblShortDescription.Text = selectedProduct.ShortDescription
        lblLongDescription.Text = selectedProduct.LongDescription
        lblUnitPrice.Text = FormatCurrency(selectedProduct.UnitPrice) & " each"
        imgProduct.ImageUrl = "Images/Products/" & selectedProduct.ImageFile
    End Sub

    Private Function GetSelectedProduct() As Product
        'get row from DataSource control based on value in drop-down list
        Dim productsTable As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        productsTable.RowFilter = "ProductID = '" & ddlProducts.SelectedValue & "'"
        Dim row As DataRowView = CType(productsTable(0), DataRowView)

        'create a new product object and load with data from row
        Dim p As New Product
        p.ProductID = row("ProductID").ToString
        p.Name = row("Name").ToString
        p.ShortDescription = row("ShortDescription").ToString
        p.LongDescription = row("LongDescription").ToString
        p.UnitPrice = CDec(row("UnitPrice"))
        p.ImageFile = row("ImageFile").ToString
        Return p
    End Function

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            'get cart from session state and selected item from cart
            Dim cart As CartItemList = CartItemList.GetCart
            Dim cartItem As CartItem = cart(selectedProduct.ProductID)

            'if item isn’t in cart, add it; otherwise, increase its quantity
            If cartItem Is Nothing Then
                cart.AddItem(selectedProduct, CInt(txtQuantity.Text))
            Else
                cartItem.AddQuantity(CInt(txtQuantity.Text))
            End If
            Response.Redirect("Cart.aspx", False)
        End If
    End Sub
End Class
