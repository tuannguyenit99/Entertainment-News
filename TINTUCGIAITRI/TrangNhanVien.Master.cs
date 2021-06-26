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
    public partial class TrangNhanVien : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            string tk = Session["tk"].ToString();
            QLL.Text = tk.ToString();


            DataTable dt = new DataTable();
            string sql = "select * from QuyenTruyCap where taikhoan=@taikhoan and QuyenTruyCap=N'Nhân Viên'";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("taikhoan", QLL.Text);
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
            adt.Fill(dt);
            if (dt.Rows.Count == 0)
            {

                Response.Redirect("SaiQuyenTruyCap.aspx");


            }


            
            

            DataTable dt1 = new DataTable();
            SqlCommand cmd3 = new SqlCommand("select idnv from quyentruycap where taikhoan=@taikhoan", con);
            cmd3.Parameters.AddWithValue("taikhoan", QLL.Text);
            SqlDataAdapter adt1 = new SqlDataAdapter(cmd3);
            adt1.Fill(dt1);
            string idnv = "";
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                idnv = dt1.Rows[0][0].ToString();
            }

            Session["idnv"] = idnv.ToString();


            XemID();
        }


        public void XemID()
        {
           

            string thongbao = "";
           

            DataTable dt = new DataTable();
            SqlCommand cmd3 = new SqlCommand("select count(*) from chitiet where trangthai is null", con);
            cmd3.ExecuteNonQuery();
            dt.Load(cmd3.ExecuteReader());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                thongbao = dt.Rows[0][0].ToString();
            }
           

            con.Close();

            ThongBao.Text = thongbao.ToString();

            int c = int.Parse(ThongBao.Text);
            if(c==0)
            {
                ThongBao.Visible = false;
            }    
        }



    }
}