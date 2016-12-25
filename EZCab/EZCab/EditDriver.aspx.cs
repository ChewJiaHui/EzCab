using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace EZCab
{
    public partial class EditDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEditSave_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtDriverName.Text) & !string.IsNullOrWhiteSpace(txtICNO.Text) & !string.IsNullOrWhiteSpace(txtPhoneNum.Text) & !string.IsNullOrWhiteSpace(txtCarPlateNo.Text))
            {
                if (btnEditSave.Text == "Edit")
                {
                    Calendar1.Visible = true;
                    txtDriverName.ReadOnly = false;
                    txtICNO.ReadOnly = false;
                    txtCarPlateNo.ReadOnly = false;
                    txtPhoneNum.ReadOnly = false;
                    btnEditSave.Text = "Save";

                }
                else if (btnEditSave.Text == "Save")
                {
                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
                    // string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    con = new SqlConnection(strCon);
                    con.Open();

                    string strSelect = "";
                    SqlCommand cmdUpdate;

                    strSelect = "Update DRIVER Set DriverName= @driverName, ICNO= @inco, CarPlateNo= @carplateno, ExpiredDriverLicense= @expireddriverlicense, ContactNo= @contactNo Where DriverID= '" + ddlDriverID.SelectedValue + "' ";

                    cmdUpdate = new SqlCommand(strSelect, con);
                    cmdUpdate.Parameters.AddWithValue("@driverName", txtDriverName.Text);
                    cmdUpdate.Parameters.AddWithValue("@inco", txtICNO.Text);
                    cmdUpdate.Parameters.AddWithValue("@carplateno", txtCarPlateNo.Text);
                    cmdUpdate.Parameters.AddWithValue("@contactNo", txtPhoneNum.Text);
                    cmdUpdate.Parameters.AddWithValue("@expireddriverlicense", txtDriverLicense.Text);





                    int n = cmdUpdate.ExecuteNonQuery();

                    if (n > 0)
                        lblMsg.Text = "Driver Details Updated!";
                    else
                        lblMsg.Text = "Sorry, Driver Details Update Failed.";

                    con.Close();

                    //txtDriverName.Text = txtDriverName.Text;

                    Calendar1.Visible = false;
                    txtDriverName.ReadOnly = true;
                    txtICNO.ReadOnly = true;
                    txtCarPlateNo.ReadOnly = true;
                    txtPhoneNum.ReadOnly = true;
                    btnEditSave.Text = "Edit";

                }
            }
            else
            {
                lblMsg.Text = " <span style='color: red;'>Add Driver Fail!!! Please Enter All The Field!!!</span>";

                if (txtDriverName.Text == "")
                {
                    lblNameNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }

                if (txtICNO.Text == "")
                {
                    lblICNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtPhoneNum.Text == "")
                {
                    lblNoNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
                if (txtCarPlateNo.Text == "")
                {
                    lblCarPlateNotNull.Text = " <span style='color: red;'><--- This field must be fill up.</span>";
                }
            }

        }

        protected void ddlDriverID_SelectedIndexChanged(object sender, EventArgs e)
        {

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
            // string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "";
            SqlCommand cmdSelect;

            strSelect = "Select * From DRIVER where DriverID = '" + ddlDriverID.SelectedValue + "'";
            cmdSelect = new SqlCommand(strSelect, con);

            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            dtr.Read();


            if (dtr.HasRows)
            {

                txtDriverName.Text = dtr["DriverName"].ToString();
                txtICNO.Text = dtr["ICNO"].ToString();
                txtCarPlateNo.Text = dtr["CarPlateNo"].ToString();
                txtPhoneNum.Text = "0" + dtr["ContactNo"].ToString();
                txtDriverLicense.Text = dtr["ExpiredDriverLicense"].ToString();

            }


            dtr.Close();
            con.Close();



        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            DateTime dtUserDate;
            dtUserDate = Calendar1.SelectedDate;
            txtDriverLicense.Text = dtUserDate.ToString();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SelectionAdmin.aspx");
        }
    }
}