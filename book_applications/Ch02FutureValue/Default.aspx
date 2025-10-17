﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 2: Future Value</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 172px;
        }
    </style>
</head>
<body>
    <img src="Images/MurachLogo.jpg" alt="Murach Logo"/>
    <h1>401K Future Value Calculator</h1>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Monthly investment</td>
                <td>
                    <asp:DropDownList ID="ddlMonthlyInvestment" runat="server" Height="22px" Width="147px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Annual interest rate</td>
                <td>
                    <asp:TextBox ID="txtInterestRate" runat="server" Text="6.0"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Number of years</td>
                <td>
                    <asp:TextBox ID="txtYears" runat="server">10</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Future value</td>
                <td>
                    <asp:Label ID="lblFutureValue" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" Width="122px" />
                </td>
                <td>
                    <asp:Button ID="btnClear" runat="server" Text="Clear" Width="123px" CausesValidation="False" />
                </td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Interest rate is required." ControlToValidate="txtInterestRate" 
            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ErrorMessage="Interest rate must range from 1 to 20." ControlToValidate="txtInterestRate" 
            Display="Dynamic" ForeColor="Red" Type="Double"
            MaximumValue="20" MinimumValue="1"></asp:RangeValidator><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="Number of years is required." ControlToValidate="txtYears" 
            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" 
            ErrorMessage="Years must range from 1 to 45." ControlToValidate="txtYears" Type="Integer"
            Display="Dynamic" ForeColor="Red" MaximumValue="45" MinimumValue="1"></asp:RangeValidator>
    </div>
    </form>
</body>
</html>
