using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace Data1_3
{
    public partial class StudentList4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvStudents.RowDataBound += new GridViewRowEventHandler(gvStudents_RowDataBound);
        }

        void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if((e.Row.RowState & DataControlRowState.Edit) != 0)
                {
                    DataRowView drv = (DataRowView)e.Row.DataItem;
                    DropDownList ddlGender = (DropDownList)e.Row.Cells[3].FindControl("ddlGender");
                    ddlGender.SelectedValue = drv["Gender"].ToString();
                }
            }
        }
    }
}
