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
    public partial class SearchViewUI : System.Web.UI.Page
    {
        CategoryManeger categoryManeger = new CategoryManeger();
        CompanySetupManager companySetupManager = new CompanySetupManager();
        ItemManager itemManager=new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = companySetupManager.GetAllCompanySetup();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataBind();
                categoryDropDownList.DataSource = categoryManeger.GetAllCategory();
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataValueField = "Id";
                categoryDropDownList.DataBind();

                ListItem listItem = new ListItem("<SELECT>", "-1");
                companyDropDownList.Items.Insert(0, listItem);
                categoryDropDownList.Items.Insert(0, listItem);
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex == 0 && categoryDropDownList.SelectedIndex == 0)
            {
                string message = "Please select for info!";
                outputLabel.Text = message;
                //Response.Write("Please select for info!");
            }
            else
            {
                if (companyDropDownList.SelectedIndex != 0 && categoryDropDownList.SelectedIndex != 0)
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                int categoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                List<Item> aItem=itemManager.GetItemsByCompanyCategory(companyId, categoryId);

                itemGridView.DataSource = aItem;
                itemGridView.DataBind();

                companyDropDownList.SelectedIndex = 0;
                categoryDropDownList.SelectedIndex = 0;
            }
            if (companyDropDownList.SelectedIndex != 0 && categoryDropDownList.SelectedIndex == 0)
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                List<Item> listItem = itemManager.GetAllItemsByCompanyId(companyId);
                itemGridView.DataSource = listItem;
                itemGridView.DataBind();

                companyDropDownList.SelectedIndex = 0;
                categoryDropDownList.SelectedIndex = 0;
            }
            if (companyDropDownList.SelectedIndex == 0 && categoryDropDownList.SelectedIndex != 0)
            {
                int categoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                List<Item> listItem = itemManager.GetAllItemsByCategoryId(categoryId);
                itemGridView.DataSource = listItem;
                itemGridView.DataBind();

                companyDropDownList.SelectedIndex = 0;
                categoryDropDownList.SelectedIndex = 0;
            }
            }
            
            
        }
    }
}