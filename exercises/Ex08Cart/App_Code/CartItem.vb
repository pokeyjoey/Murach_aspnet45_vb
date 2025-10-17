Imports Microsoft.VisualBasic

Public Class CartItem

    'create empty object or add values on creation
    Public Sub New()
    End Sub
    Public Sub New(product As Product, quantity As Integer)
        Me.Product = product
        Me.Quantity = quantity
    End Sub

    'public properties
    Public Property Product As Product
    Public Property Quantity As Integer

    'add to quantity
    Public Sub AddQuantity(quantity As Integer)
        Me.Quantity += quantity
    End Sub

    'display item's property values
    Public Function Display() As String
        Dim displayString As String = Product.Name & " (" &
            Quantity.ToString & " at " &
            FormatCurrency(Product.UnitPrice) & " each)"
        Return displayString
    End Function
End Class
