using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Windows.Forms;
using System.Configuration;

namespace EZCab
{
    public partial class driverLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Boolean valid = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString);
            conn.Open();
            string login = "Select * FROM DRIVER where DriverID = @driverid and ContactNo = @contactno";
            SqlCommand cmd = new SqlCommand(login, conn);
            cmd.Parameters.AddWithValue("@DriverID", txtID.Text);
            cmd.Parameters.AddWithValue("@contactno", txtPhone.Text);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            try
            {
                MessageBox.Show("Login Successful! Welcome Back " + rd.GetString(1));
                Session["DriverID"] = rd.GetString(0);
                rd.Close();
                conn.Close();
                valid = true;

            }
            catch
            {
                MessageBox.Show("Invalid Username or Password! Please Try Again!");
                rd.Close();
                conn.Close();
            }

            if (valid)
            {
                Response.Redirect("~/Email/Notification.aspx");
            }
        }
    }
}