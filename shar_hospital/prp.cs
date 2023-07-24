using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace shar_hospital
{
    public class prp
    {
        public static SqlConnection cone = new SqlConnection("Data Source=DESKTOP-8A3O2K0;Initial Catalog=shar_hp;Persist Security Info=True;User ID=sa;Password=sa");
        static SqlCommand cmd;
        static SqlDataReader dr;
        public static bool query(string text)
        {
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand(text, prp.cone);
            if (cmd.ExecuteNonQuery() == 1)
            {
                prp.cone.Close();
                return true;
            }
            else 
            {
                prp.cone.Close();
                return false;
            }
        }
        public static int retInt(string text)
        {
            int a = 0;
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand(text, prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                a = dr.GetInt32(0);
            }
            prp.cone.Close();
            return a;
        }
        public static string retStr(string text)
        {
            string a = "";
            prp.cone.Close();
            prp.cone.Open();
            cmd = new SqlCommand(text, prp.cone);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                a = dr.GetString(0);
            }
            prp.cone.Close();
            return a;
        }
    }
}