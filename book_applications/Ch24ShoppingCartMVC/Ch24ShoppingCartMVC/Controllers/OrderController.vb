Public Class OrderController
    Inherits System.Web.Mvc.Controller

    Private order As New OrderModel

    <HttpGet>
    Function Index(id As String) As ActionResult

        'get list for drop down from temp data or order
        Dim products As SelectList = CType(TempData("products"), SelectList)
        If products Is Nothing Then
            Dim list = order.GetProductsList
            products = New SelectList(list, "ProductId", "Name", id)
        End If

        'if no URL parameter, get first product from list and refresh
        If String.IsNullOrEmpty(id) Then
            id = products.ElementAt(0).Value
            TempData("products") = products
            Return RedirectToAction("Index", "Order", New With {.id = id})
        Else
            'get selected product and return in view method
            Dim model As OrderViewModel = order.GetOrderInfo(id)
            model.ProductsList = products
            model.SelectedProduct.Quantity = 1
            Return View(model)
        End If
    End Function

    <HttpPost>
    Function Index(collection As FormCollection) As RedirectToRouteResult
        Dim pID As String = collection("ddlProducts")
        Return RedirectToAction("Index", "Order", New With {.id = pID})
    End Function

End Class