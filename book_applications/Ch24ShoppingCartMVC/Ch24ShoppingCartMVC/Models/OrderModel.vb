Public Class OrderModel
    Private products As List(Of ProductViewModel)

    Public Function GetProductsList() As List(Of ProductViewModel)
        If Me.products Is Nothing Then
            Me.products = Me.GetAllProducts
        End If
        Return Me.products
    End Function

    Public Function GetOrderInfo(id As String) As OrderViewModel
        Dim order As New OrderViewModel
        order.SelectedProduct = GetSelectedProduct(id)
        Return order
    End Function

    Public Function GetSelectedProduct(id As String) As ProductViewModel
        If Me.products Is Nothing Then
            Return ConvertToViewModel(GetProductByIdFromDataStore(id))
        Else
            Return Me.products.Where(
                Function(p) p.ProductID = id).FirstOrDefault
        End If
    End Function

    Public Function GetAllProducts() As List(Of ProductViewModel)
        Dim productmodels As New List(Of ProductViewModel)
        Dim products As List(Of Product) = Me.GetAllProductsFromDataStore
        For Each p As Product In products
            productmodels.Add(ConvertToViewModel(p))
        Next
        Return productmodels
    End Function

    Private Function ConvertToViewModel(product As Product) As ProductViewModel
        Dim model As New ProductViewModel
        model.ProductID = product.ProductID
        model.Name = product.Name
        model.ShortDescription = product.ShortDescription
        model.LongDescription = product.LongDescription
        model.UnitPrice = product.UnitPrice
        model.ImageFile = product.ImageFile
        Return model
    End Function

    'Data Access methods 
    Public Function GetProductByIdFromDataStore(id As String) As Product
        Using data As New HalloweenEntities
            Return data.Products.Where(
                Function(p) p.ProductID = id).FirstOrDefault
        End Using
    End Function

    Public Function GetAllProductsFromDataStore() As List(Of Product)
        Using data As New HalloweenEntities
            Return data.Products.OrderBy(
                Function(p) p.Name).ToList
        End Using
    End Function
End Class