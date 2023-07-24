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
    public partial class chamb : System.Web.UI.Page
    {

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
            else { 
            load();
        }
        }
        private void load()
        {
            int i = 0;
            prp.cone.Close();
            prp.cone.Open();
            SqlCommand cmd = new SqlCommand("select * from gtamb where che='no' order by dat asc", prp.cone);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label label = new Label();
                Button btn = new Button();
                if (i == 0)
                { btn.CssClass = "btn btn-primary col-11 m-auto   d-block"; }
                if (i == 1)
                { btn.CssClass = "btn btn-warning col-11 m-auto   d-block"; }
                if (i == 2)
                { btn.CssClass = "btn btn-danger col-11 m-auto   d-block"; }
                if (i == 3)
                { btn.CssClass = "btn btn-success col-11 m-auto   d-block"; i = 0; }
                btn.Text = dr["loc"].ToString();
                label.Text = "<br />";
                btn.ID = dr["id"].ToString();
                Panel1.Controls.Add(btn);
                Panel1.Controls.Add(label);
                btn.Click += (object o, EventArgs ev) =>
                {
                    var b = (Button)o;
                    check(b.ID);
                };
                i++;
            }
            prp.cone.Close();
        }
        private void check(string id)
        {
            Panel1.Controls.Clear();
            prp.cone.Close();
            prp.cone.Open();
            SqlCommand cmd = new SqlCommand("update gtamb set che='yes' where id=" + id, prp.cone);
            cmd.ExecuteNonQuery();
            prp.cone.Close();
            load();
        }
    }
}