<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryUpdateUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.CategoryUpdateUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
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
        
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="IndexUI.aspx">Home</asp:HyperLink>
            &nbsp;<asp:HyperLink runat="server" NavigateUrl="CategorySetupUI.aspx">Category Setup</asp:HyperLink>
        
        &nbsp;<asp:HyperLink runat="server" NavigateUrl="CompanySetupUI.aspx">Company Setup</asp:HyperLink>
        
        &nbsp;<asp:HyperLink runat="server" NavigateUrl="ItemSetupUI.aspx">Item Setup</asp:HyperLink>
        
        &nbsp;<asp:HyperLink runat="server" NavigateUrl="StockInUI.aspx">Stock In</asp:HyperLink>
        
        &nbsp;<asp:HyperLink runat="server" NavigateUrl="StockOutUI.aspx">Stock Out</asp:HyperLink>
        
        &nbsp;<asp:HyperLink runat="server" NavigateUrl="SearchViewUI.aspx">Search Items</asp:HyperLink>
       
        &nbsp;<asp:HyperLink runat="server" NavigateUrl="SearchByDate.aspx">View Sales</asp:HyperLink>
    
            </div>

        <h3>Update Name</h3>
    
            <table class="center1">
                

<tr>
                    
                    <td></td>
                    <td><asp:HiddenField ID="idHiddenField" runat="server"/></td>
</tr>
                <tr>
                    <td>
                        
                        <asp:Label ID="ID" runat="server">Name</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="CategoryInputTextBox" runat="server" Width="159px"></asp:TextBox></td>

                </tr>
                <tr>
                    <td></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="categoryUpdateButton" runat="server" OnClick="categoryUpdateButton_Click" Text="Update" Width="80px" />
                        </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="outputLabel" runat="server"></asp:Label></td>
                </tr>
               
            </table>
                 
                 
            
            
    
    </div>
    </form>
</body>
</html>
