
Partial Class CheckOut2
    Inherits System.Web.UI.Page

    Private customer As Customer

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        customer = CType(Session("Customer"), Customer)

        Dim message As String = "Contact information" & vbCrLf &
            "    Email: " & customer.EmailAddress & vbCrLf &
            "    First name: " & customer.FirstName & vbCrLf &
            "    Last name: " & customer.LastName & vbCrLf &
            "    Phone number: " & customer.Phone & vbCrLf &
            "Billing address" & vbCrLf &
            "    Address: " & customer.Address & vbCrLf &
            "    City: " & customer.City & vbCrLf &
            "    State: " & customer.State & vbCrLf &
            "    Zip code: " & customer.Zip & vbCrLf

        txtData.Text = message

    End Sub

End Class
