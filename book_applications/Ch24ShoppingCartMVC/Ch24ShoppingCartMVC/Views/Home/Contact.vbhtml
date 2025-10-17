@ModelType Ch24ShoppingCartMVC.ContactViewModel

@Code
    ViewData("Title") = "Contact Us"
End Code

<h2>Contact</h2>
<p>Email: @Model.Email</p>
<p>Phone: @Model.Phone</p>
<p>Fax: @Model.Fax</p>
<p>Address: @Model.Address</p>
<p>@For Each url As String In Model.SocialMediaUrls
        @:<a href="@url" target="_blank">@url</a><br />
    Next
</p>