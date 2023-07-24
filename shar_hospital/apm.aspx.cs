using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace shar_hospital
{
    public partial class apm : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["auth"].ToString() != "staff")
            {
                Response.Redirect("login.aspx");
            }
            if (!Page.IsPostBack)
            {
                DropDownList1.Items.Clear();
                prp.cone.Close();
                prp.cone.Open();
                cmd = new SqlCommand("select distinct(dg_name) from d_deg ", prp.cone);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    DropDownList1.Items.Add(dr["dg_name"].ToString());
                }
                prp.cone.Close();
            }
            load();
        }


        private void load()
        {
            Panel2.Controls.Clear();
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select * from ptb where sick!='none' order by tim asc", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Panel pnl = new Panel();
                pnl.CssClass = "m-1 col-11 btn btn-warning";
                Panel2.Controls.Add(pnl);
                Label label = new Label();
                label.Text = "P.ID: " + dr["id"] + "<br  />" + "Name: " + dr["f_n"] + " " + dr["l_n"] + "<br />" + dr["sick"];
                label.CssClass = "text-center";
                pnl.Controls.Add(label);
            }
            prp.cone.Close();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select d.d_id,d.dg_name,u.f_n,u.l_n from d_deg d left " +
                "join user_tb u on(d.d_id=u.username) where d.dg_name='" + DropDownList1.Text + "'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Panel pnl = new Panel();
                pnl.CssClass = "m-1 col-11 btn btn-success";
                Panel1.Controls.Add(pnl);
                Label label = new Label();
                label.Text = "D.ID: " + dr["d_id"] + "<br  />" + "Name: " + dr["f_n"] + " " + dr["l_n"];
                label.CssClass = "text-center";
                pnl.Controls.Add(label);
            }
            prp.cone.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
                {
                    prp.query("insert into notf values(" + TextBox1.Text + ",'" + TextBox2.Text + "','" + TextBox3.Text + "',getdate(),'no')");
                    prp.query("update ptb set tim=getdate() where id=" + TextBox1.Text);
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    load();
                }
            }
            catch { }
        }
    }
}