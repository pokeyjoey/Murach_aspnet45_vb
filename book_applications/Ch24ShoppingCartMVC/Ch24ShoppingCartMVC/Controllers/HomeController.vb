Public Class HomeController
    Inherits System.Web.Mvc.Controller

    <HttpGet>
    Function Index() As ViewResult
        ViewBag.HeaderText = "Welcome to the Halloween Store"
        ViewData("FooterText") = "Where every day is Halloween!"
        Return View()
    End Function

    Function Contact() As ViewResult
        Dim model As New ContactViewModel
        Return View(model)
    End Function

End Class