using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shar_hospital
{
    public partial class staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("login.aspx");
            //}
            //if (Session["auth"].ToString() != "patient")
            //{
            //    Response.Redirect("login.aspx");
            //}
            Session["username"] = "s";
        }
    }
}