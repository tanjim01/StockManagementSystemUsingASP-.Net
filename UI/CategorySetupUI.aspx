<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategorySetupUI.aspx.cs" Inherits="ProjectStockManagementApp.UI.CategorySetupUI" %>

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

       
        <div><h3>Category Name</h3></div>
        
        <div>
            
            <table class="center1">
                <tr>
                    
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="CategoryInputTextBox" runat="server" TextMode="SingleLine" Width="158px"></asp:TextBox></td>

                </tr>
               
            </table>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="categorySaveButton" runat="server" OnClick="categorySaveButton_OnClick" Text="Save" Width="60px" />
            
            
            <br />
            <br/>
            <br/>
            <asp:Label ID="output" runat="server"></asp:Label>
            
            
            <asp:GridView ID="CategorySetupGridView" runat="server" Width="180px" AutoGenerateColumns="False" CssClass="center1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                
                <Columns>
                    
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                    <%--<asp:Label runat="server" Text='<% #Eval("Id") %>'></asp:Label>--%>  
                             <%# Container.DataItemIndex + 1 %>
                            <asp:HiddenField ID="idHiddenField" Value='<% #Eval("Id") %>' runat="server"/>                          
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CategoryName">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<% #Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton  runat="server" OnClick="LinkButton_Click">Update</asp:LinkButton>
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
    
    </div>
    </form>
</body>
</html>
