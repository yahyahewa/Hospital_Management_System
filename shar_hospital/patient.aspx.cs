using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shar_hospital
{
    public partial class patient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["auth"].ToString() != "patient")
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                pntid.InnerText ="Yuor ID: "+ Session["username"].ToString();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox6.Text != "" && TextBox7.Text != "" && TextBox8.Text != "")
            {
                if (TextBox7.Text == TextBox8.Text)
                {
                    if (prp.retStr("select pass from ptb where id=" + Session["username"] + "") == TextBox6.Text)
                    {
                        if (prp.query("update ptb set pass='" + TextBox7.Text + "' where id=" + Session["username"] + "") == true)
                        {
                            mesg.Text = "succes";
                        }
                    }
                    else
                    {
                        mesg.Text = "incorrect your password !";
                    }
                }
                else
                {
                    mesg.Text = "please check your confirm new password !";
                }
            }
            else
            {
                mesg.Text = "please fill in all boxes !";
            }
        }
    }
}