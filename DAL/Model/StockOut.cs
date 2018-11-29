using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectStockManagementApp.DAL.Model
{
    public class StockOut
    {
        public int Id { get; set; }
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public int Quantity { get; set; }
        public string Date { get; set; }
        public string OutAction { get; set; }


    }
}