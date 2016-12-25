﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Configuration;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace EZCab
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Boolean valid = false;
            if (txtAdminID.Text == "Admin" && txtPassword.Text == "abc123")
            {
                 try
                 {
                    MessageBox.Show("Login Successful! Welcome Back " + txtAdminID.Text );
                    valid = true;
                 }

                 catch
                 {
                     MessageBox.Show("Invalid AdminID or Password! Please Try Again!");

                 }
                 if (valid)
                 {
                     Response.Redirect("~/SelectionAdmin.aspx");
                 }
               
            }
            else
            {
                MessageBox.Show("Invalid AdminID or Password! Please Try Again!");
            }
        }
    }
}