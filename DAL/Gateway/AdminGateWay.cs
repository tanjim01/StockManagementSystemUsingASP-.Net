using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ProjectStockManagementApp.DAL.Gateway
{
    public class AdminGateWay:BaseGateway
    {
        public bool CheckName(string name)
        {
            string query = "SELECT * FROM Admin WHERE Name=@name";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Name", name);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }

        public bool CheckPassword(string password)
        {
            string query = "SELECT * FROM Admin WHERE Password=@password";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@password", password);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }
    }
}