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
    public partial class AddNews : System.Web.UI.Page
    {
        private string connString = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                base.Response.Redirect("Login.aspx", true);

            }
            ((Site1)this.Master).PageTitle = "添加新闻";
            ConnectionStringSettings connectionStringSettings =
            ConfigurationManager.ConnectionStrings["ConnectionString"];
            
            if (connectionStringSettings == null ||
                        string.IsNullOrEmpty(connectionStringSettings.ConnectionString))
                throw new ApplicationException("未找到数据库连接字符串。");
            this.connString = connectionStringSettings.ConnectionString;
            if (IsPostBack)
            {
                lbMessage.Visible = true;
            }
            else
            {
                lbMessage.Visible = false;
            }

        }



        protected void btnOK_Click(object sender, EventArgs e)
        {
            string sql =
                "INSERT INTO News(Title, Author, Content, AddTime,CategoryId) " +
                "VALUES(@newsTitle, @newsAuthor, @newsContent, @newsTime,@newsCategoryId)";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                   
                    cmd.Parameters.AddWithValue("@newsTitle", tbNewsTitle.Text);
                    cmd.Parameters.AddWithValue("@newsAuthor", tbNewsAuthor.Text);
                    cmd.Parameters.AddWithValue("@newsContent", tbNewsContent.Text);
                    cmd.Parameters.AddWithValue("@newsTime", tbNewsTime.Text);
                    cmd.Parameters.AddWithValue("@newsCategoryId", tbCategory.SelectedValue);
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
