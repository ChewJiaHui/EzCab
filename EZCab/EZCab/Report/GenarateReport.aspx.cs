using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EZCab.Report
{
    public partial class GenarateReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            viewRe.Visible = false;
            viewTrans.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedIndex == 1)
            {
                viewRe.Visible = true;
                viewTrans.Visible = false;
            }
            else if (ddlType.SelectedIndex == 2)
            {
                viewTrans.Visible = true;
                viewRe.Visible = false;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SelectionAdmin.aspx");
        }
    }
}