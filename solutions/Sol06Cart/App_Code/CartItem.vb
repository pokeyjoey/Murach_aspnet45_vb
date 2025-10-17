Imports Microsoft.VisualBasic

Public Class CartItem
    Public Sub New(product As Product, quantity As Integer)
        Me.Product = product
        Me.Quantity = quantity
    End Sub

    Public Property Product As Product
    Public Property Quantity As Integer

    Public Sub AddQuantity(quantity As Integer)
        Me.Quantity += quantity
    End Sub

    Public Function Display() As String
        Dim displayString As String = Product.Name & " (" &
            Quantity.ToString & " at " &
            FormatCurrency(Product.UnitPrice) & " each)"

        Return displayString
    End Function
End Class