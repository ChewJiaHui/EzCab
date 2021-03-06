﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace EZCab.Payment
{

    public partial class SucceessfulPayment : System.Web.UI.Page
    {
        string functionReturnPlate()
        {
            RetrieveDataDataContext trans = new RetrieveDataDataContext();
            return (from driver in trans.DRIVERs
                    where driver.DriverName == Session["driverName"].ToString()
                    select driver.CarPlateNo).FirstOrDefault();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                lblPrice.Text = (String)Session["price"];
                lblDuration.Text = (String)Session["duration"];
                lblDepart.Text = (String)Session["pickUpAddress"];
                lblArrive.Text = (String)Session["destination"];
                lblName.Text = (String)Session["Username"];
                lblDriver.Text = (String)Session["driverName"];
                lblVehicleNo.Text = functionReturnPlate();
                string transactionTime = DateTime.Now.ToString();
                //Label1.Text = transactionTime;

                RetrieveDataDataContext trans = new RetrieveDataDataContext();



                TRANSACTION2 order = new TRANSACTION2
                {
                    price = Session["price"].ToString(),
                    email = Session["Email"].ToString(),
                    paymentTime = Convert.ToDateTime(transactionTime)
                };

                RESERVATION reserve = new RESERVATION
                {

                    ReservationStartTime = Convert.ToDateTime(Session["reserveTime"]),
                    ReservationEndTime = Convert.ToDateTime(Session["reachTime"]),
                    PickUpLocation = (String)Session["pickUpAddress"],
                    Destination = (String)Session["destination"],
                    Email = (String)Session["Email"],
                    DriverID = (String)Session["driver"],
                    Price = (String)Session["price"]

                };

                trans.RESERVATIONs.InsertOnSubmit(reserve);
                trans.TRANSACTION2s.InsertOnSubmit(order);
                trans.SubmitChanges();
            }



        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage/AdminHomePage.aspx");
        }
    }
}

    