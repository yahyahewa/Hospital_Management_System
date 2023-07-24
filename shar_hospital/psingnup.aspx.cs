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
    public partial class getamb : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList4.Items.Clear();
            DropDownList4.Items.Add("none");
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select distinct d_deg.dg_name from d_deg", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                DropDownList4.Items.Add(dr.GetString(0));
            }
            prp.cone.Close();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (pfn.Text != "" && pln.Text != "" && pgen.Text != "" && pphnum.Text != "" && pbday.Text != "" && ppass.Text != "")
            {
                string time = DateTime.Now.ToShortTimeString();
                if (prp.query("insert into ptb values('" + pfn.Text + "','" + pln.Text + "','" + pgen.Text + "'," +
                    "'" + pphnum.Text + "','" + pbday.Text + "','" + ppass.Text + "','" + time + "','"+DropDownList4.Text+"')") == true)
                {
                    string id = "";
                    ptitle.InnerText = "Success";
                    prp.cone.Close();
                    prp.cone.Open();
                    cmd = new SqlCommand("select * from ptb where f_n='" + pfn.Text + "' and l_n='" + pln.Text + "' and gender='" + pgen.Text + "'" +
                        " and phone='" + pphnum.Text + "' and b_date='" + pbday.Text + "' and pass='" + ppass.Text + "' and tim='" + time + "'", prp.cone);
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        id = dr.GetInt32(0).ToString();
                    }
                    prp.cone.Close();
                    pfn.Text = ""; pln.Text = ""; pgen.Text = ""; pphnum.Text = ""; pbday.Text = ""; ppass.Text = "";
                    if (id != "")
                    {
                        Session["username"] = id;
                        Session["auth"] = "patient";
                        Response.Redirect("patient.aspx");
                    }
                }
            }
            else
            {
                ptitle.InnerText = "please fill in all information";
            }
        }
    }
}