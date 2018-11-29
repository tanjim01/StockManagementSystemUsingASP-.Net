using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectStockManagementApp.DAL.Gateway;

namespace ProjectStockManagementApp.BLL
{
    public class AdminManager
    {
        AdminGateWay aAdminGateWay=new AdminGateWay();
        public bool IsExistAdminName(string name)
        {
            return aAdminGateWay.CheckName(name);
        }

        public bool IsExistAdminPassword(string password)
        {
            return aAdminGateWay.CheckName(password);
        }
    }
}