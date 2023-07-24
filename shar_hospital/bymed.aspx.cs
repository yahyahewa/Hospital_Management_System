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
    public partial class bymed : System.Web.UI.Page
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile && loc.Text != "" && phone.Text != "")
            {
                int lenght = FileUpload1.PostedFile.ContentLength;
                byte[] pic = new byte[lenght];
                FileUpload1.PostedFile.InputStream.Read(pic, 0, lenght);
                prp.cone.Close();
                prp.cone.Open();
                SqlCommand cmd = new SqlCommand("insert into bmed values(@a,@b,@c,@e,@f,@g)", prp.cone);
                cmd.Parameters.AddWithValue("@a", pic);
                cmd.Parameters.AddWithValue("@b", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("@c", loc.Text);
                cmd.Parameters.AddWithValue("@e", "no");
                cmd.Parameters.AddWithValue("@f", phone.Text);
                cmd.Parameters.AddWithValue("@g", Session["username"]);
                cmd.ExecuteNonQuery();
                prp.cone.Close();
                msg.InnerText = "sucess";
                loc.Text = "";
                phone.Text = "";
            }
            else
            {
                msg.InnerText = "Plaeas fill all boxes";
            }
        }
    }
}