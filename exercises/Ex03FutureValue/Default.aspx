<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Chapter 3: Future Value</title>
    <link href="Styles.css" rel="stylesheet" />
</head>
<body>
    <header>
        <img id="logo" alt="Murach logo" src="Images/MurachLogo.jpg"/>
    </header>
    <section>
        <form id="form1" runat="server">
            <h1>401K Future Value Calculator</h1>
            <label>Monthly investment:</label>
            <asp:DropDownList ID="ddlMonthlyInvestment" runat="server"></asp:DropDownList>
            <label>Annual interest rate:</label>
            <asp:TextBox ID="txtInterestRate" runat="server">6.0</asp:TextBox>
            <label>Number of years:</label>
            <asp:TextBox ID="txtYears" runat="server">10</asp:TextBox>
            <label>Future value:</label>
            <asp:Label ID="lblFutureValue" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnCalculate" runat="server" Text="Calculate" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" 
                CausesValidation="False" />
        </form>
    </section>    
</body>
</html>