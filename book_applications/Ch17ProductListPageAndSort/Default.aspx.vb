
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then ViewState("InitialSort") = True
    End Sub

    Protected Sub grdProducts_Sorting(sender As Object, e As GridViewSortEventArgs) Handles grdProducts.Sorting
        If ViewState("InitialSort") IsNot Nothing Then
            ViewState.Remove("InitialSort")
            If e.SortExpression = ProductDB.DefaultSortColumn Then
                e.SortDirection = SortDirection.Descending
            End If
        End If
    End Sub
End Class
