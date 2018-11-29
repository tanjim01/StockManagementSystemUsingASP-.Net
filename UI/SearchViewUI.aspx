<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchViewUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.SearchViewUI" %>

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
        <h3>Search Item</h3>

        <table class="center1">
            
            <tr>
                
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label></td>
                <td class="auto-style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="companyDropDownList" runat="server" Height="16px" Width="203px" style="margin-left: 0px"></asp:DropDownList></td>

            </tr>
            
            <tr>
                
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Text="Category"></asp:Label></td>
                <td class="auto-style5">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="categoryDropDownList" runat="server" Height="16px" Width="206px" style="margin-left: 2px"></asp:DropDownList></td>

            </tr>
            
            <tr>
                
                <td class="auto-style2"></td>
                <td class="auto-style3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="searchButton" runat="server" Text="Search" Width="91px" OnClick="searchButton_Click" /></td>

            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="outputLabel" runat="server"></asp:Label></td>
            </tr>

        </table>
        
        <br/>
        <br/>
        <br/>
        
        <asp:GridView ID="itemGridView" runat="server" AutoGenerateColumns="False" Width="697px" CssClass="center1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            
            <Columns>
                    
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<% #Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<% #Eval("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<% #Eval("AvailableQuantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                <asp:TemplateField HeaderText="Reorder Level">
                        <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<% #Eval("ReorderLevel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>

            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
