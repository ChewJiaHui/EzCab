using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;

namespace EZCab
{
    public partial class EditMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string email = (String)Session["Email"];

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString);
            // string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            //con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "";
            SqlCommand cmdSelect;

            strSelect = "Select * From MEMBER where Email = '" + email + "'";
            cmdSelect = new SqlCommand(strSelect, con);

            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            dtr.Read();


            if (dtr.HasRows)
            {
                txtUserName.Text = dtr["UserName"].ToString();
                txtEmail.Text = dtr["Email"].ToString();
                txtPhoneNum.Text = "0" + dtr["PhoneNum"].ToString();
                txtAddress.Text = dtr["Address"].ToString();


            }


            dtr.Close();
            con.Close();
        }

        protected void btnEditSave_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtUserName.Text) & !string.IsNullOrWhiteSpace(txtEmail.Text) & !string.IsNullOrWhiteSpace(txtPhoneNum.Text) & !string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                if (btnEditSave.Text == "Edit")
                {
                    txtUserName.ReadOnly = false;
                    txtPhoneNum.ReadOnly = false;
                    txtEmail.ReadOnly = false;
                    txtAddress.ReadOnly = false;
                    btnEditSave.Text = "Save";

                }
                else if (btnEditSave.Text == "Save")
                {
                    Boolean valid = false;
                    string email = (String)Session["Email"];

                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
                    // string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    con = new SqlConnection(strCon);
                    con.Open();

                    string strSelect = "";
                    SqlCommand cmdUpdate;

                    strSelect = "Update MEMBER Set UserName= @userName, Email= @email, PhoneNum= @phoneno, Address= @address Where Email= '" + email + "' ";
                    cmdUpdate = new SqlCommand(strSelect, con);

                    cmdUpdate.Parameters.AddWithValue("@userName", txtUserName.Text);
                    cmdUpdate.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmdUpdate.Parameters.AddWithValue("@phoneno", txtPhoneNum.Text);
                    cmdUpdate.Parameters.AddWithValue("@address", txtAddress.Text);




                    int n = cmdUpdate.ExecuteNonQuery();

                    if (n > 0)
                    {
                        valid = true;
                        MessageBox.Show("Save Member Successfully.");
                        con.Close();
                    }
                    else
                    {
                        lblMsg.Text = "Sorry, Member Details Update Failed.";
                        con.Close();
                    }


                    con.Close();


                    txtUserName.ReadOnly = true;
                    txtEmail.ReadOnly = true;
                    txtAddress.ReadOnly = true;
                    txtPhoneNum.ReadOnly = true;
                    btnEditSave.Text = "Edit";

                    if (valid)
                    {
                        Response.Redirect("~/Homepage/AdminHomePage.aspx");
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