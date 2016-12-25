using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EZCab.Payment
{
    public partial class payment : System.Web.UI.Page
    {
        public double val_amount;



        protected void Page_Load(object sender, EventArgs e)
        {

            lblName.Text = (String)Session["Username"];
            lblDepart.Text = (String)Session["pickUpAddress"];
            lblArrive.Text = (String)Session["destination"];
            lblPrice.Text = (String)Session["price"];
            val_amount = Convert.ToDouble(lblPrice.Text);




        }



        protected void cbTerm_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage/AdminHomePage.aspx");
        }


    }
}