Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.ComponentModel

<DataObject(True)>
Public Class ProductDB

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Shared Function GetAllCategories() As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT CategoryID, LongName " &
            "FROM Categories ORDER BY LongName"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        Return dr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Shared Function GetProductsByCategory(CategoryID As String) As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT ProductID, Name, " &
            "UnitPrice, OnHand " &
            "FROM Products " &
            "WHERE CategoryID = @CategoryID " &
            "ORDER BY ProductID"
        Dim cmd As New SqlCommand(sel, con)
        cmd.Parameters.AddWithValue("CategoryID", CategoryID)
        con.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        Return dr
    End Function

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings(
            "HalloweenConnectionString").ConnectionString
    End Function
End Class