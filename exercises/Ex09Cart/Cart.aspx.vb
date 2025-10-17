
Partial Class Cart
    Inherits System.Web.UI.Page

    Private cart As CartItemList

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'retrieve cart object from session on every post back
        cart = CartItemList.GetCart

        'on initial page load, add cart items to list control
        'and set master page logo image tool tip
        If Not IsPostBack Then
            Me.DisplayCart()
            Me.Master.PageH1Text = "Your Shopping Cart"
        End If
    End Sub

    Private Sub DisplayCart()
        'remove all current items from list control
        lstCart.Items.Clear()

        'loop cart and add each item's Display value to the control
        For i As Integer = 0 To cart.Count - 1
            lstCart.Items.Add(Me.cart(i).Display)
        Next
    End Sub

    Protected Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
        'if cart contains items and user has selected an item...
        If cart.Count > 0 Then
            If lstCart.SelectedIndex > -1 Then

                'remove selected item from cart and re-add cart items 
                cart.RemoveAt(lstCart.SelectedIndex)
                Me.DisplayCart()
            Else
                'if no item is selected, notify user 
                lblMessage.Text = "Please select an item to remove."
            End If
        End If
    End Sub

    Protected Sub btnEmpty_Click(sender As Object, e As EventArgs) Handles btnEmpty.Click
        'if cart has items, clear both cart and list control
        If cart.Count > 0 Then
            cart.Clear()
            lstCart.Items.Clear()
        End If
    End Sub

    Protected Sub btnCheckOut_Click(sender As Object, e As EventArgs) Handles btnCheckOut.Click
        lblMessage.Text = "That page hasn't been implemented yet."
    End Sub
End Class
