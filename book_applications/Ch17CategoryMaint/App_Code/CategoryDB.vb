Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.ComponentModel

<DataObject(True)>
Public NotInheritable Class CategoryDB

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Shared Function GetCategories() As List(Of Category)
        Dim categoryList As New List(Of Category)
        Dim sel As String = "SELECT CategoryID, ShortName, LongName " &
            "FROM Categories ORDER BY ShortName"
        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(sel, con)
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                Dim category As Category
                While dr.Read()
                    category = New Category
                    category.CategoryID = dr("CategoryID").ToString
                    category.ShortName = dr("ShortName").ToString
                    category.LongName = dr("LongName").ToString
                    categoryList.Add(category)
                End While
                dr.Close()
            End Using
        End Using
        Return categoryList
    End Function

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings(
            "HalloweenConnectionString").ConnectionString
    End Function

    <DataObjectMethod(DataObjectMethodType.Insert)>
    Public Shared Sub InsertCategory(category As Category)
        Dim ins As String = "INSERT INTO Categories " &
            " (CategoryID, ShortName, LongName) " &
            " VALUES(@CategoryID, @ShortName, @LongName)"
        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(ins, con)
                cmd.Parameters.AddWithValue("CategoryID", category.CategoryID)
                cmd.Parameters.AddWithValue("ShortName", category.ShortName)
                cmd.Parameters.AddWithValue("LongName", category.LongName)
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    <DataObjectMethod(DataObjectMethodType.Delete)>
    Public Shared Function DeleteCategory(category As Category) As Integer
        Dim deleteCount As Integer = 0
        Dim del As String = "DELETE FROM Categories " &
            "WHERE CategoryID = @CategoryID " &
            "AND ShortName = @ShortName " &
            "AND LongName = @LongName "
        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(del, con)
                cmd.Parameters.AddWithValue("CategoryID", category.CategoryID)
                cmd.Parameters.AddWithValue("ShortName", category.ShortName)
                cmd.Parameters.AddWithValue("LongName", category.LongName)
                con.Open()
                deleteCount = cmd.ExecuteNonQuery
            End Using
        End Using
        Return deleteCount
    End Function

    <DataObjectMethod(DataObjectMethodType.Update)>
    Public Shared Function UpdateCategory(original_Category As Category, category As Category) As Integer
        Dim updateCount As Integer = 0
        Dim up As String = "UPDATE Categories " &
            "SET ShortName = @ShortName, " &
            "LongName = @LongName " &
            "WHERE CategoryID = @original_CategoryID " &
            "AND ShortName = @original_ShortName " &
            "AND LongName = @original_LongName"
        Using con As New SqlConnection(GetConnectionString)
            Using cmd As New SqlCommand(up, con)
                cmd.Parameters.AddWithValue("ShortName", category.ShortName)
                cmd.Parameters.AddWithValue("LongName", category.LongName)
                cmd.Parameters.AddWithValue("original_CategoryID", original_Category.CategoryID)
                cmd.Parameters.AddWithValue("original_ShortName", original_Category.ShortName)
                cmd.Parameters.AddWithValue("original_LongName", original_Category.LongName)
                con.Open()
                updateCount = cmd.ExecuteNonQuery
                con.Close()
            End Using
        End Using
        Return updateCount
    End Function
End Class
