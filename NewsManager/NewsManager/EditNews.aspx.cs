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

namespace NewsManager
{
    public partial class EditNews : System.Web.UI.Page
    {
        private string connString = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                base.Response.Redirect("Login.aspx", true);

            }
            ((Site1)this.Master).PageTitle = "编辑新闻";
            ConnectionStringSettings connectionStringSettings =
            ConfigurationManager.ConnectionStrings["ConnectionString"];
            this.connString = connectionStringSettings.ConnectionString;

            //String NewsId = Session["Username"].ToString();
            



            string NewsId = Request.Params["NewsId"];

            if (String.IsNullOrEmpty(NewsId))
                throw new ApplicationException("参数NewsId为空。");
            tbNewsId.Text = Request.Params["NewsId"];
            string sqlNews =
                "SELECT * " +
                "  FROM News" +
                " WHERE NewsId = @NewsId";
            string sqlNewsCategory =
                "SELECT * " +
                "  FROM NewsCategory";
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    using (SqlCommand cmd1 = new SqlCommand(sqlNewsCategory, conn))
                    {
                        using (SqlDataReader dr1 = cmd1.ExecuteReader())
                        {
                            ddlClass.DataSource = dr1;
                            ddlClass.DataBind();
                        }
                    }

                    using (SqlCommand cmd2 = new SqlCommand(sqlNews, conn))
                    {
                        cmd2.Parameters.AddWithValue("@NewsId", NewsId);
                        using (SqlDataReader dr2 = cmd2.ExecuteReader())
                        {
                            if (dr2.Read())
                            {


                                tbNewsTitle.Text = dr2["Title"].ToString();
                                tbNewsAuthor.Text = dr2["Author"].ToString();
                                tbNewsContent.Text = dr2["Content"].ToString();
                                tbNewsTime.Text = dr2["AddTime"].ToString();
                                ddlClass.SelectedValue = dr2["CategoryId"].ToString();

                            }
                            else
                                throw new ApplicationException("学生信息不存在。");
                        }

                    }
                }
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string sql =
                "Update News set Title=@newsTitle, Author=@newsAuthor, Content=@newsContent, AddTime=@newsTime,CategoryId=@newsCategoryId  WHERE NewsId = @NewsId";
                
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@NewsId", tbNewsId.Text);
                    cmd.Parameters.AddWithValue("@newsTitle", tbNewsTitle.Text);
                    cmd.Parameters.AddWithValue("@newsAuthor", tbNewsAuthor.Text);
                    cmd.Parameters.AddWithValue("@newsContent", tbNewsContent.Text);
                    cmd.Parameters.AddWithValue("@newsTime", tbNewsTime.Text);
                    cmd.Parameters.AddWithValue("@newsCategoryId", ddlClass.SelectedValue);
                    try
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                        {
                            lbMessage.Text = "添加新闻成功。";
                            lbMessage.Style.Add("color", "green");
                            // tbForm.Visible = false;
                        }
                        else
                        {
                            lbMessage.Text = "添加失败。";
                            lbMessage.Style.Add("color", "red");
                        }

                    }
                    catch (Exception ex)
                    {
                        lbMessage.Text = "添加失败。" + ex.Message;
                        lbMessage.Style.Add("color", "red");
                    }
                }
            }
        }



    }
}
