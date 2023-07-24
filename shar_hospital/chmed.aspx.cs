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
    public partial class chmed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("login.aspx");
            //}
            //if (Session["auth"].ToString() != "patient")
            //{
            //    Response.Redirect("login.aspx");
            //}
            load();
        }
                //        <img class="img d-block m-auto" src="Images/back2.jpg" />
                //<h6 class="col-6 m-auto text-center">qwodi oQ2DIWM WDOFIPMNWEQODN OI2EMJD3 OI2Q
                //    qopdwimoqwpimdoqiwmmdopqwimmdopqwmdoiqwmdoqwm
                //    JMM3OIDE OIJP2JM3DFJN2 IOJ2NMEDI</h6>
                //<asp:Button CssClass = "btn btn-success d-block col-5 m-auto" ID="Button1" runat="server" Text="Button" />
        private void load()
        {
            Panel1.Controls.Clear();
            prp.cone.Close();
            prp.cone.Open();
            SqlCommand cmd = new SqlCommand("select * from bmed where chk='no' order by dat asc",prp.cone);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Image img = new Image();
                img.CssClass = "img d-block m-auto";
                byte[] bytes;
                bytes = (byte[])dr["img"];
                img.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
                Panel1.Controls.Add(img);
                Label label = new Label();
                label.Text = "Location: " + dr["loc"] + "<br />" + "Phone: " + dr["phn"];
                Panel1.Controls.Add(label);
                label.CssClass = "col-6 m-auto d-block text-center";
                Button btn = new Button();
                btn.Text = "Check";
                btn.CssClass = "btn btn-success d-block col-3 m-auto";
                btn.ID = dr["id"].ToString();
                Panel1.Controls.Add(btn);
                btn.Click += (object o, EventArgs ev) =>
                  {
                      var b = (Button)o;
                      check(b.ID);
                  };
            }
                prp.cone.Close();
        }
        private void check(string id)
        {
            prp.query("update bmed set chk='yes' where id=" + id);
            load();
        }
    }
}