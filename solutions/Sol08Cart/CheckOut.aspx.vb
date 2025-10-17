
Partial Class CheckOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        '' get entry data from cookies
        'If Request.Cookies("FirstName") IsNot Nothing Then
        '    txtFirstName.Text = Request.Cookies("FirstName").Value
        'End If
        'If Request.Cookies("LastName") IsNot Nothing Then
        '    txtLastName.Text = Request.Cookies("LastName").Value
        'End If

        'get entry data from session state
        If Not IsPostBack Then
            If Session("FirstName") IsNot Nothing Then
                txtFirstName.Text = Session("FirstName").ToString
            End If
            If Session("LastName") IsNot Nothing Then
                txtLastName.Text = Session("LastName").ToString
            End If
            txtFirstName.Focus()
        End If
    End Sub

    Protected Sub btnContinue_Click(sender As Object, e As EventArgs) Handles btnContinue.Click
        Me.LoadCustomerData()
        Response.Redirect("~/Order.aspx")
    End Sub

    Private Sub LoadCustomerData()
        ' load data in session state object
        Session("FirstName") = txtFirstName.Text
        Session("LastName") = txtLastName.Text

        ''load same data in cookies with 5 minute expiration
        'If Page.IsValid Then
        '    Dim expiry As DateTime = DateTime.Now.AddMinutes(5)
        '    Me.SetResponseCookie("FirstName", txtFirstName.Text, expiry)
        '    Me.SetResponseCookie("LastName", txtLastName.Text, expiry)
        'End If
    End Sub

    Private Sub SetResponseCookie(name As String, value As String, expiry As DateTime)
        Dim cookie As New HttpCookie(name, value)
        cookie.Expires = expiry
        Response.Cookies.Add(cookie)
    End Sub

End Class
