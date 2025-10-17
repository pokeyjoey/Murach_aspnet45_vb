Imports System.Data
Imports System.Configuration

Partial Class CheckOut1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Request.IsSecureConnection Then
            Dim url As String = "https:" &
                    ConfigurationManager.AppSettings("SecureAppPath") &
                    "CheckOut1.aspx"
            Response.Redirect(url)
        End If

    End Sub

    Protected Sub btnCheckOut_Click(sender As Object, e As EventArgs) Handles btnCheckOut.Click
        If Page.IsValid Then
            Response.Redirect("Checkout2.aspx")
        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Session.Remove("Cart")
        Dim url As String = "http:" &
            ConfigurationManager.AppSettings("UnsecureAppPath") &
            "Order.aspx"
        Response.Redirect(url)
    End Sub

    Protected Sub btnContinue_Click(sender As Object, e As EventArgs) Handles btnContinue.Click
        Dim url As String = "http:" &
            ConfigurationManager.AppSettings("UnsecureAppPath") &
            "Order.aspx"
        Response.Redirect(url)
    End Sub
    
End Class
