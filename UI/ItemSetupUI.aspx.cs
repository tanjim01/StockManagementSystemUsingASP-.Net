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
    public partial class ItemSetupUI : System.Web.UI.Page
    {
        ItemManager itemManager = new ItemManager();
        CategoryManeger categoryManeger = new CategoryManeger();
        CompanySetupManager companySetupManager = new CompanySetupManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoryDropDownList.DataSource = categoryManeger.GetAllCategory();
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataValueField = "Id";
                categoryDropDownList.DataBind();
                companyDropDownList.DataSource = companySetupManager.GetAllCompanySetup();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataBind();

                ListItem listItem = new ListItem("<select>", "-1");
                categoryDropDownList.Items.Insert(0, listItem);
                companyDropDownList.Items.Insert(0, listItem);
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Item items = new Item();
            items.Name = itemNameTextBox.Text;
            items.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            items.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
            if (reorderLevelTextBox.Text != "")
            {
                int tempRLevel=Convert.ToInt32(reorderLevelTextBox.Text);
                if (tempRLevel >= 0)
                {
                    items.ReorderLevel = Convert.ToInt32(reorderLevelTextBox.Text);
                    string message = itemManager.Save(items);
                    //Response.Write(message);
                    outputLabel.Text = message;

                    //categoryDropDownList.SelectedIndex = null;
                    //companyDropDownList = null;
                    itemNameTextBox.Text = String.Empty;
                    reorderLevelTextBox.Text = String.Empty;
                }
                else
                {
                    string message = "Enter a Valid Reorder Level!";
                    outputLabel.Text = message;
                }
                
            }
            else
            {
                string message = "Enter Validate input!";
                outputLabel.Text = message;
                //Response.Write("Enter Validate input!");
            }
        }

        
    }
}