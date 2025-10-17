Imports System.Data.SqlClient

Public Class CategoryDB
    Public Function GetCategories() As List(Of Category)
        Dim list As New List(Of Category)
        Dim sql As String = "SELECT CategoryID, ShortName, LongName " &
            "FROM Categories " &
            "ORDER BY ShortName"

        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(sql, con)
                con.Open()
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader
                While dr.Read()
                    Dim c As New Category
                    c.CategoryID = dr("CategoryID").ToString
                    c.ShortName = dr("ShortName").ToString
                    c.LongName = dr("LongName").ToString
                    list.Add(c)
                End While
                dr.Close()
            End Using
        End Using
        Return list
    End Function

    Public Function GetCategoryById(id As String) As Category
        Dim c As Category = Nothing
        Dim sql As String = "SELECT CategoryID, ShortName, LongName " &
            "FROM Categories " &
            "WHERE CategoryID = @CategoryID"

        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("CategoryID", id)
                con.Open()
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader
                If dr.Read() Then
                    c = New Category
                    c.CategoryID = dr("CategoryID").ToString
                    c.ShortName = dr("ShortName").ToString
                    c.LongName = dr("LongName").ToString
                End If
                dr.Close()
            End Using
        End Using
        Return c
    End Function

    Public Function GetCategoriesByShortName(shortName As String) As List(Of Category)
        Dim list As New List(Of Category)
        Dim sql As String = "SELECT CategoryID, ShortName, LongName " &
            "FROM Categories " &
            "WHERE ShortName = @ShortName " &
            "ORDER BY ShortName"

        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("ShortName", shortName)
                con.Open()
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader
                While dr.Read()
                    Dim c As New Category
                    c.CategoryID = dr("CategoryID").ToString
                    c.ShortName = dr("ShortName").ToString
                    c.LongName = dr("LongName").ToString
                    list.Add(c)
                End While
                dr.Close()
            End Using
        End Using
        Return list
    End Function

    Public Function InsertCategory(c As Category) As Integer
        Dim affected As Integer
        Dim sql As String = "INSERT INTO Categories " &
            "(CategoryID, ShortName, LongName) " &
            "VALUES (@CategoryID, @ShortName, @LongName)"

        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("CategoryID", c.CategoryID)
                cmd.Parameters.AddWithValue("ShortName", c.ShortName)
                cmd.Parameters.AddWithValue("LongName", c.LongName)
                con.Open()
                affected = cmd.ExecuteNonQuery
                con.Close()
            End Using
        End Using
        Return affected
    End Function

    Public Function UpdateCategory(c As Category) As Integer
        Dim affected As Integer
        Dim sql As String = "UPDATE Categories " &
            "SET ShortName = @ShortName, LongName = @LongName " &
            "WHERE CategoryID = @CategoryID"

        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("CategoryID", c.CategoryID)
                cmd.Parameters.AddWithValue("ShortName", c.ShortName)
                cmd.Parameters.AddWithValue("LongName", c.LongName)
                con.Open()
                affected = cmd.ExecuteNonQuery
                con.Close()
            End Using
        End Using
        Return affected
    End Function

    Public Function DeleteCategory(c As Category) As Integer
        Dim affected As Integer
        Dim sql As String = "DELETE FROM Categories " &
            "WHERE CategoryID = @CategoryID"

        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("CategoryID", c.CategoryID)
                con.Open()
                affected = cmd.ExecuteNonQuery
                con.Close()
            End Using
        End Using
        Return affected
    End Function

    Private Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings(
            "Halloween").ConnectionString
    End Function
End Class
