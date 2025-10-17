Imports System.Web.Http

Public Class CategoriesController
    Inherits ApiController

    ' Private data access class and constructor
    Private data As CategoryDB
    Public Sub New()
        Me.data = New CategoryDB
    End Sub

    ' GET: api/categories
    Public Function GetCategories() As IEnumerable(Of Category)
        'System.Threading.Thread.Sleep(3000); '3 seconds
        Return data.GetCategories
    End Function

    ' GET: api/categories/masks
    Public Function GetCategoryById(id As String) As Category
        Return data.GetCategoryById(id)
    End Function

    ' GET: api/categories/?name=Masks
    Public Function GetCategoriesByShortName(name As String) As IEnumerable(Of Category)
        Return data.GetCategoriesByShortName(name)
    End Function

    ' POST(Insert): api/categories
    Public Function PostCategory(<FromBody()> value As Category) As Integer
        Return data.InsertCategory(value)
    End Function

    ' PUT(Update): api/categories/masks
    Public Function PutCategory(id As String, <FromBody()> value As Category) As Integer
        Dim c As Category = GetCategoryById(id)
        c.ShortName = value.ShortName
        c.LongName = value.LongName
        Return data.UpdateCategory(c)
    End Function

    ' DELETE: api/categories/masks
    Public Function DeleteCategory(id As String) As Integer
        Dim c As Category = GetCategoryById(id)
        Return data.DeleteCategory(c)
    End Function
End Class