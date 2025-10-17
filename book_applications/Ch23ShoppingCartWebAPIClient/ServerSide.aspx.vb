Imports System.Net
Imports System.IO
Imports System.Data

Partial Class ServerSide
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'configure web request object
        Dim url As String = "http://localhost:51555/api/categories/"
        Dim request As HttpWebRequest

        request = CType(WebRequest.Create(url), HttpWebRequest)
        request.Method = "GET"
        request.ContentType = "text/xml; encoding='utf-8'"

        'send request, get xml response and convert to stream
        Dim response As WebResponse = request.GetResponse
        Dim stream As Stream = response.GetResponseStream

        'read stream in to a dataset
        Dim ds As New DataSet
        ds.ReadXml(stream)

        'bind data set to gridview
        grdCategories.DataSource = ds.Tables(0)
        grdCategories.DataBind()
    End Sub
End Class
