using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TINTUCGIAITRI
{
    public partial class EditPostFeedBacks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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