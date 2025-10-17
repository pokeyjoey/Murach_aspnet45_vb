
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
            "    Zip code: " & customer.Zip & vbCrLf &
            "Let me know about" & vbCrLf &
            "    New products: " & customer.NewProductsInfo & vbCrLf &
            "    Special offers: " & customer.SpecialPromosInfo & vbCrLf &
            "    New editions: " & customer.NewRevisionsInfo & vbCrLf &
            "    Local events: " & customer.LocalEventsInfo & vbCrLf &
            "Contact me via" & vbCrLf &
            "    Twitter: " & customer.ContactViaTwitter & vbCrLf &
            "    Facebook: " & customer.ContactViaFacebook & vbCrLf &
            "    Text message: " & customer.ContactViaText & vbCrLf &
            "    Email: " & customer.ContactViaEmail

        txtData.Text = message

    End Sub

End Class
