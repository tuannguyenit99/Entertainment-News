using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TINTUCGIAITRI
{
    public partial class DangBaiNguoiDung : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;

            TextBox NgayDangTextBox = (TextBox)FormView1.FindControl("NgayDangTextBox");
            NgayDangTextBox.Text = now.ToString();

            TextBox LanXemTextBox = (TextBox)FormView1.FindControl("LanXemTextBox");
            LanXemTextBox.Text = "0";
           

        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload f1 = (FileUpload)FormView1.FindControl("FileUpload1");

            if (f1.HasFile)
            {
                String path = Server.MapPath("~/Picture/");
                f1.PostedFile.SaveAs(path + f1.FileName);
                SqlDataSource1.InsertParameters["Anh"].DefaultValue = f1.FileName;
            }




        }
        protected void Delete(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int m = Convert.ToInt32(e.CommandArgument);

                Xoa(m);
                Response.Redirect(Request.RawUrl);
            }

        }
        public void Xoa(int IDBangTin)
        {
            con.Open();
            SqlCommand cmdf = new SqlCommand("delete from ChiTiet where IDBangTin=@IDBangTin", con);
            cmdf.Parameters.AddWithValue("IDBangTin", IDBangTin);
            cmdf.ExecuteNonQuery();
            con.Close();
        }

        



    }
}