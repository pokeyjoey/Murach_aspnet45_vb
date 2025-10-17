Public Class ContactViewModel
    Public ReadOnly Property Email As String
        Get
            Return "info@halloweenstore.com"
        End Get
    End Property
    Public ReadOnly Property Phone As String
        Get
            Return "1-800-123-4567"
        End Get
    End Property
    Public ReadOnly Property Fax As String
        Get
            Return "1-800-890-1234"
        End Get
    End Property
    Public ReadOnly Property Address As String
        Get
            Return "1234 Main Street, Anytown, USA"
        End Get
    End Property
    Public ReadOnly Property SocialMediaUrls As List(Of String)
        Get
            Dim urls As New List(Of String)
            urls.Add("http://www.facebook.com/halloweenstore")
            urls.Add("http://www.twitter.com/halloweenstore")
            Return urls
        End Get
    End Property
End Class
