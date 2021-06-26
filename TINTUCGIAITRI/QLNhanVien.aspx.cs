using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace TINTUCGIAITRI
{
    public partial class QLNhanVienn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Delete(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                // XoaQuyen(m);
                Xoa(m);
            }

        }
        public void Xoa(int IDNV)
        {
            con.Open();
            SqlCommand cmdf = new SqlCommand("delete from QuyenTruyCap where IDNV=@IDNV", con);

            SqlCommand cmd = new SqlCommand("delete from NhanVien where IDNV=@IDNV", con);

            cmd.Parameters.AddWithValue("IDNV", IDNV);
            cmdf.Parameters.AddWithValue("IDNV", IDNV);
            cmdf.ExecuteNonQuery();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}