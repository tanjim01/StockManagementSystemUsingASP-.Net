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
    public partial class CategorySetupUI : System.Web.UI.Page
    {
        
        private CategoryManeger maneger = new CategoryManeger(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            CategorySetupGridView.DataSource = maneger.GetAllCategory();
            CategorySetupGridView.DataBind();
        }

        protected void categorySaveButton_OnClick(object sender, EventArgs e)
        {
            CategoryInput input = new CategoryInput();
            input.Name = CategoryInputTextBox.Text;

            string message = maneger.Save(input);
            output.Text = message;

            CategorySetupGridView.DataSource = maneger.GetAllCategory();
            CategorySetupGridView.DataBind();
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            LinkButton linkButton = sender as LinkButton;
            DataControlFieldCell cell = linkButton.Parent as DataControlFieldCell;
            GridViewRow row = cell.Parent as GridViewRow;
            HiddenField hiddenField = row.FindControl("idHiddenField") as HiddenField;
            int id = Convert.ToInt32(hiddenField.Value);
            Response.Write(hiddenField.Value);
            Response.Redirect("CategoryUpdateUI.aspx?Id="+id);
        }

    }
}