using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectStockManagementApp.DAL.Gateway;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.BLL
{
    public class CategoryManeger
    {
        private CategorySetupGateway categoryGateway = new CategorySetupGateway();

        public string Save(CategoryInput input)
        {

            if (categoryGateway.IsExists(input.Name) || (categoryGateway.IsEmpty(input.Name)))
            {
                return "This Category Type is Already Exists Or Type cant be empty";
            }
            else
            {
                int rowAffect = categoryGateway.Save(input);
                if (rowAffect > 0)
                {
                    
                    return "Save Successful";
                }
                else
                {
                    return "Save Failed";

                }
            }
        }

        public List<CategoryInput> GetAllCategory()
        {
            return categoryGateway.GetAllCategory();
        }

        public CategoryInput GetCategoryById(int id)
        {
            return categoryGateway.GetCategoryById(id);
        }

        public string UpdateById(CategoryInput input)
        {
            int rowAffect = categoryGateway.UpdateById(input);
            if (rowAffect > 0)
            {
                return "Update Successful";
            }
            else
            {
                return "Update Failed";
            }
        }
    }
}