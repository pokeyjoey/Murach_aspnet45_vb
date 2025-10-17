
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then GridView1.SelectedIndex = 0
    End Sub

    Protected Sub FormView1_ItemInserted(sender As Object,
            e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object,
            e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that product." &
                "<br />Please try again."
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub FormView1_ItemDeleted(sender As Object,
            e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that product." &
                "<br />Please try again."
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub FormView1_ItemDeleting(sender As Object,
            e As FormViewDeleteEventArgs) Handles FormView1.ItemDeleting
        e.Values("UnitPrice") =
            e.Values("UnitPrice").ToString.Substring(1)
    End Sub

End Class
