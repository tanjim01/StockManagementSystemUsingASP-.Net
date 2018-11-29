using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectStockManagementApp.BLL;
using ProjectStockManagementApp.DAL.Model;

namespace ProjectStockManagementApp.UI
{
    public partial class StockOutUI : System.Web.UI.Page
    {
        CompanySetupManager aComanySetupManager=new CompanySetupManager();
        ItemManager aItemManager=new ItemManager();
        StockOutManager aStockOutManager=new StockOutManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = aComanySetupManager.GetAllCompanySetup();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataBind();

                ListItem listItem = new ListItem("<SELECT>", "-1");
                companyDropDownList.Items.Insert(0, listItem);

                itemDropDownList.Items.Insert(0, listItem);
            }
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex == 0) { }
            else
            {
                int id = Convert.ToInt32(companyDropDownList.SelectedValue);
                itemDropDownList.DataSource = aItemManager.GetAllItemByCompanyId(id);
                itemDropDownList.DataTextField = "Name";
                itemDropDownList.DataValueField = "Id";
                itemDropDownList.DataBind();

                ListItem listItem = new ListItem("<SELECT>", "-1");
                itemDropDownList.Items.Insert(0, listItem);
                availabeQuantityTextBox.Text = "";
                reorderLevelTextBox.Text = "";
                stockOutQuantityTextBox.Text = "";
            }
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (itemDropDownList.SelectedIndex == 0) { }
            else
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                int itemId = Convert.ToInt32(itemDropDownList.SelectedValue);
                Item aItem = aItemManager.GetQuantityRLevelByIds(companyId, itemId);
                aItem.CompanyName = aComanySetupManager.GetCOmpanyById(companyId);
                reorderLevelTextBox.Text = aItem.ReorderLevel.ToString();

                int total = 0;
                int flag = 0;
                if (ViewState["StockOut"] != null)
                {
                    List<Item> itemList = (List<Item>)ViewState["StockOut"];
                    foreach (Item value in itemList)
                    {
                        if (aItem.Id == value.Id)
                        {
                            total = value.StockOutQuantity + total;
                        }
                    }
                    if (aItem.AvailableQuantity > total)
                    {
                        total = aItem.AvailableQuantity - total;
                        flag = 1;
                    }
                    if (flag == 0)
                    {
                        availabeQuantityTextBox.Text = aItem.AvailableQuantity.ToString();
                    }
                    else
                    {
                        availabeQuantityTextBox.Text = total.ToString();
                    }
                }
                else
                {
                    availabeQuantityTextBox.Text = aItem.AvailableQuantity.ToString();
                }

            }
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            if ((companyDropDownList.SelectedIndex == 0 && itemDropDownList.SelectedIndex == 0) || companyDropDownList.SelectedIndex == 0 || itemDropDownList.SelectedIndex == 0)
            {
                string message = "Please select perfectly";
                outputLabel.Text = message;
            }
            else
            {
                if (companyDropDownList.SelectedIndex != 0 || itemDropDownList.SelectedIndex != 0)
                {
                    int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                    int itemId = Convert.ToInt32(itemDropDownList.SelectedValue);
                    Item aItem = aItemManager.GetQuantityRLevelByIds(companyId, itemId);
                    aItem.CompanyName = aComanySetupManager.GetCOmpanyById(companyId);
                    if (stockOutQuantityTextBox.Text != "")
                    {
                        int tempStockOut = Convert.ToInt32(stockOutQuantityTextBox.Text);
                        if ((tempStockOut > 0) && (tempStockOut <= aItem.AvailableQuantity))
                        {
                            aItem.StockOutQuantity = Convert.ToInt32(stockOutQuantityTextBox.Text);
                            if (ViewState["StockOut"] == null)
                            {
                                List<Item> itemList = new List<Item>();
                                itemList.Add(aItem);

                                ViewState["StockOut"] = itemList;
                                stoukOutGridView.DataSource = itemList;
                                stoukOutGridView.DataBind();

                                companyDropDownList.SelectedIndex = 0;
                                itemDropDownList.SelectedIndex = 0;
                                availabeQuantityTextBox.Text = "";
                                reorderLevelTextBox.Text = "";
                                stockOutQuantityTextBox.Text = "";
                                sellButton.Visible = true;
                                damageButton.Visible = true;
                                lostButton.Visible = true;
                            }
                            else
                            {
                                List<Item> itemList = (List<Item>)ViewState["StockOut"];
                                int flag = 0;

                                foreach (Item value in itemList)
                                {
                                    if (value.Id == aItem.Id)
                                    {
                                        value.StockOutQuantity += aItem.StockOutQuantity;
                                        flag = 1;
                                        break;
                                    }
                                }
                                if (flag == 0)
                                {
                                    itemList.Add(aItem);
                                }

                                ViewState["StockOut"] = itemList;
                                stoukOutGridView.DataSource = itemList;
                                stoukOutGridView.DataBind();

                                companyDropDownList.SelectedIndex = 0;
                                itemDropDownList.SelectedIndex = 0;
                                availabeQuantityTextBox.Text = "";
                                reorderLevelTextBox.Text = "";
                                stockOutQuantityTextBox.Text = "";
                                sellButton.Visible = true;
                                damageButton.Visible = true;
                                lostButton.Visible = true;
                            }
                        }
                        else
                        {
                            string message = "Quantity can't grater than Available Quantity.!";
                            outputLabel.Text = message;
                            //Response.Write("Quantity can not be Negative");
                        }
                    }


                    else
                    {
                        string message = "Enter the fields perfectly!!";
                        outputLabel.Text = message;
                        //Response.Write("Enter the fields perfectly!!");
                    }
                }
                else
                {
                    string message = "Enter the fields perfectly!!";
                    outputLabel.Text = message;
                }
                 
            }
              
            
        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            List<Item> itemList = (List<Item>)ViewState["StockOut"];

            foreach (Item value in itemList)
            {
                StockOut aStockOut =new StockOut();
                aItemManager.UpdateQuantity(value);
                aStockOut.ItemId = value.Id;
                aStockOut.Quantity = value.StockOutQuantity;
                aStockOut.Date = DateTime.Now.ToString("yyyy-MM-dd");
                aStockOut.OutAction = "Sell";
                aStockOutManager.Save(aStockOut);

            }
            Response.Redirect("IndexUI.aspx");
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            List<Item> itemList = (List<Item>)ViewState["StockOut"];

            foreach (Item value in itemList)
            {
                StockOut aStockOut = new StockOut();
                aItemManager.UpdateQuantity(value);
                aStockOut.ItemId = value.Id;
                aStockOut.Quantity = value.StockOutQuantity;
                aStockOut.Date = DateTime.Now.ToString("dd-MM-yyyy");
                aStockOut.OutAction = "Damage";
                aStockOutManager.Save(aStockOut);

            }
            Response.Redirect("IndexUI.aspx");
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            List<Item> itemList = (List<Item>)ViewState["StockOut"];

            foreach (Item value in itemList)
            {
                StockOut aStockOut = new StockOut();
                aItemManager.UpdateQuantity(value);
                aStockOut.ItemId = value.Id;
                aStockOut.Quantity = value.StockOutQuantity;
                aStockOut.Date = DateTime.Now.ToString("yyyy-MM-dd");
                aStockOut.OutAction = "Lost";
                aStockOutManager.Save(aStockOut);

            }
            Response.Redirect("IndexUI.aspx");
        }
    }
}