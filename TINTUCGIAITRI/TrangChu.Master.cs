using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TINTUCGIAITRI
{
    public partial class TrangChu : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string tk = Session["tk"].ToString();

            TxtTenKT.Text = tk.ToString();

            Session["lb"] = TxtTenKT.Text;
            Session["timkiem"] =  txttk.Text;
           






            con.Open();

            DataTable dt1 = new DataTable();
            SqlCommand cmd3 = new SqlCommand("select idnv from quyentruycap where taikhoan=@taikhoan", con);
            cmd3.Parameters.AddWithValue("taikhoan", TxtTenKT.Text);
            SqlDataAdapter adt1 = new SqlDataAdapter(cmd3);
            adt1.Fill(dt1);
            string idnv = "";
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                idnv = dt1.Rows[0][0].ToString();
            }

            Session["idnv"] = idnv.ToString();





            string thongbao = "";


            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("select count(*) from chitiet where trangthai is null and idnv=@idnv", con);
            cmd.Parameters.AddWithValue("idnv", idnv.ToString());
            cmd.ExecuteNonQuery();
            dt.Load(cmd.ExecuteReader());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                thongbao = dt.Rows[0][0].ToString();
            }


           

            ThongBao.Text = thongbao.ToString();

            int c = int.Parse(ThongBao.Text);
            if (c == 0)
            {
                ThongBao.Visible = false;
            }



            //Phản hồi



            string thongbao2 = "";


            DataTable dt5 = new DataTable();
            SqlCommand cmd1 = new SqlCommand("select count(*) from feedbacks where trangthai is null and idnv=@idnv", con);
            cmd1.Parameters.AddWithValue("idnv", idnv.ToString());
            cmd1.ExecuteNonQuery();
            dt5.Load(cmd1.ExecuteReader());
            for (int i = 0; i < dt5.Rows.Count; i++)
            {
                thongbao2 = dt5.Rows[0][0].ToString();
            }


            con.Close();

            ThongBao2.Text = thongbao2.ToString();

            int d = int.Parse(ThongBao2.Text);
            if (d == 0)
            {
                ThongBao2.Visible = false;
            }





        }





    }
}