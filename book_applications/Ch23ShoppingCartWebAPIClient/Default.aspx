<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 23: Shopping Cart Web API Client</title>
    <link href="/Styles/Main.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="Scripts/webapi.js" type="text/javascript"></script>
</head>
<body>
    <header><img src="/Images/banner.jpg" alt="Halloween Store" /></header>
    <form id="form1" runat="server">
        <section id="main">
            <h1>Edit Categories</h1>
            <table id="categories">
                <thead>
                    <tr><th>ID</th><th>ShortName</th><th>LongName</th></tr>
                </thead>
                <tbody></tbody>
            </table>
            <div>
                <label>ID:</label><input type="text" id="id" name="CategoryID" />
                <label>Short Name:</label><input type="text" id="short" name="ShortName" />
                <label>Long Name:</label><input type="text" id="long" name="LongName" />
            </div>
            <div>
                <input type="button" value="Insert" onclick="insertCat();" />
                <input type="button" value="Update" onclick="updateCat();" />
                <input type="button" value="Delete" onclick="deleteCat();" /> 
                <input type="button" value="Clear" onclick="clearFields();" />   
                <span id="message">Loading...</span>
            </div>
        </section>
    </form>
</body>
</html>