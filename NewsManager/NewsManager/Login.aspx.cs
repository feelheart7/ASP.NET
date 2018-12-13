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

namespace NewsManager
{
    public partial class Login : System.Web.UI.Page
    {
        private string connString = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["Username"] == null)
            {




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


            else {
                
               
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
                    String username = Request.Cookies["Username"].Value.ToString();
                    tbUsername.Text = username;
                    CheckBox1.Checked = true;

                    lbMessage.Visible = false;
                }

            }

        }


        protected void btnOK_Click(object sender, EventArgs e)
        {
            String username = tbUsername.Text;
            String password = tbPassword.Text;

            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("select Count(*) from Users where Username='" + username + "'", conn);
            SqlCommand cmd2 = new SqlCommand("select Count(*) from Users where Username='" + username + "' and Password='" + password + "'", conn);
            SqlCommand cmd3 = new SqlCommand("select Realname from Users where Username='" + username + "'", conn);

            int count1 = Convert.ToInt32(cmd1.ExecuteScalar());
            int count2 = Convert.ToInt32(cmd2.ExecuteScalar());

            if (count1 == 1 && count2 == 1)
            {
                //lbMessage.Text = "登录成功";
               
                    SqlDataReader dr1 = cmd3.ExecuteReader();
                    dr1.Read();
                    String realname = dr1["Realname"].ToString();
                     Session["Username"] = username;
                     Session["Realname"] = realname;
                     HttpCookie ckUsername; // 声明 HttpCookie 对象
                     if (CheckBox1.Checked)
                     {
                         ckUsername = new HttpCookie("Username", username);
                         ckUsername.Expires = System.DateTime.Now.AddDays(30);
                     }
                     else
                     {   // 它的值已不重要，因为只是删除该 Cookie
                         ckUsername = new HttpCookie("Username", null);
                         // 设置 Cookie 到期日期为昨天以使浏览器删除该 Cookie
                         ckUsername.Expires = System.DateTime.Now.AddDays(-1);
                     }
                // 将 Cookie 加入到给客户端的响应
                Response.Cookies.Add(ckUsername);
                // 跳转至新闻列表页
                base.Response.Redirect("NewsList.aspx", true);


            }
            else if (count1 == 1 && count2 == 0)
            {

                lbMessage.Text = "密码错误！";
            
            }
            else 
            {
                lbMessage.Text = "用户名不存在！";
            }

            conn.Close();


       
        
       }

      
    
    
    }
}
