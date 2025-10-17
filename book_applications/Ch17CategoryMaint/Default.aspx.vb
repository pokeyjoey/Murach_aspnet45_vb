
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub ObjectDataSource1_Updated(sender As Object, e As ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Updated
        e.AffectedRows = CInt(e.ReturnValue)
    End Sub

    Protected Sub GridView1_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                e.Exception.Message
            If e.Exception.InnerException IsNot Nothing Then
                lblError.Text &= "<br />Message: " &
                    e.Exception.InnerException.Message
            End If
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that category." &
                "<br />Please try again."
        End If
    End Sub

    Protected Sub ObjectDataSource1_Deleted(sender As Object, e As ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Deleted
        e.AffectedRows = CInt(e.ReturnValue)
    End Sub

    Protected Sub GridView1_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                e.Exception.Message
            If e.Exception.InnerException IsNot Nothing Then
                lblError.Text &= "<br />Message: " &
                    e.Exception.InnerException.Message
            End If
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that category." &
                "<br />Please try again."
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                e.Exception.Message
            If e.Exception.InnerException IsNot Nothing Then
                lblError.Text &= "<br />Message: " &
                    e.Exception.InnerException.Message
            End If
            e.ExceptionHandled = True
        End If
    End Sub
End Class
