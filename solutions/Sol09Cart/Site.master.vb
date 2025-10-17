
Partial Class Site
    Inherits System.Web.UI.MasterPage

    Public WriteOnly Property PageH1Text As String
        Set(value As String)
            lblH1.Text = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'fill 'Days Until' label if it hasn't been overridden
        If lblDaysUntilHalloween IsNot Nothing Then
            Dim daysUntil As Integer = Me.DaysUntilHalloween
            Select Case daysUntil
                Case 0
                    lblDaysUntilHalloween.Text = "Happy Halloween!"
                Case 1
                    lblDaysUntilHalloween.Text = "Tomorrow is Halloween!"
                Case Else
                    lblDaysUntilHalloween.Text = "There are only " & daysUntil & " days left until Halloween!"
            End Select
        End If
    End Sub

    Private Function DaysUntilHalloween() As Integer
        Dim halloween As New DateTime(DateTime.Today.Year, 10, 31)
        If DateTime.Today > halloween Then
            halloween = halloween.AddYears(1)
        End If
        Dim ts As TimeSpan = halloween - DateTime.Today
        Return ts.Days
    End Function

End Class

