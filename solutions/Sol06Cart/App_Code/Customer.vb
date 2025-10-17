Imports Microsoft.VisualBasic

Public Class Customer
    Public Property FirstName As String
    Public Property LastName As String
    Public Property EmailAddress As String
    Public Property Phone As String
    Public Property Address As String
    Public Property City As String
    Public Property State As String
    Public Property Zip As String
    ' values for "Please let me know about"
    Public Property NewProductsInfo As Boolean
    Public Property NewRevisionsInfo As Boolean
    Public Property SpecialPromosInfo As Boolean
    Public Property LocalEventsInfo As Boolean
    ' values for "Please contact me via"
    Public Property ContactVia As String
    Public Property ContactViaTwitter As Boolean
    Public Property ContactViaFacebook As Boolean
    Public Property ContactViaText As Boolean
    Public Property ContactViaEmail As Boolean
End Class
