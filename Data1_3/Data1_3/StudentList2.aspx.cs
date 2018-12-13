using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.Caching;

namespace Data1_3
{
    public partial class StudentList2 : System.Web.UI.Page
    {
        //protected SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
            {
                Response.Redirect("~/Login.aspx?referUrl=" + Server.UrlEncode(Request.Url.ToString()));
            }

            // 设置页面标题
            ((SiteMaster)this.Master).PageTitle = "管理学生（使用GridView）";

            //设置事件委托
            gvStudents.RowDataBound += new GridViewRowEventHandler(gvStudents_RowDataBound);
            gvStudents.RowUpdating += new GridViewUpdateEventHandler(gvStudents_RowUpdating);
        }

        void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lbDelete = (LinkButton)e.Row.Cells[5].Controls[2];
                DataRowView drv = (DataRowView)e.Row.DataItem;
                string js = string.Format("return confirm('你确定要删除\"{0}\"吗?')", drv["StudentName"].ToString());
                lbDelete.Attributes.Add("onclick", js);

                // https://www.cnblogs.com/jhxk/articles/1666818.html
                if (((e.Row.RowState & DataControlRowState.Edit) != 0))
                {                    
                    DropDownList ddlGender = (DropDownList)e.Row.Cells[3].FindControl("ddlGender");
                    ddlGender.SelectedIndex = "M".Equals(drv["Gender"].ToString()) ? 0 : 1;
                    DropDownList ddlAge = (DropDownList)e.Row.Cells[2].FindControl("ddlAge");
                    ddlAge.SelectedValue = drv["Age"].ToString();

                    DropDownList ddlClass = (DropDownList)e.Row.Cells[4].FindControl("ddlClass");
                    DataTable dtClass = new DataTable("Class");

                    // 如果缓存中有班级数据
                    if (Cache.Get("dtClass") != null)
                    {
                        dtClass = (DataTable)Cache.Get("dtClass");
                    }
                    else
                    {
                        // 如果缓存中没有班级数据，从数据库取出
                        using (SqlConnection conn = DBHelper.GetDbConnection())
                        {
                            string select = "SELECT ClassId, ClassName FROM Class";
                            SqlCommand cmd = new SqlCommand(select, conn);
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            da.Fill(dtClass);
                            Cache.Insert("dtClass", dtClass);   // 放入缓存
                        }
                    }
                    ddlClass.DataSource = dtClass;
                    ddlClass.DataBind();
                    ddlClass.SelectedValue = drv["ClassId"].ToString();
                }
            } 
        }

        protected void gvStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {   
            GridViewRow gvr = gvStudents.Rows[e.RowIndex];
            DropDownList ddlGender = (DropDownList)gvr.Cells[3].FindControl("ddlGender");
            e.NewValues["Gender"] = ddlGender.SelectedValue;
            DropDownList ddlAge = (DropDownList)gvr.Cells[2].FindControl("ddlAge");
            e.NewValues["Age"] = ddlAge.SelectedValue;
            DropDownList ddlClass = (DropDownList)gvr.Cells[4].FindControl("ddlClass");
            e.NewValues["ClassId"] = ddlClass.SelectedValue;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            dsSearch.SelectParameters.Clear();  //同一参数不能多次添加，所以先清空
            dsSearch.SelectParameters.Add("searchKey", "%" + tbSearchKey.Text + "%");
            gvStudents.DataSourceID = "dsSearch";
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            tbSearchKey.Text = string.Empty;
            gvStudents.DataSourceID = "dsStudent";
        }
    }
}
