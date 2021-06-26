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
    public partial class SendFeedBacks : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            string IDBangTin = Request.QueryString["IDBangTin"];
            con.Open();

            DataTable dt1 = new DataTable();
            SqlCommand cmd3 = new SqlCommand("select idnv from chitiet where IDBangTin=@IDBangTin", con);
            cmd3.Parameters.AddWithValue("IDBangTin", IDBangTin.ToString());
            SqlDataAdapter adt1 = new SqlDataAdapter(cmd3);
            adt1.Fill(dt1);
            string idnv = "";
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                idnv = dt1.Rows[0][0].ToString();
            }

            
                

            TextBox IDBangTinTextBox = (TextBox)FormView1.FindControl("IDBangTinTextBox");
            IDBangTinTextBox.Text = IDBangTin.ToString();

            TextBox IDNVTextBox = (TextBox)FormView1.FindControl("IDNVTextBox");
            IDNVTextBox.Text = idnv.ToString();




        }
    }
}