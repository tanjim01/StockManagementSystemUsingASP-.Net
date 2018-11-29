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
    public partial class CompanySetupUI : System.Web.UI.Page
    {
        CompanySetupManager companySetupManager = new CompanySetupManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            companyListGridView.DataSource = companySetupManager.GetAllCompanySetup();
            companyListGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            CompanySetup aCompanySetup = new CompanySetup();

            aCompanySetup.Name = companyNameTextBox.Text;

            string message = companySetupManager.Save(aCompanySetup);
            outputLabel.Text = message;
            companyNameTextBox.Text = "";
            companyListGridView.DataSource = companySetupManager.GetAllCompanySetup();
            companyListGridView.DataBind();

        }
    }
}