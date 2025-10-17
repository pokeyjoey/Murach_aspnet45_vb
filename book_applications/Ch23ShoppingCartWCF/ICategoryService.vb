Imports System.ServiceModel

<ServiceContract>
Public Interface ICategoryService
    <OperationContract>
    Function GetCategories() As List(Of Category)

    <OperationContract>
    Function GetCategoryById(id As String) As Category

    <OperationContract>
    Function InsertCategory(c As Category) As Integer

    <OperationContract>
    Function UpdateCategory(c As Category) As Integer

    <OperationContract>
    Function DeleteCategory(c As Category) As Integer
End Interface

<DataContract>
Public Class Category
    <DataMember>
    Public Property CategoryID As String

    <DataMember>
    Public Property ShortName As String

    <DataMember>
    Public Property LongName As String
End Class
