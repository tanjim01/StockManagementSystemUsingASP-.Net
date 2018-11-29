<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.StockOutUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            text-align: justify;
        }
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
            width: 94%;
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

        <h3>Stock Out</h3>

        <table style="width: 359px" class="center1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label></td>
                <td class="auto-style1">
                    <asp:DropDownList ID="companyDropDownList" runat="server" Width="198px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
        
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Item"></asp:Label></td>
                <td class="auto-style1">
                    <asp:DropDownList ID="itemDropDownList" runat="server" Width="198px" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
        
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Reorder Level"></asp:Label></td>
                <td class="auto-style1">
                    <%--<asp:TextBox ID="reorderLevelTextBox" runat="server" Width="193px">&lt;view&gt;</asp:TextBox></td>--%>
                    <asp:TextBox ID="reorderLevelTextBox" TextMode="Number" runat="server" Width="193px" ReadOnly="True"></asp:TextBox></td>
            </tr>
        
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Availabe Quantity"></asp:Label></td>
                <td class="auto-style1">
                    <%--<asp:TextBox ID="availabeQuantityTextBox" runat="server" Width="192px">&lt;view&gt;</asp:TextBox></td>--%>
                    <asp:TextBox ID="availabeQuantityTextBox" TextMode="Number" runat="server" Width="192px" ReadOnly="True"></asp:TextBox></td>
            </tr>
        
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Stock Out Quantity"></asp:Label></td>
                <td class="auto-style1">
                    <asp:TextBox ID="stockOutQuantityTextBox" TextMode="Number" runat="server" Width="191px"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td></td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="addButton" runat="server" Text="Add" style="margin-left: 0px" Width="100px" OnClick="addButton_Click" /></td>
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
        
        <div>
            
            <asp:GridView ID="stoukOutGridView" runat="server" Width="813px" AutoGenerateColumns="False" CssClass="center1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<% #Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<% #Eval("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<% #Eval("StockOutQuantity") %>'></asp:Label>
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
            
            <table class="center1">
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="sellButton" runat="server" Text="Sell" Width="85px" OnClick="sellButton_Click" Visible="False" style="margin-left: 0px" /></td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="damageButton" runat="server" Text="Damage" Width="74px" OnClick="damageButton_Click" Visible="False" /></td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="lostButton" runat="server" Text="Lost" Width="74px" OnClick="lostButton_Click" Visible="False" /></td>
                </tr>
            </table>

        </div>

    </div>
    </form>
</body>
</html>
