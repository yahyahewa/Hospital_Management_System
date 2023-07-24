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
    public partial class admin : System.Web.UI.Page
    {
        static SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["auth"].ToString() != "admin")
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                usern.InnerText="your id: "+Session["username"];
                addingPatirntPanel.Visible = false;
                Panel1.Visible = false;
                panel3.Visible = false;
                doctorPanel.Visible = false;
                Panel4.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            retriveStaff();
            addingPatirntPanel.Visible = false;
            Panel1.Visible = false;
            panel3.Visible = true;
            doctorPanel.Visible = false;
            Panel4.Visible = false;
        }
        private void retriveStaff()
        {
                staffList.Controls.Clear();
                Label btn;
                prp.cone.Close();
                prp.cone.Open();
                cmd = new SqlCommand("select username,f_n,l_n from user_tb where auth='staff'", prp.cone);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    btn = new Label();
                    btn.Text = "Username: " + dr.GetString(0) + "<br/>" + "Name: " + dr.GetString(1) + " " + dr.GetString(2);
                    btn.CssClass = "btn shadow mt-3 btn-primary d-block col-11 sid";
                    btn.ID = dr.GetString(0);
                    staffList.Controls.Add(btn);
                }
                prp.cone.Close();
            }
        private void selectStaff(string id)
        {
            if (this.IsPostBack) {
                prp.cone.Close();
                prp.cone.Open();
                cmd = new SqlCommand("select * from user_tb where username='" + "eiofwo" + "'", prp.cone);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    test.Text = dr.GetString(0);
                    TextBox2.Text = dr.GetString(1);
                    TextBox3.Text = dr.GetString(2);
                    TextBox4.Text = dr.GetDateTime(3).ToString("dd-MM-yyyy");
                    TextBox5.Text = dr.GetString(4);
                    DropDownList3.Text = dr.GetString(5);
                    TextBox6.Text = dr.GetString(6);
                }
                prp.cone.Close();
            }
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            if (pfn.Text != "" && pln.Text != "" && pgen.Text != "" && pphnum.Text != "" && pbday.Text != "" && ppass.Text != "") 
            {
                string time = DateTime.Now.ToShortTimeString();
                if(prp.query("insert into ptb values('" + pfn.Text + "','" + pln.Text + "','" + pgen.Text + "'," +
                    "'" + pphnum.Text + "','" + pbday.Text + "','" + ppass.Text + "','" + time + "', '"+DropDownList4.Text+"')")==true)
                {
                    ptitle.InnerText = "Success";
                    prp.cone.Close();
                    prp.cone.Open();
                    cmd = new SqlCommand("select * from ptb where f_n='" + pfn.Text + "' and l_n='" + pln.Text + "' and gender='" + pgen.Text + "'" +
                        " and phone='" + pphnum.Text + "' and b_date='" + pbday.Text + "' and pass='" + ppass.Text + "' and tim='" + time + "'", prp.cone);
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        pid.Text = "ID: " + dr.GetInt32(0).ToString();
                        pfnl.Text = "First Name: " + dr.GetString(1);
                        plnl.Text = "Last Name: " + dr.GetString(2);
                        pgenl.Text = "Gender: " + dr.GetString(3);
                        pphonl.Text = "Ph.Num: " + dr.GetString(4);
                        pbdayl.Text = "Birthday: " + dr.GetDateTime(5).ToString("yyyy-MM-dd");
                        ppassl.Text = "Password: " + dr.GetString(6);
                        chl.Text = "Chronic illness: " + dr["sick"];
                    }
                    prp.cone.Close();
                    pfn.Text = ""; pln.Text = ""; pgen.Text = ""; pphnum.Text = ""; pbday.Text = ""; ppass.Text = "";
                }
            }
            else
            {
                ptitle.InnerText = "please fill in all information";
            }
        }

        private void retrivStaff()
        {
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select * from user_tb where username='" + susername.Text + "'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                susernamel.Text = "Username: " + dr.GetString(0);
                spassl.Text = "password: " + dr.GetString(1);
                sauthl.Text = "authority: " + dr.GetString(2);
                sfnl.Text = "first name: " + dr.GetString(3);
                slnl.Text = "last name: " + dr.GetString(4);
                sbl.Text = "birthday: " + dr.GetDateTime(5).ToString("yyyy-MM-dd");
                sgl.Text = "gender: " + dr.GetString(6);
                spnl.Text = "ph.Num: " + dr.GetString(7);
            }
            prp.cone.Close();
            if (DropDownList1.Text == "doctor")
            {
                prp.cone.Open();
                cmd = new SqlCommand("select img from img where id='" + susername.Text + "'", prp.cone);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    byte[] bytes;
                    bytes = (byte[])dr["img"];
                    Image1.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
                }
                prp.cone.Close();
            }
            else
            {
                Image1.ImageUrl = "none";
            }
            susername.Text = ""; sfn.Text = ""; spass.Text = ""; sln.Text = "";
            sphon.Text = "";
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            try
            {
                if (susername.Text != "" && spass.Text != "" && sfn.Text != "" && sln.Text != ""
                    && DropDownList1.Text != "" && sbday.Text != "" && DropDownList2.Text != "" && sphon.Text != "")
                {
                    char[] c = susername.Text.ToCharArray();
                    if (char.IsDigit(c[0]) == false)
                    {
                        string username = prp.retStr("select username from user_tb where username='" + susername.Text + "' ");
                        if (username == "")
                        {
                            if (DropDownList1.Text == "doctor")
                            {
                                if (FileUpload1.HasFile == false)
                                {
                                    stitle.InnerText = "please upload image";
                                }
                                else
                                {
                                    if (TextBox7.Text != "")
                                    {
                                        int lenght = FileUpload1.PostedFile.ContentLength;
                                        byte[] pic = new byte[lenght];
                                        FileUpload1.PostedFile.InputStream.Read(pic, 0, lenght);
                                        prp.query("insert into user_tb values ('" + susername.Text + "','" + spass.Text + "','" + DropDownList1.Text + "'" +
                                            ",'" + sfn.Text + "','" + sln.Text + "','" + sbday.Text + "','" + DropDownList2.Text + "','" + sphon.Text + "')");
                                        prp.cone.Close();
                                        prp.cone.Open();
                                        cmd = new SqlCommand("insert into img values(@a,@b)", prp.cone);
                                        cmd.Parameters.AddWithValue("@a", susername.Text);
                                        cmd.Parameters.AddWithValue("@b", pic);
                                        cmd.ExecuteNonQuery();
                                        prp.cone.Close();
                                        stitle.InnerText = "Success"; 
                                        prp.query("insert into d_deg values('" + susername.Text + "','" + TextBox7.Text + "',getdate())"); 
                                        retrivStaff();
                                    }
                                    else { stitle.InnerText = "please select medical !"; }
                                }
                            }
                            else
                            {
                                prp.query("insert into user_tb values ('" + susername.Text + "','" + spass.Text + "','" + DropDownList1.Text + "'" +
                                    ",'" + sfn.Text + "','" + sln.Text + "','" + sbday.Text + "','" + DropDownList2.Text + "','" + sphon.Text + "')");
                                stitle.InnerText = "Success"; retrivStaff();
                            }
                        }
                        else
                        {
                            stitle.InnerText = "please chnage username";
                        }
                    }
                    else
                    {
                        stitle.InnerText = "please note that the first charcter should note be a number !";
                    }
                }
                else
                {
                    stitle.InnerText = "please fill in all information !";
                }
            }
            catch { }
        }

        protected void Button6_Click(object sender, EventArgs e)
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
            addingPatirntPanel.Visible = true;
            Panel1.Visible = false;
            panel3.Visible = false;
            doctorPanel.Visible = false;
            Panel4.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            addingPatirntPanel.Visible = false;
            Panel1.Visible = false;
            panel3.Visible = false;
            Panel4.Visible = false;
            doctorPanel.Visible = true;
            Panel panel;
            Label label1;
            Label label2;
            Image image;
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select username,f_n,l_n,img from user_tb join  img on(user_tb.username=img.id) where user_tb.auth='doctor'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                panel = new Panel();
                panel.CssClass = "shadow mt-3 col-11 p-1";
                Panel2.Controls.Add(panel);
                panel.ID = dr.GetString(0);
                image = new Image();
                image.CssClass = "rounded m-auto dimg";
                byte[] bytes;
                bytes = (byte[])dr["img"];
                image.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
                panel.Controls.Add(image);
                label1 = new Label();
                label1.CssClass = "d-block";
                label1.Text = "Username: " + dr["username"];
                panel.Controls.Add(label1);
                label2 = new Label();
                label2.CssClass = "d-block";
                label2.Text = "Name: " + dr["f_n"] + " " + dr["l_n"];
                panel.Controls.Add(label2);
            }
            prp.cone.Close();
        }
        static string id = "";
        protected void Button13_Click(object sender, EventArgs e)
        {
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select * from user_tb where username='" + TextBox1.Text + "' and auth='staff'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                TextBox1.Text = dr.GetString(0);
                TextBox2.Text = dr.GetString(1);
                TextBox3.Text = dr.GetString(3);
                TextBox4.Text = dr.GetString(4);
                TextBox5.Text = dr.GetDateTime(5).ToString("dd/MM/yyyy");
                DropDownList3.Text = dr.GetString(6);
                TextBox6.Text = dr.GetString(7);
            }
            prp.cone.Close();
            ////////////////////////////////////////////
            ///////////////////////////////////////////////
            ///////////////////////////////////////////
            Label label = new Label();
            label.Text = "staff list";
            label.CssClass = "text-primary d-block text-capitalize text-center";
            staffList.Controls.Add(label);
            staffList.Controls.Clear();
            Label btn;
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select username,f_n,l_n from user_tb where auth='staff'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                btn = new Label();
                btn.Text = "Username: " + dr.GetString(0) + "<br/>" + "Name: " + dr.GetString(1) + " " + dr.GetString(2);
                btn.CssClass = "btn shadow mt-3 btn-primary d-block col-11";
                btn.ID = dr.GetString(0);
                staffList.Controls.Add(btn);
            }
            prp.cone.Close();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            prp.query("delete from user_tb where username='" + TextBox1.Text + "' and auth='staff'");
            Label label = new Label();
            label.Text = "staff list";
            label.CssClass = "text-primary d-block text-capitalize text-center";
            staffList.Controls.Clear();
            Label btn;
            /////////////////////////////
            /////////////////////////////
            /////////////////////////////
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select username,f_n,l_n from user_tb where auth='staff'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                btn = new Label();
                btn.Text = "Username: " + dr.GetString(0) + "<br/>" + "Name: " + dr.GetString(1) + " " + dr.GetString(2);
                btn.CssClass = "btn shadow mt-3 btn-primary d-block col-11";
                btn.ID = dr.GetString(0);
                staffList.Controls.Add(btn);
            }
            prp.cone.Close();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && DropDownList3.Text != "" && TextBox6.Text != "")
            {
                if (prp.query("update user_tb set f_n='" + TextBox3.Text + "', l_n='" + TextBox4.Text + "' " +
                    ", b_date='" + TextBox5.Text + "' ,pass='"+TextBox2.Text+"' , gender='" + DropDownList3.Text + "' , ph_num='" + TextBox6.Text + "' where username='"+TextBox1.Text+"'") == true)
                {
                    TextBox1.Text = ""; TextBox2.Text = ""; TextBox3.Text = ""; TextBox4.Text = ""; TextBox5.Text = ""; DropDownList3.Text = ""; TextBox6.Text = "";
                }
            }
            Label label = new Label();
            label.Text = "staff list";
            label.CssClass = "text-primary d-block text-capitalize text-center";
            staffList.Controls.Add(label);
            staffList.Controls.Clear();
            Label btn;
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand("select username,f_n,l_n from user_tb where auth='staff'", prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                btn = new Label();
                btn.Text = "Username: " + dr.GetString(0) + "<br/>" + "Name: " + dr.GetString(1) + " " + dr.GetString(2);
                btn.CssClass = "btn shadow mt-3 btn-primary d-block col-11";
                btn.ID = dr.GetString(0);
                staffList.Controls.Add(btn);
            }
            prp.cone.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            addingPatirntPanel.Visible = false;
            Panel1.Visible = true;
            panel3.Visible = false;
            doctorPanel.Visible = false;
            Panel4.Visible = false;
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

        protected void Button4_Click(object sender, EventArgs e)
        {
            addingPatirntPanel.Visible = false;
            Panel1.Visible = false;
            panel3.Visible = false;
            doctorPanel.Visible = false;
            Panel4.Visible = true;
        }
    }
}