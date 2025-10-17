
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(sender As Object,
                               e As EventArgs) Handles btnAdd.Click
        SqlDataSource1.InsertParameters("CategoryID").DefaultValue =
            txtID.Text
        SqlDataSource1.InsertParameters("ShortName").DefaultValue =
            txtShortName.Text
        SqlDataSource1.InsertParameters("LongName").DefaultValue =
            txtLongName.Text

        Try
            SqlDataSource1.Insert()
            txtID.Text = ""
            txtShortName.Text = ""
            txtLongName.Text = ""
        Catch ex As Exception
            lblError.Text = ("A database error has occurred.<br /><br />" &
                             "Message: ") & ex.Message
        End Try

    End Sub

    Protected Sub GridView1_RowUpdated(sender As Object,
                                       e As GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that category." &
                "<br />Please try again."
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(sender As Object,
                                       e As GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that category." &
                "<br />Please try again."
        End If

    End Sub

End Class
