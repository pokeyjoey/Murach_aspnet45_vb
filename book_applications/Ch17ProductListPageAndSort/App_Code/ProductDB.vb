Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel

<DataObject(True)>
Public Class ProductDB

    Public Const DefaultSortColumn As String = "Name"
    Private Shared productList As List(Of Product)

    <DataObjectMethodAttribute(DataObjectMethodType.Select)>
    Public Shared Function GetProducts(startIndex As Integer,
                                       maxRows As Integer, sortOrder As String) As List(Of Product)
        LoadProductList()

        Select Case sortOrder
            Case "Name DESC"
                Return productList.OrderByDescending(
                    Function(p) p.Name).Skip(startIndex).Take(maxRows).ToList
            Case "ProductID"
                Return productList.OrderBy(
                    Function(p) p.ProductID) _
                .Skip(startIndex).Take(maxRows).ToList()
            Case "ProductID DESC"
                Return productList.OrderByDescending(
                    Function(p) p.ProductID) _
                .Skip(startIndex).Take(maxRows).ToList()
            Case "CategoryID, Name"
                Return productList.OrderBy(
                    Function(p) p.CategoryID).ThenBy(Function(p) p.Name) _
                .Skip(startIndex).Take(maxRows).ToList()
            Case "CategoryID, Name DESC"
                Return productList.OrderBy(
                    Function(p) p.CategoryID).ThenByDescending(Function(p) p.Name) _
                .Skip(startIndex).Take(maxRows).ToList()
            Case Else
                Return productList.OrderBy(
                    Function(p) p.Name).Skip(startIndex).Take(maxRows).ToList
        End Select
    End Function

    Private Shared Sub LoadProductList()
        If HttpContext.Current.Cache("Products") Is Nothing Then
            productList = New List(Of Product)
            Dim sel As String = "SELECT ProductID, Name, CategoryID, UnitPrice, OnHand " &
                "FROM Products"
            Using con As New SqlConnection(GetConnectionString)
                Using cmd As New SqlCommand(sel, con)
                    con.Open()
                    Dim rdr As SqlDataReader = cmd.ExecuteReader
                    Dim product As Product
                    While rdr.Read()
                        product = New Product
                        product.ProductID = rdr("ProductID").ToString
                        product.Name = rdr("Name").ToString
                        product.CategoryID = rdr("CategoryID").ToString
                        product.UnitPrice = CDec(rdr("UnitPrice"))
                        product.OnHand = CDec(rdr("OnHand"))
                        productList.Add(product)
                    End While
                    rdr.Close()
                End Using
            End Using
            HttpContext.Current.Cache.Insert("Products", productList,
                                             Nothing,
                                             DateTime.Now.AddMinutes(20),
                                             System.Web.Caching.Cache.NoSlidingExpiration)
        Else
            productList = CType(HttpContext.Current.Cache("Products"), List(Of Product))
        End If
    End Sub

    Public Shared Function SelectCount() As Integer
        Return productList.Count
    End Function

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings(
            "HalloweenConnectionString").ConnectionString
    End Function
End Class

