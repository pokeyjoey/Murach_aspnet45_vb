Imports Microsoft.VisualBasic

Public Class ProductViewList
    Private list As New List(Of ProductView)

    Public Sub Add(newView As ProductView)
        System.Threading.Thread.Sleep(2000)
        Dim view As ProductView = list.FirstOrDefault(
            Function(v) v.ProductName = newView.ProductName)
        If view Is Nothing Then
            list.Add(newView)
        Else
            view.ViewCount += 1
        End If
    End Sub

    Public Function Display() As List(Of ProductView)
        Return list.OrderByDescending(
            Function(p) p.ViewCount).ThenBy(
                Function(p) p.ProductName).ToList
    End Function
End Class