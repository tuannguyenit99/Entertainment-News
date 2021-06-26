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
    public partial class TrangPhuDe : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            string tk = Session["tk"].ToString();
            QLL.Text = tk.ToString();


            DataTable dt = new DataTable();
            string sql = "select * from QuyenTruyCap where taikhoan=@taikhoan and QuyenTruyCap=N'Quản Lý'";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("taikhoan", QLL.Text);
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
            adt.Fill(dt);
            if (dt.Rows.Count == 0)
            {

                Response.Redirect("SaiQuyenTruyCap.aspx");


            }
        }
    }
}