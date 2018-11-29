using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.DAL.Gateway
{
    public class CategorySetupGateway
    {
        //CategoryInput inputCategory = new CategoryInput();
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        public CategorySetupGateway()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Input"].ConnectionString;
            connection = new SqlConnection(connectionString);
            //Command = new SqlCommand();
        }

        public int Save(CategoryInput input)
        {
            string query = "INSERT INTO Category(Name)" +
                           " VALUES(@categoryName)";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@categoryName",input.Name);

            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }

        public bool IsExists(string categoryName)
        {
            string query = "SELECT * FROM Category WHERE Name=@categoryName";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@categoryName", categoryName);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExists = reader.HasRows;
            connection.Close();
            return isExists;
        }

        public bool IsEmpty(string categoryName)
        {
            bool isEmpty = string.IsNullOrEmpty(categoryName);
            return isEmpty;
        }

        public List<CategoryInput> GetAllCategory()
        {
            string query = "SELECT * FROM Category";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<CategoryInput> categoryList = new List<CategoryInput>();

            while (reader.Read())
            {
                CategoryInput input = new CategoryInput();
                input.ID = Convert.ToInt32(reader["Id"]);
                input.Name = reader["Name"].ToString();
                categoryList.Add(input);
            }
            reader.Close();
            connection.Close();
            return categoryList;
        }

        public CategoryInput GetCategoryById(int id)
        {
            string query = "SELECT * FROM Category WHERE Id=@id";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            CategoryInput input = new CategoryInput();

            if(reader.HasRows)
            {
                //CategoryInput input = new CategoryInput();
                input.ID = Convert.ToInt32(reader["ID"]);
                input.Name = reader["Name"].ToString();
                
            }
            reader.Close();
            connection.Close();
            return input;
        }

        public int UpdateById(CategoryInput input)
        {
            string query = "Update Category SET Name = @categoryName WHERE Id = @id";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@id", input.ID);
            command.Parameters.AddWithValue("@categoryName", input.Name);
            
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        

    }
}