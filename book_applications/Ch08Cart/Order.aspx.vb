Imports System.Data
Imports System.Web.Caching

Partial Class Order
    Inherits System.Web.UI.Page

    Private selectedProduct As Product

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'bind drop-down list and update page hit count on first load;                 
        If Not IsPostBack Then
            ddlProducts.DataBind()

            'get hit count from application state or set to 1
            Application.Lock()
            Dim hitCount As Integer = CInt(Application("HitCount"))
            hitCount += 1
            Application("HitCount") = hitCount
            Application.UnLock()

            lblPageHits.Text = hitCount.ToString
        End If

        'get and show product data on every load
        selectedProduct = Me.GetSelectedProduct
        lblName.Text = selectedProduct.Name
        lblShortDescription.Text = selectedProduct.ShortDescription
        lblLongDescription.Text = selectedProduct.LongDescription
        lblUnitPrice.Text = FormatCurrency(selectedProduct.UnitPrice) & " each"
        imgProduct.ImageUrl = "Images/Products/" & selectedProduct.ImageFile

        'get firstname from cookie and set welcome message if it exists
        Dim cookie As HttpCookie = Request.Cookies("FirstName")
        If cookie IsNot Nothing Then
            lblWelcome.Text = "Welcome back, " & cookie.Value & "!"
        End If

        'get last update time from cache, then display it
        'or set last update time in cache to now plus 10, then display it
        Dim lastUpdateTime As Object = Cache.Get("LastUpdateTime")
        If lastUpdateTime Is Nothing Then
            lastUpdateTime = DateTime.Now
            Cache.Insert("LastUpdateTime", lastUpdateTime, Nothing,
                         DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration)
        End If
        lblUpdateTime.Text = lastUpdateTime.ToString

    End Sub

    Private Function GetSelectedProduct() As Product
        'get row from DataSource control based on value in drop-down list
        Dim productsTable As DataView = CType(SqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        productsTable.RowFilter = "ProductID = '" & ddlProducts.SelectedValue & "'"
        Dim row As DataRowView = CType(productsTable(0), DataRowView)

        'create a new product object and load with data from row
        Dim p As New Product
        p.ProductID = row("ProductID").ToString
        p.Name = row("Name").ToString
        p.ShortDescription = row("ShortDescription").ToString
        p.LongDescription = row("LongDescription").ToString
        p.UnitPrice = CDec(row("UnitPrice"))
        p.ImageFile = row("ImageFile").ToString
        Return p
    End Function

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            'get cart from session state and selected item from cart
            Dim cart As CartItemList = CartItemList.GetCart
            Dim cartItem As CartItem = cart(selectedProduct.ProductID)

            'if item isn’t in cart, add it; otherwise, increase its quantity
            If cartItem Is Nothing Then
                cart.AddItem(selectedProduct, CInt(txtQuantity.Text))
            Else
                cartItem.AddQuantity(CInt(txtQuantity.Text))
            End If
            Response.Redirect("Cart.aspx", False)
        End If
    End Sub
End Class
