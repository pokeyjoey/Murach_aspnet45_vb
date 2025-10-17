Imports System.Data

Partial Class Order
    Inherits System.Web.UI.Page

    Private selectedProduct As Product

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'bind drop-down list to product data from database
            ddlProducts.DataBind()

            'get the 'productID' URL parameter from the page's RouteData object
            Dim routeProductID As String = ""
            If RouteData.Values("productID") IsNot Nothing Then
                routeProductID = RouteData.Values("productID").ToString
            End If

            'if no parameter value, add product ID to URL and reload page
            If routeProductID = "" Then
                AddProductIdToUrlAndRedirect()
            Else
                'URL has product ID - use it to set drop-down value
                Me.ddlProducts.SelectedValue = routeProductID
            End If

            'Display information about the selected product in the form
            ShowSelectedProduct()
        End If
    End Sub

    Protected Sub ddlProducts_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlProducts.SelectedIndexChanged
        AddProductIdToUrlAndRedirect()
    End Sub

    Private Sub AddProductIdToUrlAndRedirect()
        'add selected product to the friendly URL and re-load page
        Response.Redirect("~/Shopping/Order/" & ddlProducts.SelectedValue)
    End Sub

    Private Sub ShowSelectedProduct()
        selectedProduct = Me.GetSelectedProduct
        lblName.Text = selectedProduct.Name
        lblShortDescription.Text = selectedProduct.ShortDescription
        lblLongDescription.Text = selectedProduct.LongDescription
        lblUnitPrice.Text = FormatCurrency(selectedProduct.UnitPrice) & " each"
        imgProduct.ImageUrl = "Images/Products/" & selectedProduct.ImageFile
    End Sub

    Private Function GetSelectedProduct() As Product
        'get row from SqlDataSource based on value in dropdownlist
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
            'get cart from session and selected item from cart
            Dim cart As CartItemList = CartItemList.GetCart
            selectedProduct = Me.GetSelectedProduct
            Dim cartItem As CartItem = cart(selectedProduct.ProductID)

            'if item isn’t in cart, add it; otherwise, increase its quantity
            If cartItem Is Nothing Then
                cart.AddItem(selectedProduct, CInt(txtQuantity.Text))
            Else
                cartItem.AddQuantity(CInt(txtQuantity.Text))
            End If
            Response.Redirect("~/Shopping/Cart")
        End If
    End Sub

End Class
