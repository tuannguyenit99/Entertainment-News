using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace TINTUCGIAITRI
{
    public partial class TinTucGiaiTri : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            string IDBangTin = Request.QueryString["IDBangTin"];
            con.Open();
            SqlCommand cmd = new SqlCommand("update ChiTiet set LanXem=LanXem+1 where IDBangTin=@IDBangTin", con);
            cmd.Parameters.AddWithValue("IDBangTin", IDBangTin.ToString());
            cmd.ExecuteNonQuery();
            con.Close();

           

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            string IDBangTin = Request.QueryString["IDBangTin"];
            string demo = Session["tk"].ToString();
            if (demo =="")
            {
                Response.Redirect("DangNhap.aspx");
            }
            else
            {  
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into BinhLuan values(@tk,@nd)", con);
            cmd.Parameters.AddWithValue("tk", demo.ToString());
            cmd.Parameters.AddWithValue("nd", txtbl.Text);
            cmd.ExecuteNonQuery();

            string chuoi = "";
            int chuoi2 = 0;

            SqlCommand cmd4 = new SqlCommand("select*from BinhLuan", con);

            dt.Load(cmd4.ExecuteReader());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                chuoi = dt.Rows[i]["IDBL"].ToString();
            }
            chuoi2 = Convert.ToInt32(chuoi);

            SqlCommand cmd3 = new SqlCommand("insert into BinhLuanChung values(@IDBangTin,@IDBL)", con);
            cmd3.Parameters.AddWithValue("IDBangTin", IDBangTin.ToString());
            cmd3.Parameters.AddWithValue("IDBL", chuoi2.ToString());
            cmd3.ExecuteNonQuery();
            con.Close();
            txtbl.Text = "";
            Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
    }
}