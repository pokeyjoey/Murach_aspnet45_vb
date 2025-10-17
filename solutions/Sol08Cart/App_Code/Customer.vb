Imports Microsoft.VisualBasic

Public Class Customer
    Public Property FirstName As String
    Public Property LastName As String
    Public Property EmailAddress As String
    Public Property Phone As String
    Public Property StreetAddress As String
    Public Property StreetCity As String
    Public Property StreetState As String
    Public Property StreetZip As String
    Public Property IsSameBilling As Boolean
    Public Property BillingAddress As String
    Public Property BillingCity As String
    Public Property BillingState As String
    Public Property BillingZip As String
    Public Property Newsletter As Boolean
    Public Property Sales As Boolean
    Public Property NewItems As Boolean
    Public Property Order As CustomerOrder

    Public Sub New()
        Me.Order = New CustomerOrder
    End Sub

End Class
