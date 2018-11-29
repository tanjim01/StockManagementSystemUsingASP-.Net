using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectStockManagementApp.DAL.Model
{
    [Serializable]
    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int  CategoryId { get; set; }
        public int AvailableQuantity { get; set; }
        public int StockOutQuantity { get; set; }
        public int ReorderLevel { get; set; }
        public int StockInQuantity { get; set; }

    }
}