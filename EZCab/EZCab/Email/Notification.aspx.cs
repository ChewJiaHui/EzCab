using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml;
using System.Data;

namespace EZCab.Email
{
    public partial class Notification : System.Web.UI.Page
    {
        string ID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSet DS = new DataSet();
            string Path = Server.MapPath("Promotion.xml");
            DS.ReadXml(Path);
            ddlOffer.DataTextField = "drink";
            ddlOffer.DataValueField = "ID";
            ddlOffer.DataSource = DS;
            ddlOffer.DataBind();

            if (!IsPostBack)
            {
                string driverID = (string)Session["DriverID"];
                string connect = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
                SqlConnection conn = new SqlConnection(connect);
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select ReservationID FROM Reservation WHERE DriverID = @driverid", conn);
                cmd.Parameters.AddWithValue("@driverid", driverID);
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataBind();
                conn.Close();



                ID += DropDownList1.SelectedItem.Text;

                connect = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
                conn = new SqlConnection(connect);
                conn.Open();
                cmd = new SqlCommand();
                cmd.CommandText = "Select * FROM Reservation WHERE ReservationID = '" + ID + "'";
                cmd.Connection = conn;
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    txtMail.Text = rdr["Email"].ToString();
                    lblFrom.Text = rdr["PickUpLocation"].ToString();
                    lblTo.Text = rdr["Destination"].ToString();
                }
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean valid = false;
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("ezcabpickup@gmail.com", "lionisback");
                MailMessage msg = new MailMessage();
                msg.To.Add(txtMail.Text);
                msg.From = new MailAddress("ezcabpickup@gmail.com");
                msg.Subject = "Get ready for cab";
                msg.Body = "Hi, your cab will be reach in 15 minutes. From: " +
                   lblFrom.Text + ". To: " + lblTo.Text + ". Drinks Offer: " + ddlOffer.SelectedItem.Text;
                client.Send(msg);
                MessageBox.Show("Message Successfully Send");
                valid = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            if (valid)
            {
                Response.Redirect("~/Login/CustLogin.aspx");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ID += DropDownList1.SelectedItem.Text;
            string connect = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
            SqlConnection conn = new SqlConnection(connect);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select * FROM Reservation WHERE ReservationID = '" + ID + "'";
            cmd.Connection = conn;
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                txtMail.Text = rdr["Email"].ToString();
                lblFrom.Text = rdr["PickUpLocation"].ToString();
                lblTo.Text = rdr["Destination"].ToString();
            }

        }
    }
}