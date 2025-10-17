Public Class ProductViewModel
    Public Property ProductID As String
    Public Property Name As String
    Public Property ShortDescription As String
    Public Property LongDescription As String
    Public Property UnitPrice As Decimal
    Public Property ImageFile As String
    Public Property Quantity As Integer

    'display item's property values
    Public Function Display() As String
        Dim msg As String = String.Format("{0} ({1} at {2} each)",
             Name, Quantity.ToString, FormatCurrency(UnitPrice))
        Return msg
    End Function
End Class