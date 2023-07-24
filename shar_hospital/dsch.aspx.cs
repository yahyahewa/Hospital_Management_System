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
    public partial class dsch : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string q = "select u.f_n,u.l_n,u.ph_num,i.img,d.dg_name from " +
                 "user_tb u left join img i on(u.username=i.id) left join d_deg d on(u.username = d.d_id)" +
  " where auth = 'doctor'";
                loadDc(q);
            }
        }

        private void loadDc(string q)
        {
            Panel mP;
            Panel imgP;
            Image img;
            Panel textP;
            Label flb;
            Label llb;
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand(q, prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                mP = new Panel();
                mP.CssClass = "col-4 m-auto border row dr_div";
                mDiv.Controls.Add(mP);
                imgP = new Panel();
                imgP.CssClass = "col-4 p-1 div_img";
                mP.Controls.Add(imgP);
                img = new Image();
                byte[] bytes;
                bytes = (byte[])dr["img"];
                img.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
                imgP.Controls.Add(img);
                textP = new Panel();
                textP.CssClass = "ol-7 p-1";
                mP.Controls.Add(textP);
                flb = new Label();
                flb.CssClass = "d-block text-capitalize dr_name";
                flb.Text = "Dr." + dr.GetString(0) + " " + dr.GetString(1);
                textP.Controls.Add(flb);
                llb = new Label();
                llb.CssClass = "text-primary info";
                llb.Text = "Ph.num: " + dr["ph_num"] + " " + dr["dg_name"];
                textP.Controls.Add(llb);

            }
            prp.cone.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string q = "select u.f_n,u.l_n,u.ph_num,i.img,d.dg_name from " +
                "user_tb u left join img i on(u.username=i.id) left join d_deg d on(u.username = d.d_id)" +
 " where auth = 'doctor'";
            if (TextBox1.Text != "")
            {
                loadDc(q + "  and( u.f_n like '%" + TextBox1.Text + "%' or u.l_n like '%" +
                    TextBox1.Text + "%' or u.ph_num like '%" + TextBox1.Text + "%' or  d.dg_name like '%"+TextBox1.Text+"%')");
            }
            else
            {
                loadDc(q);
            }
        }
    }
}