
Partial Class _Default
    Inherits System.Web.UI.Page

    Private Const APP_KEY As String = "viewlist"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim viewlist As ProductViewList
        If Application(APP_KEY) Is Nothing Then
            viewlist = New ProductViewList
            Application.Add(APP_KEY, viewlist)
        Else
            viewlist = CType(Application(APP_KEY), ProductViewList)
            BindViewGrid(viewlist.Display)
        End If
    End Sub

    Protected Sub grdProducts_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdProducts.SelectedIndexChanged
        Dim view As New ProductView
        view.ProductID = grdProducts.SelectedValue.ToString
        view.ProductName = grdProducts.SelectedRow.Cells(2).Text
        view.CategoryID = ddlCategory.SelectedValue.ToString
        view.ViewCount = 1

        Application.Lock()
        Dim viewlist As ProductViewList = CType(Application(APP_KEY), 
            ProductViewList)
        viewlist.Add(view)
        Application.UnLock()

        BindViewGrid(viewlist.Display)
    End Sub

    Private Sub BindViewGrid(views As List(Of ProductView))
        grdViews.DataSource = views
        grdViews.DataBind()
    End Sub

    Protected Sub Reset(sender As Object, e As EventArgs) _
            Handles ddlCategory.SelectedIndexChanged, btnClear.Click
        grdProducts.SelectedIndex = -1
    End Sub

End Class
