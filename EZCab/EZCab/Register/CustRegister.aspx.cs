﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace EZCab.Register
{
    public partial class CustRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtUserName.Text) & !string.IsNullOrWhiteSpace(txtPassword.Text) & !string.IsNullOrWhiteSpace(txtEmail.Text) & !string.IsNullOrWhiteSpace(txtPhoneNum.Text) & !string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                // it is not empty or null!
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    lblWrongPassword.Text = "The Confirm Password is diferrent from Password. The Confirm Password must be same with Password";

                }
                else
                {
                    try
                    {
                        Boolean valid = false;

                        SqlConnection con;
                        string strCon = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
                        // string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                        con = new SqlConnection(strCon);
                        con.Open();

                        string strInsert = "";
                        SqlCommand cmdInsert;

                        strInsert = "Insert Into MEMBER (UserName, Password, Email, PhoneNum, Address ) Values (@username,@password, @email, @phonenum, @address )";

                        cmdInsert = new SqlCommand(strInsert, con);



                        cmdInsert.Parameters.AddWithValue("@username", txtUserName.Text);
                        cmdInsert.Parameters.AddWithValue("@password", txtPassword.Text);
                        cmdInsert.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmdInsert.Parameters.AddWithValue("@phonenum", txtPhoneNum.Text);
                        cmdInsert.Parameters.AddWithValue("@address", txtAddress.Text);



                        int intInsertStatus = cmdInsert.ExecuteNonQuery();

                        if (intInsertStatus > 0)
                        {
                            valid = true;
                            MessageBox.Show("Create Member Successfully. You are a Member Now. ");
                            con.Close();
                        }
                        else
                        {
                            lblMsg.Text = "Registration Failed. Please Enter All The Field Correctly.";
                            con.Close();
                        }

                        

                        if (valid)
                        {
                            Response.Redirect("~/Login/CustLogin.aspx");
                        }
                    }

                    catch 
                    {
                        MessageBox.Show("Invalid Email!!! This Email have been use by other. Please Use New Email. ");
                       
                    }

                }


            }
            else
            {
                lblMsg.Text = " <span style='color: red;'>Register User Fail!!! Please Enter All The Field!!!</span>";

                if (txtUserName.Text == "")
                {
                    lblNameNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtPassword.Text == "")
                {
                    lblPasswordNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtEmail.Text == "")
                {
                    lblEmailNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtPhoneNum.Text == "")
                {
                    lblNoNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtAddress.Text == "")
                {
                    lblAddNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
            }
        }
    }
}