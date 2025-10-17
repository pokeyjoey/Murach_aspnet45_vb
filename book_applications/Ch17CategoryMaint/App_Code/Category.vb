Imports Microsoft.VisualBasic

Public Class Category
    Private m_categoryID As String
    Private m_shortName As String
    Private m_longName As String

    Public Sub New()
    End Sub

    Public Property CategoryID As String
        Get
            Return m_categoryID
        End Get
        Set(value As String)
            m_categoryID = value
        End Set
    End Property

    Public Property ShortName As String
        Get
            Return m_shortName
        End Get
        Set(value As String)
            m_shortName = value
        End Set
    End Property

    Public Property LongName As String
        Get
            Return m_longName
        End Get
        Set(value As String)
            m_longName = value
        End Set
    End Property
End Class

