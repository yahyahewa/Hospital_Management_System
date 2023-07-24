using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace shar_hospital
{
    public partial class login : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string a = null;
                string b = null;
                string c = null;
                string query = "";
                bool check = false;
                char[] num = TextBox1.Text.ToCharArray();
                if (char.IsNumber(num[0])==true) 
                { check = true; }
                if (check == true)
                { query = "select id,pass from ptb where id=" + TextBox1.Text + " and pass='" + TextBox2.Text + "'"; }
                if (check == false)
                { query = "select username, pass, auth from user_tb where username = '" + TextBox1.Text + "' and pass = '" + TextBox2.Text + "'"; }
                prp.cone.Close();
                prp.cone.Open();
                cmd = new SqlCommand(query, prp.cone);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (check == true)
                    {
                        a = dr.GetInt32(0).ToString();
                        b = dr.GetString(1);
                    }
                    else
                    {
                        a = dr.GetString(0);
                        b = dr.GetString(1);
                        c = dr.GetString(2);
                    }
                }
                prp.cone.Close();

                if (a != null && b != null && c == "doctor")
                {
                    Session["username"] = TextBox1.Text;
                    Session["auth"] = "doctor";
                    Response.Redirect("doctor.aspx");
                }
                if (a != null && b != null && c == "staff")
                {
                    Session["username"] = TextBox1.Text;
                    Session["auth"] = "staff";
                    Response.Redirect("staff.aspx");
                }
                if (a != null && b != null && c == "admin")
                {
                    Session["username"] = TextBox1.Text;
                    Session["auth"] = "admin";
                    Response.Redirect("admin.aspx");
                }
                if (a != null && b != null && c == null)
                {
                    Session["username"] = TextBox1.Text;
                    Session["auth"] = "patient";
                    Response.Redirect("patient.aspx");
                }
            }
            catch
            {

            }
        }
    }
}