using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace TINTUCGIAITRI
{
    public partial class BaoCaoThongKe1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            XemID();

        }
        public void XemID()
        {
            con.Open();

            string chuoi = "";

            DataTable dt = new DataTable();
            SqlCommand cmd3 = new SqlCommand("select nhanvien.ten from nhanvien inner join Chitiet on nhanvien.IDNV=Chitiet.IDNV where lanxem=(select (MAx(lanxem)) from Chitiet)", con);
            cmd3.ExecuteNonQuery();
            dt.Load(cmd3.ExecuteReader());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                chuoi = dt.Rows[i]["ten"].ToString();
            }


            string chuoi1 = "";

            DataTable dt1 = new DataTable();
            SqlCommand cmd31 = new SqlCommand("select nhanvien.ten from nhanvien inner join Chitiet on nhanvien.IDNV=Chitiet.IDNV where lanxem=(select (min(lanxem)) from Chitiet)", con);
            cmd31.ExecuteNonQuery();
            dt1.Load(cmd31.ExecuteReader());
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                chuoi1 = dt1.Rows[i]["ten"].ToString();
            }

            con.Close();

            Label3.Text = chuoi.ToString();
            Label4.Text = chuoi1.ToString();
        }
    }
}