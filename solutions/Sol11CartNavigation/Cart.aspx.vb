
Partial Class Cart
    Inherits System.Web.UI.Page

    Private cart As CartItemList

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        cart = CartItemList.GetCart
        If Not IsPostBack Then
            Me.DisplayCart()
        End If
    End Sub

    Private Sub DisplayCart()
        lstCart.Items.Clear()
        Dim item As CartItem
        For i As Integer = 0 To cart.Count - 1
            item = cart(i)
            lstCart.Items.Add(item.Display)
        Next
    End Sub

    Protected Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
        If cart.Count > 0 Then
            If lstCart.SelectedIndex > -1 Then
                cart.RemoveAt(lstCart.SelectedIndex)
                Me.DisplayCart()
            Else
                lblMessage.Text = "Please select the item you want to remove."
            End If
        End If
    End Sub

    Protected Sub btnEmpty_Click(sender As Object, e As EventArgs) Handles btnEmpty.Click
        If cart.Count > 0 Then
            cart.Clear()
            lstCart.Items.Clear()
        End If
    End Sub

    Protected Sub btnCheckOut_Click(sender As Object, e As EventArgs) Handles btnCheckOut.Click
        lblMessage.Text = "Sorry, that function hasn't been " &
            "implemented yet."
    End Sub
End Class
