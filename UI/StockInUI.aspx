<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.StockInUI" %>

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
         .auto-style1 {
             width: 172px;
         }
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

          
                <h3>Stock In</h3>
           
    
            <table class="center1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="companyDropDownList" runat="server" Height="16px" Width="130px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Item"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="itemDropDownList" runat="server" Width="131px" Height="16px" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Reorder Level"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="reorderLevelTextBox" TextMode="Number" runat="server" ReadOnly="True"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Available Quantity"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="availabeQuantityTextBox" TextMode="Number" runat="server" ReadOnly="True"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Stock In Quantity"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="stockInQuantityTextBox" TextMode="Number" runat="server"></asp:TextBox></td>
                        <asp:HiddenField ID="itemIdHiddenField" runat="server" />
                </tr>
                <tr>
                    <td></td>
                    <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="saveButton" runat="server" Text="Save" Width="70px" OnClick="saveButton_Click" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="output" runat="server"></asp:Label></td>
                </tr>
            </table>
            
    </form>
</body>
</html>
