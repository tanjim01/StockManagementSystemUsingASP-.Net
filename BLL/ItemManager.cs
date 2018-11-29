using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectStockManagementApp.DAL.Gateway;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.BLL
{
    public class ItemManager
    {
        ItemGateway aItemGateway=new ItemGateway();
        public List<Item> GetAllItemByCompanyId(int id)
        {
            return aItemGateway.GetAllItemByCompanyId(id);
        }

        public Item GetQuantityRLevelByIds(int companyId, int itemId)
        {
            return aItemGateway.GetQuantityRLevelByIds(companyId, itemId);
        }

        public void UpdateQuantity(Item value)
        {
            aItemGateway.UpdateQuantity(value);
        }

        public List<Item> GetItemsByCompanyCategory(int companyId, int categoryId)
        {
            return aItemGateway.GetItemsByCompanyCategoryId(companyId, categoryId);
        }

        public List<Item> GetAllItemsByCategoryId(int categoryId)
        {
            return aItemGateway.GetAllItemsByCategoryId(categoryId);
        }

        public List<Item> GetAllItemsByCompanyId(int companyId)
        {
            return aItemGateway.GetAllItemsByCompanyId(companyId);
        }

        public void SaveStockIn(Item aItem)
        {
            aItemGateway.SaveStockIn(aItem);
        }

        public string Save(Item input)
        {
            if (aItemGateway.IsExists(input.Name) || (aItemGateway.IsEmpty(input.Name)))
            {
                return "This Category Type is Already Exists Or Type cant be empty";
            }
            else
            {
                int rowAffect = aItemGateway.Save(input);
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
    }
}