@Code
    ViewData("Title") = "Shopping Cart"
    Dim day As String = DateTime.Now.DayOfWeek.ToString
End Code

@section css 
    <link href="~/Content/Home.css" rel="stylesheet" />
end section

<h1>@ViewBag.HeaderText</h1>
<div>Thank you for visiting us this beautiful @day!</div>

@section footer 
    <p>@ViewData("FooterText").ToString</p>
end section