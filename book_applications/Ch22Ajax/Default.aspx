<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Chapter 22: Ajax</title>
    <link href="Styles/Main.css" rel="stylesheet" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <h1>View Our Products By Category</h1>    
    
        <div id="products">
            Choose a category:&nbsp;
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True"
                Width="130" DataSourceID="SqlDataSource1"
                DataTextField="LongName" DataValueField="CategoryID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
                SelectCommand="SELECT [CategoryID], [LongName]
                               FROM [Categories] ORDER BY [LongName]">
            </asp:SqlDataSource>     
            <asp:Button ID="btnClear" runat="server" Text="Clear Selection" /><br />      
           
            <asp:UpdatePanel ID="productsPanel" runat="server">
              <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />
              </Triggers>
              <ContentTemplate>
                <asp:GridView ID="grdProducts" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="ProductID" 
                    AutoGenerateColumns="false" Width="400">
                  <Columns>
                    <asp:CommandField ShowSelectButton="true" SelectText="View" />
                    <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Price" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="OnHand" HeaderText="On Hand" />
                  </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
                    SelectCommand="SELECT [ProductID], [Name], [UnitPrice], [OnHand]
                                    FROM [Products] WHERE ([CategoryID] = @CategoryID)
                                    ORDER BY [ProductID]">
                  <SelectParameters>
                    <asp:ControlParameter Name="CategoryID" Type="String"
                        ControlID="ddlCategory" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
        
                <h2>Product Details</h2>
                <asp:DetailsView ID="dvwProduct" runat="server" AutoGenerateRows="False" DataKeyNames="ProductID" 
                    DataSourceID="SqlDataSource3" Width="400">
                  <Fields>
                    <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Price" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="OnHand" HeaderText="On Hand" />
                    <asp:BoundField DataField="ShortDescription" HeaderText="Short Description" />
                    <asp:BoundField DataField="LongDescription" HeaderText="Long Description" />
                    <asp:BoundField DataField="CategoryID" HeaderText="Category ID" />
                  </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource3" 
                    ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString %>' 
                    SelectCommand="SELECT [ProductID], [Name], [ShortDescription], [LongDescription], 
                                        [CategoryID], [UnitPrice], [OnHand] 
                                    FROM [Products] WHERE ([ProductID] = @ProductID)">
                  <SelectParameters>
                    <asp:ControlParameter ControlID="grdProducts" PropertyName="SelectedValue" Name="ProductID" Type="String"></asp:ControlParameter>
                  </SelectParameters>
                </asp:SqlDataSource>
              </ContentTemplate>             
            </asp:UpdatePanel>
        </div>

        <div id="views">
            <h2>Most Viewed Products</h2>
            <asp:UpdatePanel ID="viewsPanel" runat="server">
                <Triggers>
                  <asp:AsyncPostBackTrigger ControlID="grdProducts" EventName="SelectedIndexChanged" />
                </Triggers>
                <ContentTemplate>
                <asp:GridView ID="grdViews" runat="server" AutoGenerateColumns="false" Width="250">
                  <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product" />
                    <asp:BoundField DataField="ViewCount" HeaderText="Views" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CatID" />
                  </Columns>
                </asp:GridView>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="False">
                  <ProgressTemplate>
                    <div class="spinner"><img src="Images/spinner.gif" 
                        alt="Please Wait" />Loading...</div>
                  </ProgressTemplate>
                </asp:UpdateProgress>
              </ContentTemplate>
              
            </asp:UpdatePanel>
        </div>
    </form>
    </section>
</body>
</html>