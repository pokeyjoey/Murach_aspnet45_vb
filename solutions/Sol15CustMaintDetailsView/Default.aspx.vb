
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemUpdated(sender As Object, e As DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that customer." &
                "<br />Please try again."
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub DetailsView1_ItemDeleted(sender As Object, e As DetailsViewDeletedEventArgs) Handles DetailsView1.ItemDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that customer." &
                "<br />Please try again."
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        Else
            GridView1.DataBind()
        End If
    End Sub


End Class
