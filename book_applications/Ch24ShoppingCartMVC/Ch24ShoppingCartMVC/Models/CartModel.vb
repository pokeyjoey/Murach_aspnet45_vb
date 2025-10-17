Public Class CartModel

    Public Function GetCart(Optional id As String = "") As CartViewModel
        Dim model As New CartViewModel
        model.Cart = Me.GetCartFromDataStore
        If Not String.IsNullOrEmpty(id) Then
            model.AddedProduct = GetSelectedProduct(id)
        End If
        Return model
    End Function

    Public Sub AddToCart(model As CartViewModel)
        If model.AddedProduct.ProductID IsNot Nothing Then
            Dim id As String = model.AddedProduct.ProductID
            Dim inCart As ProductViewModel = model.Cart.Where(
                Function(p) p.ProductID = id).FirstOrDefault

            If inCart Is Nothing Then
                AddItemToDataStore(model)
            Else
                inCart.Quantity += model.AddedProduct.Quantity
            End If
        End If
    End Sub

    Private Function GetSelectedProduct(id As String) As ProductViewModel
        Dim order As New OrderModel
        Return order.GetSelectedProduct(id)
    End Function

    'Data Access methods 
    Private Function GetCartFromDataStore() As List(Of ProductViewModel)
        Dim cart As List(Of ProductViewModel)
        Dim objCart As Object = HttpContext.Current.Session("cart")
        cart = CType(objCart, List(Of ProductViewModel))
        If cart Is Nothing Then
            cart = New List(Of ProductViewModel)
            HttpContext.Current.Session("cart") = cart
        End If
        Return cart
    End Function

    Private Sub AddItemToDataStore(model As CartViewModel)
        model.Cart.Add(model.AddedProduct)
    End Sub
End Class
