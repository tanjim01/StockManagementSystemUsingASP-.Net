using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectStockManagementApp.DAL.Gateway;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.BLL
{
    public class StockOutManager
    {
        StockOutGateway aStockOutGateway=new StockOutGateway();
        public void Save(StockOut aStockOut)
        {
            aStockOutGateway.Save(aStockOut);
        }

        public List<StockOut> StockFindByDate(string fromDate, string toDate)
        {
            return aStockOutGateway.StockFindByDate(fromDate, toDate);
        }
    }
}