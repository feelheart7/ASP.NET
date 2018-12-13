using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Data1_3
{
    public partial class StudentList : System.Web.UI.Page
    {
        private const int PAGE_SIZE = 6;
        protected int PageIndex = 1;
        protected int PageCount = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
            {
                Response.Redirect("~/Login.aspx?referUrl=" + Server.UrlEncode(Request.Url.ToString()));
            }
            
            // 设置页面标题
            ((SiteMaster)this.Master).PageTitle = "管理学生";

            rptStudent.ItemCommand += new RepeaterCommandEventHandler(rptStudent_ItemCommand);

            if (!IsPostBack)
            {
                BindStudentData();
            }
        }

        void rptStudent_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ConnectionStringSettings mySettings = ConfigurationManager.ConnectionStrings["ConnectionString"];
            if (mySettings == null || string.IsNullOrEmpty(mySettings.ConnectionString))
                throw new ApplicationException("错误：找不到数据库连接字符串！");

            switch (e.CommandName)
            {                
                case "Delete":
                    string deleteSql = "DELETE FROM Students WHERE StudentId = @studentId";
                    using (SqlConnection conn = new SqlConnection(mySettings.ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(deleteSql, conn))
                        {
                            cmd.Parameters.AddWithValue("@studentId", e.CommandArgument.ToString());
                            cmd.ExecuteNonQuery();
                        }

                        BindStudentData();
                    }
                    break;
            }
        }

        void BindStudentData()
        {
            ConnectionStringSettings mySettings = ConfigurationManager.ConnectionStrings["ConnectionString"];
            if (mySettings == null || string.IsNullOrEmpty(mySettings.ConnectionString))
                throw new ApplicationException("错误：找不到数据库连接字符串！");

            // 取得URL参数Page
            string strPageIndex = Request.Params["Page"];
            // 转换为整形
            if (!int.TryParse(strPageIndex, out PageIndex)) // 如转换失败PageIndex为0
                PageIndex = 1;

            int recordCount = 0;
            using (SqlConnection conn = new SqlConnection(mySettings.ConnectionString))
            {
                conn.Open();

                // 当调用存储过程时，cmdText为存储过程名
                using (SqlCommand cmd = new SqlCommand("GetStudentsPage", conn))
                {
                    // 指定命令类型为调用存储过程
                    cmd.CommandType = CommandType.StoredProcedure;
                    // 设置存储过程的参数，输入参数设置与参数化查询一致
                    cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PAGE_SIZE);

                    // 输出参数
                    cmd.Parameters.Add(new SqlParameter("@RecordCount", SqlDbType.Int));
                    // 设置Direction
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;

                    using (IDataReader dr = cmd.ExecuteReader())
                    {
                        rptStudent.DataSource = dr;
                        rptStudent.DataBind();
                    }
                    recordCount = (int)cmd.Parameters["@RecordCount"].Value;
                }

                // 总页数
                PageCount = recordCount / PAGE_SIZE;
                if (recordCount % PAGE_SIZE != 0)
                    PageCount++;
                
            }
        }
    }
}
