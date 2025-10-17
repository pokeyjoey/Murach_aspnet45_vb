
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim svc As CategoryService.CategoryServiceClient
            svc = New CategoryService.CategoryServiceClient

            Dim c As CategoryService.Category  = svc.GetCategoryById("fx")
            Dim longname As String = c.LongName

            svc.Close()
        End If
    End Sub

    Protected Sub dvCategory_ItemDeleted(sender As Object, e As DetailsViewDeletedEventArgs) Handles dvCategory.ItemDeleted
        ddlCategories.DataBind()
    End Sub

    Protected Sub dvCategory_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles dvCategory.ItemInserted
        ddlCategories.DataBind()
    End Sub

    Protected Sub dvCategory_ItemUpdated(sender As Object, e As DetailsViewUpdatedEventArgs) Handles dvCategory.ItemUpdated
        ddlCategories.DataBind()
    End Sub
End Class
