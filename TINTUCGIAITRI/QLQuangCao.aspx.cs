using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TINTUCGIAITRI
{
    public partial class QLQuangCaoo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload f1 = (FileUpload)FormView1.FindControl("FileUpload1");

            if (f1.HasFile)
            {
                String path = Server.MapPath("~/Picture/");
                f1.PostedFile.SaveAs(path + f1.FileName);
                SqlDataSource1.InsertParameters["Video"].DefaultValue = f1.FileName;
            }
        }
    }
}