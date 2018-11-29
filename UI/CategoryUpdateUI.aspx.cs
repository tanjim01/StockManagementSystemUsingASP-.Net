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
    public partial class CategoryUpdateUI : System.Web.UI.Page
    {

       // HiddenField hiddenField = new HiddenField();
        CategoryManeger maneger = new CategoryManeger();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["Id"]);
                //Response.Write(id);
                //ID. = id);


                CategoryInput input = maneger.GetCategoryById(id);

                if (input != null)
                {
                    idHiddenField.Value = input.ID.ToString();
                    CategoryInputTextBox.Text = input.Name;
                }
            }

            

        }

        protected void categoryUpdateButton_Click(object sender, EventArgs e)
        {
            CategoryInput aInput = new CategoryInput();
            aInput.ID = Convert.ToInt32(idHiddenField.Value);
            if (CategoryInputTextBox.Text != "")
            {
                aInput.Name = CategoryInputTextBox.Text;
                maneger.UpdateById(aInput);
                Response.Redirect("CategorySetupUI.aspx");
            }
            else
            {
                string message = "Enter data perfectly!";
                outputLabel.Text = message;
                //Response.Write("Enter data perfectly!");
            }
        }

        
    }
}