using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TINTUCGIAITRI
{
    public partial class DoiSong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void hihi(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                DataList1.Visible = true;
                DataList3.Visible = false;
                DataList4.Visible = false;
               
            }
            if (DropDownList1.SelectedValue == "2")
            {
                DataList1.Visible = false;
                DataList3.Visible = true;
                DataList4.Visible = false;
               
            }
            if (DropDownList1.SelectedValue == "3")
            {
                DataList1.Visible = false;
                DataList3.Visible = false;
                DataList4.Visible = true;
               
            }
        }
    }
}