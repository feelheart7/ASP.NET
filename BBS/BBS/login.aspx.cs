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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            ibtn_yzm.ImageUrl = "ImageCode.aspx";




            if (!IsPostBack)
            {




                // 如Cookies中有UserName，则放在tbUserName，且将cbRememberMe选中
                if (Request.Cookies["UserName"] != null)
                {
                    UserName.Text = Request.Cookies["UserName"].Value;
                    cbRememberMe.Checked = true;
                }
            }
          

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string code = tbx_yzm.Text;
            HttpCookie htco = Request.Cookies["ImageV"];
            string scode = htco.Value.ToString();
            if (code != scode)
            {
                Response.Write("<script>alert('验证码输入不正确！')</script>");
            }
            else
            {
                if (IsValid)
                {

                    string name = UserName.Text;
                    string sqlUsername = "select Count(*) from Users where Username='" + name + "'";
                    string sqlPassword = "select Password from Users where Username='" + name + "'";

                    int count;
                    string passwd;

                    string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                    SqlConnection conn = new SqlConnection(strConn);
                    // SqlCommand command = new SqlCommand("select * from Posts where PostsID=@PostsID", conn);  
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sqlUsername, conn))
                    {
                        count = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    using (SqlCommand cmd1 = new SqlCommand(sqlPassword, conn))
                    {
                        passwd = Convert.ToString(cmd1.ExecuteScalar());
                    }



                    if (count == 1)
                    {
                        if (Password.Text == passwd)
                        {
                            Session["UserName"] = name; // 用户名保存入 Session

                            HttpCookie ckUsername; // 声明 HttpCookie 对象

                            if (cbRememberMe.Checked)
                            {

                                ckUsername = new HttpCookie("Username", name); // 创建名称为 Username、值为登录用户名的 Cookie 对象
                                ckUsername.Expires = System.DateTime.Now.AddDays(30);// 设置 Cookie 有效期为 30 天


                            }

                            else
                            {
                                ckUsername = new HttpCookie("Username", null);// 创建名称为 Username 的 Cookie，它的值已不重要，因为只是删除该 Cookie
                                ckUsername.Expires = System.DateTime.Now.AddDays(-1); // 设置 Cookie 到期日期为昨天以使浏览器删除该 Cookie

                            }

                            Response.Cookies.Add(ckUsername); // 将 Cookie 加入到给客户端的响应
                            Response.Redirect("index.aspx", false);// TODO: 跳转至新闻列表页


                        }

                        else
                        {
                            lbMessage.Text = "密码错误！";
                            lbMessage.Style.Add("color", "red");


                        }

                    }

                    else
                    {
                        lbMessage.Text = "用户名不存在！";
                        lbMessage.Style.Add("color", "red");


                    }

                }
            }
        }


        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('register.aspx','','')</script>");
            // response.redirect("Register.aspx");
        }
    }
}
