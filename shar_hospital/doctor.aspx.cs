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
    public partial class doctor : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["auth"].ToString() != "doctor")
            {
                Response.Redirect("login.aspx");
            }
            if (!Page.IsPostBack)
            {
                load();
            }
        }
        private void load()
        {
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select f_n,l_n,img from user_tb u left join img i on(u.username=i.id) where username='" + Session["username"] + "'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                dname.InnerText = "Dr." + dr["f_n"] + " " + dr["l_n"];
                byte[] bytes;
                bytes = (byte[])dr["img"];
                Image1.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
            }
            prp.cone.Close();
            prp.cone.Open();
            Label title; Label labelt;
            title = new Label();
            title.Text = "today appoimnet";
            title.CssClass = "text-capitalize text-center";
            Paneltd.Controls.Add(title);
            cmd = new SqlCommand("select p.id,p.f_n,p.l_n,p.phone from ptb p inner join joindp " +
                "j on (p.id=j.idp) where j.idd='d' and j.dat='" + DateTime.Now.ToShortDateString() + "'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                labelt = new Label();
                labelt.CssClass = "d-block";
                labelt.Text = "ID: " + dr["id"] + " Name: " + dr["f_n"] + " " + dr["l_n"];
                Paneltd.Controls.Add(labelt);
            }
            prp.cone.Close();
            ////////////////////////////////////////////
            prp.cone.Open();
            Label labeltm;
            Label tittm = new Label();
            tittm.Text = "Future appoiment";
            tittm.CssClass = "text-capitalize text-center";
            Paneltm.Controls.Add(tittm);
            cmd = new SqlCommand("select p.id,p.f_n,p.l_n,p.phone,j.dat from ptb p inner join joindp " +
                "j on (p.id=j.idp) where j.idd='d' and j.dat > '" + DateTime.Now.ToShortDateString() + "' order by j.dat desc", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                labeltm = new Label();
                labeltm.CssClass = "d-block";
                labeltm.Text = "ID: " + dr["id"] + " Name: " + dr["f_n"] + " " + dr["l_n"] + " Ph: " + dr["phone"] + " Date: "+dr.GetDateTime(4).ToString("dd-MM-yyyy");
                Paneltm.Controls.Add(labeltm);
            }
            prp.cone.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (search.Text != "")
                {
                    prp.cone.Close();
                    prp.cone.Open();
                    cmd = new SqlCommand("select * from ptb where id=" + search.Text, prp.cone);
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        usernamel.Text = "P ID: " + dr.GetInt32(0);
                        namel.Text = "p Name: " + dr.GetString(1) + " " + dr.GetString(2);
                        b_dayl.Text = "p birthday: " + dr.GetDateTime(5).ToString("yyyy-MM-dd");
                        genderl.Text = "p gender: " + dr.GetString(3);
                        phonel.Text = "p ph.Num: " + dr.GetString(4);
                    }
                    prp.cone.Close();
                    Panel panel; Label date; Label sick; Label tb;
                    prp.cone.Open();
                    cmd = new SqlCommand("select * from stb where idp=" + search.Text+" order by dat desc", prp.cone);
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        panel = new Panel();
                        panel.CssClass = "col-11 p1";
                        Panel1.Controls.Add(panel);
                        Panel1.Controls.Add(panel);
                        date = new Label();
                        date.CssClass = "d-block text-success ltime";
                        date.Text = dr.GetDateTime(3).ToString("dd-MM-yyyy");
                        panel.Controls.Add(date);
                        sick = new Label();
                        sick.Text = dr["sn"].ToString();
                        sick.CssClass = "d-block text-capitalize sname text-danger";
                        panel.Controls.Add(sick);
                        tb = new Label();
                        tb.Text = dr["tb"].ToString();
                        tb.CssClass = "temp";
                        panel.Controls.Add(tb);
                    }
                    prp.cone.Close();
                }
            }
            catch
            {
           
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text!=""&&TextBox2.Text != "")
            {
                if (TextArea1.InnerText == "") { TextArea1.InnerText = "-"; }
                prp.query("insert into stb values("+TextBox1.Text+",'"+TextBox2.Text+"','"+DateTime.Now.ToShortDateString()+"','"+TextArea1.InnerHtml+"')");

                try
                {
                    if (TextBox1.Text != "")
                    {
                        prp.cone.Close();
                        prp.cone.Open();
                        cmd = new SqlCommand("select * from ptb where id=" + TextBox1.Text, prp.cone);
                        dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            usernamel.Text = "P ID: " + dr.GetInt32(0);
                            namel.Text = "p Name: " + dr.GetString(1) + " " + dr.GetString(2);
                            b_dayl.Text = "p birthday: " + dr.GetDateTime(5).ToString("yyyy-MM-dd");
                            genderl.Text = "p gender: " + dr.GetString(3);
                            phonel.Text = "p ph.Num: " + dr.GetString(4);
                        }
                        prp.cone.Close();
                        Panel panel; Label date; Label sick; Label tb;
                        prp.cone.Open();
                        cmd = new SqlCommand("select * from stb where idp=" + TextBox1.Text + " order by dat desc", prp.cone);
                        dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            panel = new Panel();
                            panel.CssClass = "col-11 p1";
                            Panel1.Controls.Add(panel);
                            Panel1.Controls.Add(panel);
                            date = new Label();
                            date.CssClass = "d-block text-success ltime";
                            date.Text = dr.GetDateTime(3).ToString("dd-MM-yyyy");
                            panel.Controls.Add(date);
                            sick = new Label();
                            sick.Text = dr["sn"].ToString();
                            sick.CssClass = "d-block text-capitalize sname text-danger";
                            panel.Controls.Add(sick);
                            tb = new Label();
                            tb.Text = dr["tb"].ToString();
                            tb.CssClass = "temp";
                            panel.Controls.Add(tb);
                        }
                        prp.cone.Close();
                    }
                    TextBox1.Text = "";TextBox2.Text = "";TextArea1.InnerText = "";
                }
                catch
                {

                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox6.Text != "" && TextBox7.Text != "" && TextBox8.Text != "")
            {
                if (TextBox7.Text == TextBox8.Text)
                {
                    if (prp.retStr("select pass from user_tb where username='" + Session["username"] + "'") == TextBox6.Text)
                    {
                        if (prp.query("update user_tb set pass='" + TextBox7.Text + "' where username='" + Session["username"] + "'") == true)
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