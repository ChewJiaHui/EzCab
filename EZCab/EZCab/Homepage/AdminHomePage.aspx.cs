using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EZCab.Homepage
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEditCust_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditMember.aspx");

        }

        protected void btnEditdri_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reservation/Reservation.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reservation/ReservationHistory.aspx");
        }
    }
}