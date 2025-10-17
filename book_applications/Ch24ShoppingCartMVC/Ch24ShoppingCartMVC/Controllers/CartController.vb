Public Class CartController
    Inherits System.Web.Mvc.Controller

    Private cart As New CartModel

    <HttpGet>
    Function Index() As RedirectToRouteResult
        Return RedirectToAction("List/")
    End Function

    <HttpGet>
    Function List() As ViewResult
        Dim model As CartViewModel
        model = CType(TempData("cart"), CartViewModel)
        If model Is Nothing Then model = cart.GetCart
        Return View(model)
    End Function

    <HttpPost>
    Public Function List(order As OrderViewModel) As RedirectToRouteResult
        Dim model As CartViewModel
        model = cart.GetCart(order.SelectedProduct.ProductID)
        model.AddedProduct.Quantity = order.SelectedProduct.Quantity
        cart.AddToCart(model)
        TempData("cart") = model
        Return RedirectToAction("List", "Cart")
    End Function

End Class