Imports Microsoft.VisualBasic

Public Class CartItemList

    'internal list of items and constructor which instantiates it
    Private cartItems As List(Of CartItem)
    Public Sub New()
        cartItems = New List(Of CartItem)
    End Sub

    'readonly property that returns the number of items in internal list
    Public ReadOnly Property Count As Integer
        Get
            Return cartItems.Count
        End Get
    End Property

    'indexers - locate items in internal list by index or product id
    Default Public Property Item(index As Integer) As CartItem
        Get
            Return cartItems(index)
        End Get
        Set(value As CartItem)
            cartItems(index) = value
        End Set
    End Property

    Default Public ReadOnly Property Item(id As String) As CartItem
        Get
            For Each c As CartItem In cartItems
                If c.Product.ProductID = id Then
                    Return c
                End If
            Next
            Return Nothing
        End Get
    End Property

    'static method to get cart object from session
    Public Shared Function GetCart() As CartItemList
        Dim cart As CartItemList = CType(HttpContext.Current.Session("Cart"), CartItemList)
        If cart Is Nothing Then
            HttpContext.Current.Session("Cart") = New CartItemList
        End If
        Return CType(HttpContext.Current.Session("Cart"), CartItemList)
    End Function

    'add, remove and clear internal list item(s)
    Public Sub AddItem(product As Product, quantity As Integer)
        Dim c As New CartItem(product, quantity)
        cartItems.Add(c)
    End Sub

    Public Sub RemoveAt(index As Integer)
        cartItems.RemoveAt(index)
    End Sub

    Public Sub Clear()
        cartItems.Clear()
    End Sub
End Class