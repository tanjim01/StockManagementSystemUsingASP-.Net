using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.DAL.Gateway
{
    public class StockOutGateway:BaseGateway
    {
        ItemGateway aItemGateway=new ItemGateway();
        public void Save(StockOut aStockOut)
        {
            string query = "INSERT INTO StockOut(ItemId,Quantity,Date,OutAction) VALUES(@id,@quantity,@date,@out)";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@id", aStockOut.ItemId);
            Command.Parameters.AddWithValue("@quantity", aStockOut.Quantity);
            Command.Parameters.AddWithValue("@date", aStockOut.Date);
            Command.Parameters.AddWithValue("@out", aStockOut.OutAction);

            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();
        }


        public List<StockOut> StockFindByDate(string fromDate, string toDate)
        {
            string query = "SELECT ItemId,SUM(Quantity) AS Total FROM StockOut WHERE Date BETWEEN @from AND @to AND OutAction='Sell' GROUP BY ItemId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@from", fromDate);
            Command.Parameters.AddWithValue("@to", toDate);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<StockOut> stockOutList = new List<StockOut>();
            while (Reader.Read())
            {
                StockOut aStockOut = new StockOut();
                aStockOut.ItemId = Convert.ToInt32(Reader["ItemId"]);
                aStockOut.ItemName=aItemGateway.GetItemNameById(aStockOut.ItemId);
                aStockOut.CompanyName = aItemGateway.GetCompanyNameByItemId(aStockOut.ItemId);
                aStockOut.Quantity = Convert.ToInt32(Reader["Total"]);
                
                stockOutList.Add(aStockOut);
            }
            Reader.Close();
            Connection.Close();
            return stockOutList;
        }
    }
}