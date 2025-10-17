
Partial Class CheckOut
    Inherits System.Web.UI.Page

    Protected Sub btnContinue_Click(sender As Object, e As EventArgs) Handles btnContinue.Click
        If Page.IsValid Then
            Dim expiry As DateTime = DateTime.Now.AddMinutes(5)
            Me.SetResponseCookie("FirstName", txtFirstName.Text, expiry)
            Me.SetResponseCookie("LastName", txtLastName.Text, expiry)
        End If

        Response.Redirect("~/Order.aspx")
    End Sub

    Private Sub SetResponseCookie(name As String, value As String, expiry As DateTime)
        Dim cookie As New HttpCookie(name, value)
        cookie.Expires = expiry
        Response.Cookies.Add(cookie)
    End Sub

End Class
