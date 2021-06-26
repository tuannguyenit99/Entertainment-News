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
    public partial class DangKyKhachHang : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtDangnhap_Click(object sender, EventArgs e)
        {
            try
            {
                if (Txttaikhoan.Text == "" || Txtpass.Text == "" || txtrepass.Text == "")
                {
                    Tb.Text = "Không được để trống dữ liệu";

                }
                else if (Txtpass.Text != txtrepass.Text)
                {
                    Tb.Text = "Mật khẩu không khớp";
                }
                else if (Txttaikhoan.Text != "" || Txtpass.Text != "" || txtrepass.Text != "")
                {
                    DataTable dt = new DataTable();
                    string sql = "select * from QuyenTruyCap where taikhoan=@taikhoan";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    con.Open();
                    cmd.Parameters.AddWithValue("taikhoan", Txttaikhoan.Text);
                    SqlDataAdapter adt = new SqlDataAdapter(cmd);
                    adt.Fill(dt);
                    if (dt.Rows.Count == 1)
                    {

                        Tb.Text = "Tài Khoản đã tồn tại";


                    }
                    else
                    {

                        string sql1 = "insert into NhanVien (ten) values(@ten)";
                        SqlCommand cmd1 = new SqlCommand(sql1, con);
                        cmd1.Parameters.AddWithValue("ten", Txttaikhoan.Text);
                        cmd1.ExecuteNonQuery();

                        string chuoi = "";
                        int chuoi2 = 0;

                        SqlCommand cmd3 = new SqlCommand("select*from nhanvien", con);

                        dt.Load(cmd3.ExecuteReader());
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            chuoi = dt.Rows[i]["IDNV"].ToString();
                        }
                        chuoi2 = Convert.ToInt32(chuoi);

                        string sql2 = "insert into QuyenTruyCap values(@IDnv,@tentk,@pass,@quyen)";
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        cmd2.Parameters.AddWithValue("IDnv", chuoi2.ToString());
                        cmd2.Parameters.AddWithValue("tentk", Txttaikhoan.Text);
                        cmd2.Parameters.AddWithValue("pass", Txtpass.Text);
                        cmd2.Parameters.AddWithValue("quyen", "Khách Hàng");
                        cmd2.ExecuteNonQuery();
                        TB2.Text = "Đăng Ký Thành Công";
                        Tb.Text = "";
                        con.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                Tb.Text = "Có lỗi khi thêm" + ex.Message;
            }



        }
        }
    }