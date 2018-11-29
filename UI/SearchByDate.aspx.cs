using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectStockManagementApp.BLL;
using ProjectStockManagementApp.DAL.Gateway;

namespace ProjectStockManagementApp.UI
{
    public partial class SearchByDate : System.Web.UI.Page
    {
        StockOutManager aStockOutManager=new StockOutManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fromCalendar.Visible = false;
                toCalendar.Visible = false;
            }
        }

        protected void fromImageButton_Click(object sender, ImageClickEventArgs e)
        {
            toCalendar.Visible = false;
            if (fromCalendar.Visible)
            {
                fromCalendar.Visible = false;
            }
            else
            {
                fromCalendar.Visible = true;
            }
        }

        protected void toImageButton_Click(object sender, ImageClickEventArgs e)
        {
            fromCalendar.Visible = false;
            if (toCalendar.Visible)
            {
                toCalendar.Visible = false;
            }
            else
            {
                toCalendar.Visible = true;
            }
        }

        protected void fromCalendar_SelectionChanged(object sender, EventArgs e)
        {
            fromTextBox.Text = fromCalendar.SelectedDate.ToString("yyyy-MM-dd");
            fromCalendar.Visible = false;
        }

        protected void toCalendar_SelectionChanged(object sender, EventArgs e)
        {
            toTextBox.Text = toCalendar.SelectedDate.ToString("yyyy-MM-dd");
            toCalendar.Visible = false;
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if ((fromTextBox.Text == "" && toTextBox.Text == "") || fromTextBox.Text == "" || toTextBox.Text == "")
            {
                string message = "Enter Valid Date.!";
                outputLabel.Text = message;
            }

            else
            {
                string fromDate = fromTextBox.Text;
                string toDate = toTextBox.Text;

                string fromSplitDate = fromDate.Substring(8, 2);
                int fromDateInt = Convert.ToInt32(fromSplitDate);
                string toSplitDate = toDate.Substring(8, 2);
                int toDateInt = Convert.ToInt32(toSplitDate);

                string fromSplitMonth = fromDate.Substring(5, 2);
                int fromMonthInt = Convert.ToInt32(fromSplitMonth);
                string toSplitMonth = toDate.Substring(5, 2);
                int toMonthInt = Convert.ToInt32(toSplitMonth);
                //Response.Write(fromDateInt + "    " + toDateInt+" "+fromMonthInt+" "+toMonthInt);

                if (fromDateInt <= toDateInt)
                {
                    //Response.Write("1.1");
                    if (fromMonthInt <= toMonthInt)
                    {
                        //Response.Write("1.2");
                        saleGridView.DataSource = aStockOutManager.StockFindByDate(fromDate, toDate);
                        saleGridView.DataBind();
                        outputLabel.Text = "";
                    }
                    else
                    {
                        //Response.Write("1.3");
                        string message = "From Date always less then To Date.!";
                        outputLabel.Text = message;

                        //Response.Write("From Date always less then To Date.!");
                    }
                }
                else if ((fromDateInt > toDateInt))
                {
                    //Response.Write("2.1");
                    if (fromMonthInt < toMonthInt)
                    {
                        //Response.Write("2.2");
                        saleGridView.DataSource = aStockOutManager.StockFindByDate(fromDate, toDate);
                        saleGridView.DataBind();
                        outputLabel.Text = "";
                    }
                    else
                    {
                        //Response.Write("2.3");
                        string message = "From Date always less then To Date.!";
                        outputLabel.Text = message;

                        //Response.Write("From Date always less then To Date.!");
                    }
                }
                else
                {
                    //Response.Write("3");
                    string message = "From Date always less then To Date.!";
                    outputLabel.Text = message;

                    // Response.Write("From Date always less then To Date.!");
                }
            }

            

        }

        
    }
}