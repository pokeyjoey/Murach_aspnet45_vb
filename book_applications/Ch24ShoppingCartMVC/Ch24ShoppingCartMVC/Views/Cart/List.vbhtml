@ModelType Ch24ShoppingCartMVC.CartViewModel

@Code
    ViewData("Title") = "Cart"
End Code

@section css 
    <link href="~/Content/Cart.css" rel="stylesheet" />
end section

<h1>Your Shopping Cart</h1>
@If Model.Cart.Count = 0 Then
    @<p>Nothing in your cart yet.</p>
Else
    @<select multiple="multiple">
        @For Each item In Model.Cart
            @<option>@item.Display</option>
        Next
    </select>
End If