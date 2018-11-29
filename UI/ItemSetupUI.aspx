<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemSetupUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.ItemSetupUI" %>

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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

       
                <h3>Item Setup</h3>
           


            <table class="center1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="categoryDropDownList" runat="server" Height="16px" Width="166px"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Company"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="companyDropDownList" runat="server" Height="18px" Width="169px"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Item Name"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="itemNameTextBox" runat="server" TextMode="SingleLine" Width="162px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Reorder Level"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="reorderLevelTextBox" runat="server" TextMode="Number" Width="166px"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="saveButton" runat="server" Text="Save" Width="80px" OnClick="saveButton_Click" /></td>
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
