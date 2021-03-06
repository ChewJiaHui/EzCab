﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Windows.Forms;

namespace EZCab
{
    public partial class CustLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogim_Click(object sender, EventArgs e)
        {
            Boolean valid = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString);
            conn.Open();
            string login = "Select * FROM MEMBER where Email = @email and Password = @password";
            SqlCommand cmd = new SqlCommand(login, conn);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            try
            {
                string userName = rd.GetString(0);
                MessageBox.Show("Login Successful! Welcome Back " + userName);
                Session["Username"] = userName;
                Session["Email"] = rd.GetString(2);
                valid = true;
                rd.Close();
                conn.Close();



            }
            catch
            {
                MessageBox.Show("Invalid Username or Password! Please Try Again!");
                rd.Close();
                conn.Close();

            }
            if (valid)
            {
                Response.Redirect("~/Homepage/AdminHomePage.aspx");
            }

        }


    }
}

        
   

