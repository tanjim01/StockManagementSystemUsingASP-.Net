using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.DAL.Gateway
{
    public class CompanySetupGateway:BaseGateway
    {

        public int Save(CompanySetup aCompanySetup)
        {
            string query = "INSERT INTO Company(Name)" +
                           " VALUES(@companySetup)";
            Command = new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@companySetup", aCompanySetup.Name);

            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();

            return rowAffect;
        }

        public bool IsCompanyNameExist(string companyName)
        {
            string query = "SELECT * FROM Company WHERE Name=@companyName";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@companyName", companyName);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }

        public bool IsEmpty(string companyName)
        {
            bool isEmpty = string.IsNullOrEmpty(companyName);
            return isEmpty;
        }

        public List<CompanySetup> GetAllCompanySetup()
        {
            string query = "SELECT * FROM Company";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<CompanySetup> companyList = new List<CompanySetup>();

            while (Reader.Read())
            {
                CompanySetup inputCompanySetup = new CompanySetup();
                inputCompanySetup.Id = Convert.ToInt32(Reader["Id"]);
                inputCompanySetup.Name = Reader["Name"].ToString();
                companyList.Add(inputCompanySetup);
            }
            Reader.Close();
            Connection.Close();
            return companyList;
        }

        public string GetCompanyById(int companyId)
        {
            string query = "SELECT * FROM Company WHERE Id=@id";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@id", companyId);
            string name="";
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            name = Reader["Name"].ToString();
            Connection.Close();
            return name;
        }
    }
}