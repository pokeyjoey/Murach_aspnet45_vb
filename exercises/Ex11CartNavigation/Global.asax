<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        RegisterRoutes(RouteTable.Routes)
    End Sub
    
    Public Shared Sub RegisterRoutes(routes As RouteCollection)
        'map static pages
        routes.MapPageRoute("Home", "Home", "~/Default.aspx")

        routes.MapPageRoute("Shopping", "Shopping", "~/Shopping.aspx")
        routes.MapPageRoute("Cart", "Shopping/Cart", "~/Cart.aspx")
        routes.MapPageRoute("Checkout", "Shopping/Checkout", "~/Checkout.aspx")

        routes.MapPageRoute("Categories", "Categories", "~/Categories.aspx")
        routes.MapPageRoute("Costumes", "Categories/Costumes", "~/Costumes.aspx")
        routes.MapPageRoute("Masks", "Categories/Masks", "~/Masks.aspx")
        routes.MapPageRoute("Props", "Categories/Props", "~/Props.aspx")

        routes.MapPageRoute("Support", "Support", "~/Support.aspx")
        routes.MapPageRoute("Service", "Support/Service", "~/CustomerService.aspx")
        routes.MapPageRoute("Product", "Support/Product", "~/ProductSupport.aspx")
        routes.MapPageRoute("Map", "Support/Map", "~/Map.aspx")

        routes.MapPageRoute("About", "About", "~/About.aspx")

        routes.MapPageRoute("Order", "Shopping/Order/{productID}", "~/Order.aspx",
                            False, New RouteValueDictionary(New With {.productID = ""}))
    End Sub

    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>