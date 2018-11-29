using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.DAL.Gateway
{
    public class ItemGateway : BaseGateway
    {
        CompanySetupGateway aCompanySetupGateway=new CompanySetupGateway();
        public List<Item> GetAllItemByCompanyId(int id)
        {
            string query = "SELECT * FROM Item WHERE CompanyId=@id";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@id", id);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (Reader.Read())
            {
                Item inputItem = new Item();
                inputItem.Id = Convert.ToInt32(Reader["Id"]);
                inputItem.Name = Reader["Name"].ToString();
                inputItem.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
                inputItem.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
                itemList.Add(inputItem);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public Item GetQuantityRLevelByIds(int companyId, int itemId)
        {
            string query = "SELECT * FROM Item WHERE CompanyId=@cId AND Id=@id";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@cid", companyId);
            Command.Parameters.AddWithValue("@id", itemId);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            Item inputItem = new Item();
            inputItem.Id = Convert.ToInt32(Reader["Id"]);
            inputItem.Name = Reader["Name"].ToString();
            inputItem.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
            inputItem.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
            inputItem.AvailableQuantity = Convert.ToInt32(Reader["AvailableQuantity"]);
            inputItem.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
            Reader.Close();
            Connection.Close();
            return inputItem;
        }

        public void UpdateQuantity(Item value)
        {
            string query = "UPDATE Item SET AvailableQuantity-=@quantity WHERE Id=@id";
            Command = new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@quantity", value.StockOutQuantity);
            Command.Parameters.AddWithValue("@id",value.Id);

            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();
        }

        public List<Item> GetItemsByCompanyCategoryId(int companyId, int categoryId)
        {
            string query = "SELECT * FROM Item WHERE CompanyId=@cId AND CategoryId=@caId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@cid", companyId);
            Command.Parameters.AddWithValue("@caid", categoryId);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (Reader.Read())
            {
                Item inputItem = new Item();
                inputItem.Id = Convert.ToInt32(Reader["Id"]);
                inputItem.Name = Reader["Name"].ToString();
                inputItem.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
                inputItem.CompanyName = aCompanySetupGateway.GetCompanyById(inputItem.CompanyId);
                inputItem.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
                inputItem.AvailableQuantity = Convert.ToInt32(Reader["AvailableQuantity"]);
                inputItem.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                itemList.Add(inputItem);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public List<Item> GetAllItemsByCategoryId(int categoryId)
        {
            string query = "SELECT * FROM Item WHERE CategoryId=@caId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@caid", categoryId);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();
            while (Reader.Read())
            {
                Item inputItem = new Item();
                inputItem.Id = Convert.ToInt32(Reader["Id"]);
                inputItem.Name = Reader["Name"].ToString();
                inputItem.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
                inputItem.CompanyName = aCompanySetupGateway.GetCompanyById(inputItem.CompanyId);
                inputItem.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
                inputItem.AvailableQuantity = Convert.ToInt32(Reader["AvailableQuantity"]);
                inputItem.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                itemList.Add(inputItem);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public List<Item> GetAllItemsByCompanyId(int companyId)
        {
            string query = "SELECT * FROM Item WHERE CompanyId=@caId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@caid", companyId);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();
            while (Reader.Read())
            {
                Item inputItem = new Item();
                inputItem.Id = Convert.ToInt32(Reader["Id"]);
                inputItem.Name = Reader["Name"].ToString();
                inputItem.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
                inputItem.CompanyName = aCompanySetupGateway.GetCompanyById(inputItem.CompanyId);
                inputItem.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
                inputItem.AvailableQuantity = Convert.ToInt32(Reader["AvailableQuantity"]);
                inputItem.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                itemList.Add(inputItem);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public string GetItemNameById(int itemId)
        {
            string query = "SELECT * FROM Item WHERE Id=@id";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@id", itemId);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            string itemName = Reader["Name"].ToString();
            Reader.Close();
            Connection.Close();
            return itemName;
        }

        public void SaveStockIn(Item aItem)
        {
            string query = "UPDATE Item SET AvailableQuantity+=@quantity WHERE Id=@id";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@quantity", aItem.StockInQuantity);
            Command.Parameters.AddWithValue("@id", aItem.Id);

            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();
        }
        public bool IsExists(string name)
        {
            string query = "SELECT * FROM Item WHERE Name=@name";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Name", name);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }

        public bool IsEmpty(string name)
        {
            bool isEmpty = string.IsNullOrEmpty(name);
            return isEmpty;
        }

        public int Save(Item input)
        {
            string query =
                "INSERT INTO Item(CompanyId,CategoryId,Name,AvailableQuantity,ReorderLevel) VALUES(@companyid,@categoryid,@name,@availableQuantity,@reorderlevel)";
            Command = new SqlCommand(query, Connection);
            input.AvailableQuantity = 0;
            Command.Parameters.AddWithValue("@companyid", input.CompanyId);
            Command.Parameters.AddWithValue("@categoryid", input.CategoryId);
            Command.Parameters.AddWithValue("@name", input.Name);
            Command.Parameters.AddWithValue("@availableQuantity", input.AvailableQuantity);
            Command.Parameters.AddWithValue("@reorderlevel", input.ReorderLevel);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();

            return rowAffect;
        }

        public string GetCompanyNameByItemId(int itemId)
        {
            string query = "SELECT * FROM Item WHERE Id=@id";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@id", itemId);
            string companyName = "";
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            int companyId = Convert.ToInt32(Reader["CompanyId"]);
            companyName = aCompanySetupGateway.GetCompanyById(companyId);
            Reader.Close();
            Connection.Close();
            return companyName;
        }
    }
}