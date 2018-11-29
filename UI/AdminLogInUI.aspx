<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogInUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.AdminLogInUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
            
        h1 {
    color: black;
    text-align: center;
}

         body {
             background-color: lightblue;
         }
        .center {
            text-align: center;
            margin: auto;
            width: 65%;
            border: 3px solid #73AD21;
            padding: 10px;
            position: relative;
        }
        .center1 {
            text-align: center;
            margin: auto;
            width: 33%;
            padding: 10px;
        }
        .solid {border-style: solid;}
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="center">
        <h1 class="solid">Stock Management System</h1>
        <table class="center1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                </td>
            
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>    
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
            
                <td>
                    <asp:TextBox ID="passwordTextBox" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="outputLabel" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="logInButton" runat="server" Text="Log In" OnClick="logInButton_Click" Width="66px" />
                </td>
            </tr>    
            
            
        </table>
    </div>
    </form>
</body>
</html>
