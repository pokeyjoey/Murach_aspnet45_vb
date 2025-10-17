Imports System.Data.SqlClient
Imports System.Configuration

Partial Class CheckOut2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Request.IsSecureConnection Then
            Dim url As String = "https:" &
                ConfigurationManager.AppSettings("SecureAppPath") &
                "CheckOut2.aspx"
            Response.Redirect(url)
        End If

        If Not IsPostBack Then Me.LoadYears()
    End Sub

    Private Sub LoadYears()
        Dim year As Integer = DateTime.Now.Year
        For i As Integer = 0 To 6
            ddlYear.Items.Add(year.ToString)
            year += 1
        Next
    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs) Handles btnAccept.Click
        If Page.IsValid Then
            Response.Redirect("Confirmation.aspx")
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
