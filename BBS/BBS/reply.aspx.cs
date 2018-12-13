using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
namespace BBS
{
    public partial class reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string postsid = Session["PostsID"].ToString();
            string sqlTitle = "select Title From Posts where PostsID=@PostsID";

            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            using (SqlCommand cmd1 = new SqlCommand(sqlTitle, conn))
            {
                cmd1.Parameters.AddWithValue("@PostsID", postsid);
                using (SqlDataReader rd = cmd1.ExecuteReader())
                {
                    if (rd.Read())
                    {
                        tbName.Text = rd["Title"].ToString();
                    }
                }
            }

        }
        protected void btnUpdateAndReturn_Click(object sender, EventArgs e)
        {
            string userName = Session["UserName"].ToString();
            System.DateTime currentTime = new System.DateTime();
            currentTime = System.DateTime.Now;
            string postsid= Session["PostsID"].ToString();
            string sqlStr = "insert into Reply(PostsID,Title,[Content],Username,ReplyTime) values (@PostsID,@Title,@Content,@Username,@ReplyTime)";
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
   
          


            using (SqlCommand cmd = new SqlCommand(sqlStr, conn))
            {
                cmd.Parameters.AddWithValue("@PostsID", postsid);
                cmd.Parameters.AddWithValue("@Title", tbName.Text);
                cmd.Parameters.AddWithValue("@Content", tbBody.Text);
                cmd.Parameters.AddWithValue("@Username", userName);
                cmd.Parameters.AddWithValue("@ReplyTime", currentTime);

               try
               {
                conn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lbMessage.Text = "回复成功。";

                    }
                    else
                    {
                        lbMessage.Text = "回复失败。";
                        lbMessage.Style.Add("color", "red");
                    }

                }
                catch (Exception ex)
                {
                    lbMessage.Text = "回复失败。" + ex.Message;
                    lbMessage.Style.Add("color", "red");
                }


            }


            string url="tcontent.aspx?PostsID="+Session["PostsID"].ToString()+"";
            Response.Redirect(url);

        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            string url = "tcontent.aspx?PostsID=" + Session["PostsID"].ToString() + "";
            Response.Redirect(url);
        }
    }
}
