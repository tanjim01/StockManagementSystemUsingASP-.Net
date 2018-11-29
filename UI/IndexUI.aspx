<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.IndexUI" %>

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
            width: 299px;
        }
        .auto-style2 {
            height: 30px;
        }
        .auto-style3 {
            width: 299px;
            height: 30px;
        }
        .auto-style4 {
            height: 25px;
        }
        .auto-style5 {
            width: 299px;
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #99FFCC" class="center">
        
        
        <h1 class="solid">Stock Management System</h1>
        
        <div>
            
            <asp:HyperLink runat="server" NavigateUrl="CategorySetupUI.aspx" Width="151px">Category Setup</asp:HyperLink>
        <br/>
        <br/>
        <asp:HyperLink runat="server" NavigateUrl="CompanySetupUI.aspx" Width="151px">Company Setup</asp:HyperLink>
        <br/>
        <br/>
        <asp:HyperLink runat="server" NavigateUrl="ItemSetupUI.aspx" Width="151px">Item Setup</asp:HyperLink>
        <br/>
        <br/>
        <asp:HyperLink runat="server" NavigateUrl="StockInUI.aspx" Width="151px">Stock In</asp:HyperLink>
        <br/>
        <br/>
        <asp:HyperLink runat="server" NavigateUrl="StockOutUI.aspx" Width="151px">Stock Out</asp:HyperLink>
        <br/>
        <br/>
        <asp:HyperLink runat="server" NavigateUrl="SearchViewUI.aspx" Width="151px">Search Items</asp:HyperLink>
        <br/>
        <br/>
        <asp:HyperLink runat="server" NavigateUrl="SearchByDate.aspx" Width="151px">View Sales</asp:HyperLink>

        </div>
        
        
    
            </div>
    </form>
</body>
</html>
