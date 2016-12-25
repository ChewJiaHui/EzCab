﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace EZCab.Reservation
{
    public partial class Reservation : System.Web.UI.Page
    {
        string distance;
        string duration;
        string price;
        string reserveTime;
        DateTime reachTimeAdd;
        string reachTime;
        string driverName;

        //SqlConnection conDriver;
        protected void Page_Load(object sender, EventArgs e)
        {

            lblSelectTime.Visible = false;
            lblBookingAdvance.Visible = false;
            lblGetRoute.Visible = false;
            lblName.Text = (String)Session["Username"];
            lblEmail.Text = (String)Session["Email"];
            if (IsPostBack == true)
            {
                txtDistance.Text = (String)Session["distance"];
                txtDuration.Text = (String)Session["duration"];
                txtPrice.Text = (String)Session["price"];
            }

            if (!IsPostBack)
            {
                LINQDataContext LINQ = new LINQDataContext();

                ddlDriver.DataSource = from driver in LINQ.DRIVERs
                                       select new { driver.DriverName, driver.DriverID };
                ddlDriver.DataTextField = "DriverName";
                ddlDriver.DataValueField = "DriverID";
                ddlDriver.DataBind();

                Session["distance"] = "";
                Session["duration"] = "";
                Session["price"] = "";

                txtDistance.Text = Session["distance"].ToString();
                txtDuration.Text = Session["duration"].ToString();
                txtPrice.Text = Session["price"].ToString();

            }
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtCalander.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {

            
            reserveTime = txtCalander.Text + " " + ddlHour.SelectedValue + ":" + ddlMin.SelectedValue + ":00 " + rblAmPm.SelectedValue;
            if (Convert.ToDateTime(reserveTime) < DateTime.Now.AddHours(2))
            {
                lblSelectTime.Visible = true;
                lblBookingAdvance.Visible = true;
                lblSelectTime.Text = "Please select a valid date or time.";
                lblBookingAdvance.Text = "You must booking 2 hour in advance.";
            }
            else if(txtPickUpAddress.Text == "" || txtDestinationAddress.Text == ""){
                lblGetRoute.Visible = true;
                lblGetRoute.Text = "Please enter location.";
            }
            else if (txtDistance.Text == "")
            {
                lblGetRoute.Visible = true;
                lblGetRoute.Text = "Please click Get Route Button";
            }
            else if (txtPrice.Text == "NaN")
            {
                lblGetRoute.Visible = true;
                lblGetRoute.Text = "Please select the area within Kuala Lumpur and Klang";
            }
            else
            {
                Session["reserveTime"] = reserveTime;
                reachTimeAdd = Convert.ToDateTime(reserveTime).AddMinutes(30);
                reachTime = reachTimeAdd.ToString();
                Session["reachTime"] = reachTime;
                distance = txtDistance.Text;
                Session["distance"] = txtDistance.Text;
                duration = txtDuration.Text;
                Session["duration"] = txtDuration.Text;
                price = txtPrice.Text;
                Session["price"] = txtPrice.Text;
                Session["reserveTime"] = reserveTime;
                Session["pickUpAddress"] = txtPickUpAddress.Text;
                Session["destination"] = txtDestinationAddress.Text;
                Session["driver"] = ddlDriver.SelectedValue;
                Session["driverName"] = ddlDriver.SelectedItem.Text;

                Response.Redirect("~/Payment/payment.aspx");

            }
                }
            catch
            {
                lblGetRoute.Visible = true;
                lblGetRoute.Text = "Please select the area within Kuala Lumpur and Klang";
            }

        }

        protected void HiddenField1_ValueChanged(object sender, EventArgs e)
        {
            txtDistance.Text = HiddenField1.Value;
        }

        protected void HiddenField2_ValueChanged(object sender, EventArgs e)
        {
            txtDuration.Text = HiddenField2.Value;
        }

        protected void HiddenField3_ValueChanged(object sender, EventArgs e)
        {
            txtPrice.Text = HiddenField3.Value;
        }

        protected void txtShowDriver_Click(object sender, EventArgs e)
        {
            //reserveTime = txtCalander.Text + " " + ddlHour.SelectedValue + ":" + ddlMin.SelectedValue + ":00 " + rblAmPm.SelectedValue;
            //reachTime = Convert.ToDateTime(reserveTime).AddMinutes(30);
            //string connStr = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ConnectionString;
            //conDriver = new SqlConnection(connStr);
            //conDriver.Open();

            //string strSelect;
            //SqlCommand cmdSelect;
            //DataTable subject = new DataTable();
            //int i;
            //double doubleDistance;
            //string newDistance;

            //i = txtDistance.Text.Length;
            //newDistance = txtDistance.Text.Substring(0, i - 3);
            //doubleDistance = Convert.ToDouble(txtPrice.Text);

            //if (doubleDistance > 500)
            //{
            //    lblPriceError.Visible = true;
            //    lblPriceError.Text = "Please select a valid destination.";
            //}
            //else
            //{
            try
            {
                //strSelect = "Select DriverName From dbo.Driver" +
                //            " INNER JOIN dbo.reservation ON driver.DriverID = reservation.DriverID" +
                //            " WHERE reservation.ReservationStartTime = '" + reserveTime+"'";
                //            //+" && reservation.ReservationEndTime > "+ reachTime;
                //cmdSelect = new SqlCommand(strSelect, conDriver);
                //SqlDataReader dtr;
                //dtr = cmdSelect.ExecuteReader();

                ////SqlDataAdapter adapter = new SqlDataAdapter("Select * From Driver", conDriver);
                ////adapter.Fill(subject);

                //ddlDriver.DataSource = dtr;
                //ddlDriver.DataTextField = "DriverName";
                //ddlDriver.DataValueField = "DriverID";
                //ddlDriver.DataBind();
                //dtr.Close();


            }

            catch
            {

            }

            finally
            {

                //conDriver.Close();
            }
            //}
            //ddlDriver.Items.Insert(0, new ListItem("<Select Subject>", "0"));


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage/AdminHomePage.aspx");
        }

        protected void ddlDriver_SelectedIndexChanged(object sender, EventArgs e)
        {
            driverName = ddlDriver.SelectedItem.Text;
        }
    }
}