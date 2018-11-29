using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ProjectStockManagementApp.DAL.Gateway
{
    public class BaseGateway
    {
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        //public SqlConnection Connection;
        //public SqlCommand Command;
        //public SqlDataReader Reader;

        public BaseGateway()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Input"].ConnectionString; 
            Connection = new SqlConnection(connectionString);

        }
    }
}