@ModelType Ch24ShoppingCartMVC.OrderViewModel

@Code
    ViewData("Title") = "Order"
    Dim product = Model.SelectedProduct
End Code

@section css 
    <link href="~/Content/Order.css" rel="stylesheet" />
end section

<form id="frmDropDown" action="/Order/Index/" method="post">
    <h1>Halloween Store Order Page</h1>

    <label>Please select a product&nbsp;</label>
    <select id="ddlProducts" name="ddlProducts" class="autoPostBack">
        @For Each item In Model.ProductsList
            Dim selected = If(item.Selected = True, "selected='selected'", "")
             @:<option value="@item.Value" @selected>@item.Text</option>
        Next
    </select>
</form>
@Using Html.BeginForm("List", "Cart",
                     FormMethod.Post, New With {.id = "frmCart"})
    @<div id="productData">   
        <label id="lblName">@product.Name</label>
        @Html.Label("", product.ShortDescription,
                    New With {.id = "lblShortDescription"})
        <label id="lblLongDescription">@product.LongDescription</label>
        <label id="lblUnitPrice">@product.UnitPrice.ToString("c2")</label>
        <label id="lblQuantity">Quantity&nbsp;</label>
        @*<input id="txtQuantity" name="txtQuantity" type="text" value="@product.Quantity" /> 
        <input type="hidden" name="hdnId" value="@product.ProductID" />*@
        @Html.TextBoxFor(Function(m) m.SelectedProduct.Quantity,
                         New With {.id = "txtQuantity"}) 
        @Html.HiddenFor(Function(m) m.SelectedProduct.ProductID)
        <br />
        <input type="submit" id="btnAdd" value="Add to Cart" />
    </div>
    @<img src="~/Content/Images/Products/@product.ImageFile" alt="" />
End Using