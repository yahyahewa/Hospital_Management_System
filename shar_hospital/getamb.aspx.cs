using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shar_hospital
{
    public partial class psingnup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                prp.query("insert into gtamb(loc) values('" + TextBox1.Text + "')");
                msg.InnerText = "success";
            }
            else
            {
                msg.InnerText = "Please Enter your address";
            }
        }
    }
}