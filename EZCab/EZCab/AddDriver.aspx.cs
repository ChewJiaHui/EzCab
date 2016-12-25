using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Windows.Forms;

namespace EZCab
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCarPlate.Visible = false;
            lblICnotNull.Visible = false;
            lblNameNotNull.Visible = false;
            lblNoNotNull.Visible = false;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
            // string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "";
            SqlCommand cmdSelect;

            strSelect = "Select Count(*) From DRIVER ";
            cmdSelect = new SqlCommand(strSelect, con);

            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            dtr.Read();
            int total = dtr.GetInt32(0);
            total += 1;
            String driverID = "KL16" + total.ToString("000");

            txtDriverID.Text = driverID.ToString();

            con.Close();
        }

        protected void btnAddDriver_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtDriverName.Text) & !string.IsNullOrWhiteSpace(txtICNO.Text) & !string.IsNullOrWhiteSpace(txtPhoneNum.Text) & !string.IsNullOrWhiteSpace(txtCarPlateNo.Text))
            {
                Boolean valid = false;
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
                // string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();

                string strInsert = "";
                SqlCommand cmdInsert;

                strInsert = "Insert Into DRIVER (DriverID, DriverName, ICNO, CarPlateNo, ExpiredDriverLicense, ContactNo ) Values (@driverID, @driverName, @icno, @carplateno, @expireddriverlicense, @contactNo )";

                cmdInsert = new SqlCommand(strInsert, con);



                cmdInsert.Parameters.AddWithValue("@driverID", txtDriverID.Text);
                cmdInsert.Parameters.AddWithValue("@driverName", txtDriverName.Text);
                cmdInsert.Parameters.AddWithValue("@icno", txtICNO.Text);
                cmdInsert.Parameters.AddWithValue("@carplateno", txtCarPlateNo.Text);
                cmdInsert.Parameters.AddWithValue("@contactno", txtPhoneNum.Text);

                DateTime dtUserDate;
                dtUserDate = Calendar1.SelectedDate;

                cmdInsert.Parameters.AddWithValue("@expireddriverlicense", dtUserDate);




                int intInsertStatus = cmdInsert.ExecuteNonQuery();

                if (intInsertStatus > 0)
                {
                    valid = true;
                    MessageBox.Show("Create Driver Successfully.");
                    con.Close();
                }
                else
                {
                    lblMsg.Text = "Create Drive Failed.";
                    con.Close();
                }



                if (valid)
                {
                    Response.Redirect("~/SelectionAdmin.aspx");
                }

            }
            else
            {
                lblMsg.Text = " <span style='color: red;'>Add Driver Fail!!! Please Enter All The Field!!!</span>";

                if (txtDriverName.Text == "")
                {
                    lblNameNotNull.Visible = true;

                    lblNameNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }

                if (txtICNO.Text == "")
                {
                    lblICnotNull.Visible = true;

                    lblICnotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtCarPlateNo.Text == "")
                {
                    lblCarPlate.Visible = true;

                    lblCarPlate.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtPhoneNum.Text == "")
                {
                    lblNoNotNull.Visible = true;

                    lblNoNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }

            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SelectionAdmin.aspx");
        }







    }
}