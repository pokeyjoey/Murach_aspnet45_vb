
Partial Class CheckOut
    Inherits System.Web.UI.Page

    Private customer As Customer

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            customer = CType(Session("Customer"), Customer)
            Me.LoadCustomerData()
        End If
    End Sub

    Protected Sub btnCheckOut_Click(sender As Object, e As EventArgs) Handles btnCheckOut.Click
        If Page.IsValid Then
            Me.GetCustomerData()
            Response.Redirect("~/CheckOut2.aspx")
        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Session.Remove("Cart")
        Session.Remove("Customer")
        Response.Redirect("~/Order.aspx")
    End Sub

    Private Sub LoadCustomerData()
        If customer IsNot Nothing Then
            txtFirstName.Text = customer.FirstName
            txtLastName.Text = customer.LastName
            txtEmail1.Text = customer.EmailAddress
            txtPhone.Text = customer.Phone
            txtAddress.Text = customer.Address
            txtCity.Text = customer.City
            ddlState.SelectedValue = customer.State
            txtZip.Text = customer.Zip
            rblContactVia.SelectedValue = customer.ContactVia
            cblAboutList.Items(0).Selected = customer.NewProductsInfo
            cblAboutList.Items(1).Selected = customer.SpecialPromosInfo
            cblAboutList.Items(2).Selected = customer.NewRevisionsInfo
            cblAboutList.Items(3).Selected = customer.LocalEventsInfo
        End If
    End Sub

    Private Sub GetCustomerData()
        If customer Is Nothing Then
            customer = New Customer
        End If
        customer.FirstName = txtFirstName.Text
        customer.LastName = txtLastName.Text
        customer.EmailAddress = txtEmail1.Text
        customer.Phone = txtPhone.Text
        customer.Address = txtAddress.Text
        customer.City = txtCity.Text
        customer.State = ddlState.SelectedValue
        customer.Zip = txtZip.Text
        customer.ContactVia = rblContactVia.SelectedValue
        customer.NewProductsInfo = cblAboutList.Items(0).Selected
        customer.SpecialPromosInfo = cblAboutList.Items(1).Selected
        customer.NewRevisionsInfo = cblAboutList.Items(2).Selected
        customer.LocalEventsInfo = cblAboutList.Items(3).Selected
        Session("Customer") = customer
    End Sub
End Class
