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
    public partial class checknot : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
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
                showNot();
            }
        }
    private void showNot()
    {
        Panel mPanel;
        Panel imgPanel;
            Image image;
            Panel labelPanel;
            Label label;
            Button yesBtn;
            Button NoBtn;
        prp.cone.Close();
        prp.cone.Open();
        cmd = new SqlCommand("select n.id,n.idp,n.idd,n.dat,n.tim,n.msg,i.img,u.f_n,u.l_n from notf n left join img i on(n.idd=i.id) "+
                           "left join user_tb u on(i.id = u.username) where n.idp = "+Session["username"]+" order by n.dat desc", prp.cone);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
                //cont.Controls.Clear();
                mPanel = new Panel();
                if (dr["msg"].ToString() == "no")
                {
                    mPanel.CssClass = "col-10 nb shadow p-2 row justify-content-center m-auto  bg-light";
                }
                if (dr["msg"].ToString() == "yes")
                {
                    mPanel.CssClass = "col-10 nb shadow p-2 row justify-content-center m-auto";
                }
                cont.Controls.Add(mPanel);
                imgPanel = new Panel();
                imgPanel.CssClass = "col-3 p-1";
                image = new Image();
                image.CssClass = "dr_imgu";
                byte[] bytes;
                bytes = (byte[])dr["img"];
                image.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
                imgPanel.Controls.Add(image);
                mPanel.Controls.Add(imgPanel);
                label = new Label();
                label.CssClass = "text-capitalize col-11";
                label.Text = "you have appointment with Dr." + dr.GetValue(7) + " " + dr.GetValue(8) +
                    " on " + dr.GetDateTime(3).ToString("yyyy-MM-dd") + " " + dr["msg"] + " Do you Confirm ?";
                labelPanel = new Panel();
                labelPanel.Controls.Add(label);
                labelPanel.CssClass = "col-8 p-1 row justify-content-center";
                mPanel.Controls.Add(labelPanel);
                yesBtn = new Button();
                yesBtn.Text = "Yes";
                yesBtn.CssClass = "col-3 m-1 btn btn-success";
                yesBtn.ID = dr.GetInt32(0).ToString();
                yesBtn.Click += (object o, EventArgs ev) =>
                {
                    var b = (Button)o;
                    update(b.ID);

                };
                labelPanel.Controls.Add(yesBtn);
                NoBtn = new Button();
                NoBtn.Text = "No";
                NoBtn.ID = dr.GetInt32(0).ToString() + "_";
                NoBtn.Click += (object o, EventArgs ev) =>
                {
                    var b = (Button)o;
                    string[] a = b.ID.Split('_');
                    delete(a[0]);

                };
                NoBtn.CssClass = "col-3 m-1 btn btn-danger";
                labelPanel.Controls.Add(NoBtn);
            }
        prp.cone.Close();
    }
        private void update(string id)
        {
            string idd="", idp="", date="";
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select * from notf where id=" + id, prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                idd = dr["idd"].ToString();
                idp = dr["idp"].ToString();
                date = dr["dat"].ToString();
            }
            prp.cone.Close();
            prp.query("insert into joindp values ('" + idd + "'," + idp + ",'" + date + "',getdate())");
            prp.query("update notf set msg='yes' where id=" + id);
            Response.Redirect("checknot.aspx");
        }
        private void delete(string id)
        {
            prp.query("delete from notf where id=" + id);
            Response.Redirect("checknot.aspx");
        }
}
}