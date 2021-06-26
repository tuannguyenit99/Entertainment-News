using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TINTUCGIAITRI
{
    public partial class FeedBacks : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=TTTN_TINTUCGIAITRI;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Delete(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Duyet")
            {
                int m = Convert.ToInt32(e.CommandArgument);

                Duyet(m);
            }

        }
        public void Duyet(int IDBangTin)
        {
            con.Open();
            SqlCommand cmdf = new SqlCommand("update FeedBacks set trangthai=1 where IDBangTin=@IDBangTin", con);
            cmdf.Parameters.AddWithValue("IDBangTin", IDBangTin);
            cmdf.ExecuteNonQuery();
            con.Close();
            Response.Redirect("EditPostFeedBacks.aspx?IDBangTin=" + IDBangTin.ToString() + "");
        }
    }
}