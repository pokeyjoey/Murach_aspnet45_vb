' NOTE: You can use the "Rename" command on the context menu to change the class name "CategoryService" in code, svc and config file together.
' NOTE: In order to launch WCF Test Client for testing this service, please select CategoryService.svc or CategoryService.svc.vb at the Solution Explorer and start debugging.
Public Class CategoryService
    Implements ICategoryService

    Private data As CategoryDB
    Public Sub New()
        data = New CategoryDB
    End Sub

    Public Function GetCategories() As List(Of Category) _
        Implements ICategoryService.GetCategories

        Return data.GetCategories
    End Function

    Public Function GetCategoryById(id As String) As Category _
        Implements ICategoryService.GetCategoryById

        Return data.GetCategoryById(id)
    End Function

    Public Function InsertCategory(c As Category) As Integer _
        Implements ICategoryService.InsertCategory

        Try
            Return data.InsertCategory(c)
        Catch
            Return -1
        End Try
    End Function

    Public Function UpdateCategory(c As Category) As Integer _
        Implements ICategoryService.UpdateCategory

        Return data.UpdateCategory(c)
    End Function

    Public Function DeleteCategory(c As Category) As Integer _
        Implements ICategoryService.DeleteCategory

        Return data.DeleteCategory(c)
    End Function

End Class
