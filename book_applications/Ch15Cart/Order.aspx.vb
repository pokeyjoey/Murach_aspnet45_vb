Imports System.Data

Partial Class Order
    Inherits System.Web.UI.Page

    Private selectedProduct As Product

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            Dim selectedProduct As Product = Me.GetSelectedProduct
            Dim cart As CartItemList = CartItemList.GetCart
            Dim cartItem As CartItem = cart(selectedProduct.ProductID)
            If cartItem Is Nothing Then
                cart.AddItem(selectedProduct, CInt(txtQuantity.Text))
            Else
                cartItem.AddQuantity(CInt(txtQuantity.Text))
            End If
            Response.Redirect("Cart.aspx")
        End If
    End Sub

    Private Function GetSelectedProduct() As Product
        Dim productsTable As DataView =
            CType(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
        Dim row As DataRowView = CType(productsTable(0), DataRowView)
        Dim p As New Product
        p.ProductID = row("ProductID").ToString
        p.Name = row("Name").ToString
        p.ShortDescription = row("ShortDescription").ToString
        p.LongDescription = row("LongDescription").ToString
        p.UnitPrice = CDec(row("UnitPrice"))
        p.ImageFile = row("ImageFile").ToString
        Return p
    End Function

End Class
