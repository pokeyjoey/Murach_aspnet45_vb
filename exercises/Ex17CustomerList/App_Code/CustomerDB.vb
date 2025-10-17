Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data.SqlClient


<DataObject> _
Public Class CustomerDB
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetAllStates() As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT StateCode, StateName FROM States " &
            "ORDER BY StateName"
        Dim cmd As New SqlCommand(sel, con)
        con.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader
        Return rdr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetCustomersByState(state As String) As IEnumerable
        Dim con As New SqlConnection(GetConnectionString)
        Dim sel As String = "SELECT LastName, FirstName, PhoneNumber FROM Customers " &
            "WHERE State = @State " &
            "ORDER BY LastName"
        Dim cmd As New SqlCommand(sel, con)
        cmd.Parameters.AddWithValue("@State", state)
        con.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader
        Return rdr
    End Function

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings("HalloweenConnectionString").ConnectionString
    End Function
End Class

