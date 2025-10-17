
Partial Class Confirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblConfirm.Text = "Thank you for your order. It will be shipped on " &
            DateTime.Today.AddDays(1).ToShortDateString & "."
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Dim url As String = "http:" &
            ConfigurationManager.AppSettings("UnsecureAppPath") &
            "Order.aspx"
        Response.Redirect(url)
    End Sub
End Class
