<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchByDate.aspx.cs" Inherits="ProjectStockManagementApp.UI.SearchByDate" %>

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
            
            <h3>View Sales</h3>
            
            <table class="center1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="fromTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="fromImageButton" runat="server" Height="16px" ImageUrl="~/Images/Calender.jpg" Width="26px" OnClick="fromImageButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="toTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="toImageButton" runat="server" Height="16px" ImageUrl="~/Images/Calender.jpg" Width="27px" OnClick="toImageButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="outputLabel" runat="server"></asp:Label></td>
                </tr>
            </table>



            <asp:Calendar ID="fromCalendar" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="fromCalendar_SelectionChanged" Width="220px" >
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
            <asp:Calendar ID="toCalendar" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="toCalendar_SelectionChanged" ShowGridLines="True" Width="220px">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
            </asp:Calendar>
            <asp:GridView ID="saleGridView" runat="server" AutoGenerateColumns="False" CssClass="center1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<% #Eval("ItemName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% #Eval("CompanyName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% #Eval("Quantity")%>'></asp:Label>
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
            

            <br />

        </div>
    </form>
</body>
</html>
