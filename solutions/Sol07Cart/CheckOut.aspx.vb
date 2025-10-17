
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
            txtDOB.Text = customer.Birthdate
            txtShipAddress.Text = customer.ShippingAddress
            txtShipCity.Text = customer.ShippingCity
            ddlShipState.SelectedValue = customer.ShippingState
            txtShipZip.Text = customer.ShippingZip
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
        customer.Birthdate = txtDOB.Text
        customer.ShippingAddress = txtShipAddress.Text
        customer.ShippingCity = txtShipCity.Text
        customer.ShippingState = ddlShipState.SelectedValue
        customer.ShippingZip = txtShipZip.Text
        Session("Customer") = customer
    End Sub

    Protected Sub chkSameAsBilling_CheckedChanged(sender As Object, e As EventArgs) Handles chkSameAsBilling.CheckedChanged
        If Not chkSameAsBilling.Checked Then
            rfvShipAddress.Enabled = True
            rfvShipCity.Enabled = True
            rfvShipState.Enabled = True
            rfvShipZip.Enabled = True
            txtShipAddress.Enabled = True
            txtShipCity.Enabled = True
            ddlShipState.Enabled = True
            txtShipZip.Enabled = True
        Else
            rfvShipAddress.Enabled = False
            rfvShipCity.Enabled = False
            rfvShipState.Enabled = False
            rfvShipZip.Enabled = False
            txtShipAddress.Enabled = False
            txtShipCity.Enabled = False
            ddlShipState.Enabled = False
            txtShipZip.Enabled = False
        End If
    End Sub

End Class
