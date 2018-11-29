using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectStockManagementApp.BLL;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.UI
{
    public partial class StockInUI : System.Web.UI.Page
    {
        CompanySetupManager aComanySetupManager = new CompanySetupManager();
        ItemManager aItemManager = new ItemManager();
        //StockOutManager aStockOutManager = new StockOutManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = aComanySetupManager.GetAllCompanySetup();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataBind();

                ListItem listItem = new ListItem("<SELECT>", "-1");
                companyDropDownList.Items.Insert(0, listItem);

                itemDropDownList.Items.Insert(0, listItem);
            }
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex == 0)
            {
                ListItem listItem = new ListItem("<SELECT>", "-1");
                itemDropDownList.Items.Insert(0, listItem);
                availabeQuantityTextBox.Text = "";
                reorderLevelTextBox.Text = "";
                stockInQuantityTextBox.Text = "";
            }
            else
            {
                int id = Convert.ToInt32(companyDropDownList.SelectedValue);
                itemDropDownList.DataSource = aItemManager.GetAllItemByCompanyId(id);
                itemDropDownList.DataTextField = "Name";
                itemDropDownList.DataValueField = "Id";
                itemDropDownList.DataBind();

                ListItem listItem = new ListItem("<SELECT>", "-1");
                itemDropDownList.Items.Insert(0, listItem);
                availabeQuantityTextBox.Text = "";
                reorderLevelTextBox.Text = "";
                stockInQuantityTextBox.Text = "";
            }
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (itemDropDownList.SelectedIndex == 0){}
            else
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                int itemId = Convert.ToInt32(itemDropDownList.SelectedValue);
                itemIdHiddenField.Value = itemId.ToString();
                Item aItem = aItemManager.GetQuantityRLevelByIds(companyId, itemId);
                aItem.CompanyName = aComanySetupManager.GetCOmpanyById(companyId);
                reorderLevelTextBox.Text = aItem.ReorderLevel.ToString();
                availabeQuantityTextBox.Text = aItem.AvailableQuantity.ToString();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            output.Text = "";
            if (stockInQuantityTextBox.Text == "" || itemDropDownList.SelectedIndex == 0 || companyDropDownList.SelectedIndex == 0)
            {
                string message = "Enter Data Perfectly!!";
                output.Text = message;
                //Response.Write("Enter Data Perfectly!!");
            }
            else
            {
                Item aItem = new Item();
                aItem.Id = Convert.ToInt32(itemIdHiddenField.Value);
                int tempStockIn = Convert.ToInt32(stockInQuantityTextBox.Text);
                if (tempStockIn > 0)
                {
                    aItem.StockInQuantity = Convert.ToInt32(stockInQuantityTextBox.Text);
                    aItemManager.SaveStockIn(aItem);
                    Response.Redirect("StockInUI.aspx");
                }
                else
                {
                    string message = "Quantity can not be Negative";
                    output.Text = message;
                
                    //Response.Write("Quantity can not be Negative");
                }
                
            }

        }
    }
}