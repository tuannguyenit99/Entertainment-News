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
    public partial class SuaChiTiet : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            string tk = Session["tk"].ToString();
            QL.Text = tk.ToString();
            DataTable dt = new DataTable();
            string sql = "select * from QuyenTruyCap where taikhoan=@taikhoan and QuyenTruyCap=N'Nhân Viên'";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("taikhoan", QL.Text);
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
            adt.Fill(dt);
            if (dt.Rows.Count == 0)
            {

                Response.Redirect("SaiQuyenTruyCap.aspx");

            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FileUpload f = (FileUpload)FormView1.FindControl("FileUpload1") as FileUpload;
            if (f.HasFile)
            {
                f.SaveAs(Server.MapPath("~/Picture/" + f.FileName));
                Label l1 = (Label)FormView1.FindControl("Label1") as Label;
                l1.Text = f.FileName;
            }
        }
    }
}