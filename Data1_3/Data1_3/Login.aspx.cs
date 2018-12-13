using System;
using System.Collections;
using System.Collections.Generic;
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 验证码一次性，总是清空
            tbCaptcha.Text = string.Empty;
            
            // 页面第一次加载时
            if (!IsPostBack)
            {
                // 如Cookies中有UserName，则放在tbUserName，且将cbRememberMe选中
                if (Request.Cookies["UserName"] != null)
                {
                    tbUserName.Text = Request.Cookies["UserName"].Value;
                    cbRememberMe.Checked = true;
                }
                // 读失败登录计数
                int failureCount = Session["FailureCount"] == null ? 0 : (int)Session["FailureCount"];
                dvCaptcha.Visible = failureCount > 2;   //连续失败3次以上显示
            }
        }

        /// <summary>
        /// 检查验证码是否正确
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void checkCaptcha(object source, ServerValidateEventArgs args)
        {
            // 仅当Session["Captcha"] != null时检查，
            // Session["Captcha"] == null 表示验证码没有使用
            if (Session["Captcha"] != null)
            {
                string captcha = Session["Captcha"].ToString();
                // 验证码不区分大小写
                args.IsValid = captcha.ToLower().Equals(tbCaptcha.Text.ToLower());
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {           
            // 检查验证码
            if (!cvCaptcha.IsValid)
            {
                dvMessage.InnerText = "验证码错误。";
                dvMessage.Visible = true;
                return;
            }
            string userName = tbUserName.Text.Trim();
            string password = tbPassword.Text.Trim();
            bool isAuthenticated = authenticate(userName, password);
            Log(userName, isAuthenticated);     // 记录日志
            if (isAuthenticated)
            {
                // 登录成功
                remeberMe(userName);
                string referUrl = Request.QueryString["referUrl"];
                string go = string.IsNullOrEmpty(referUrl) ? "~/StudentList.aspx" : referUrl;
                Response.Redirect(go);    // 跳转至StudentList.aspx
            }
            else 
            {
                // 登录失败，显示错误消息
                dvMessage.InnerText = "用户名或密码错误。";
                dvMessage.Visible = true;
            }
        }

        /// <summary>
        /// 记录登录日志
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="state"></param>
        private void Log(string userName, bool state)
        {
            string sql = 
                "INSERT INTO LoginHistory(UserName, IpAddress, ClientOS, ClientBrowser, [State]) " +
                "VALUES(@userName, @ipAddress, @clientOS, @clientBrowser, @state)";
            DBHelper.ExecuteSql(sql,
                new SqlParameter("@userName", userName),
                new SqlParameter("@ipAddress", Request.UserHostAddress),
                //new SqlParameter("@time", "DEFAULT"),
                new SqlParameter("@clientOS", GetClientOS()),
                new SqlParameter("@clientBrowser", GetClientBrowser()),
                new SqlParameter("@state", state ? 1 : 0));
        }

        //获取操作系统版本号  
        private string GetClientOS()
        {
            string Agent = Request.ServerVariables["HTTP_USER_AGENT"];
            if (Agent.IndexOf("NT 4.0") > 0)
                return "Windows NT ";
            else if (Agent.IndexOf("NT 5.0") > 0)
                return "Windows 2000";
            else if (Agent.IndexOf("NT 5.1") > 0)
                return "Windows XP";
            else if (Agent.IndexOf("NT 5.2") > 0)
                return "Windows 2003";
            else if (Agent.IndexOf("NT 6.0") > 0)
                return "Windows Vista";
            else if (Agent.IndexOf("NT 7.0") > 0)
                return "Windows 7";
            else if (Agent.IndexOf("NT 8.0") > 0)
                return "Windows 8";
            else if (Agent.IndexOf("NT 10.0") > 0)
                return "Windows 10";
            else if (Agent.IndexOf("WindowsCE") > 0)
                return "Windows CE";
            else if (Agent.IndexOf("NT") > 0)
                return "Windows NT ";
            else if (Agent.IndexOf("9x") > 0)
                return "Windows ME";
            else if (Agent.IndexOf("98") > 0)
                return "Windows 98";
            else if (Agent.IndexOf("95") > 0)
                return "Windows 95";
            else if (Agent.IndexOf("Win32") > 0)
                return "Win32";
            else if (Agent.IndexOf("Linux") > 0)
                return "Linux";
            else if (Agent.IndexOf("SunOS") > 0)
                return "SunOS";
            else if (Agent.IndexOf("Mac") > 0)
                return "Mac";
            else if (Agent.IndexOf("Linux") > 0)
                return "Linux";
            else if (Agent.IndexOf("Windows") > 0)
                return "Windows";
            return "未知类型";
        }

        private string GetClientBrowser()
        {
            HttpBrowserCapabilities bc = Request.Browser;
            string aa = bc.Browser.ToString();
            string bb = bc.Version.ToString();
            return aa + bb;
        }

        /// <summary>
        /// 认证用户
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <param name="password">密码</param>
        /// <returns>如果登录成功，返回true，否则返回false。</returns>
        private bool authenticate(string userName, string password)
        {
            string sql = "SELECT RealName, Password, Salt FROM Users WHERE UserName = @userName";
            string salt = string.Empty;
            Session.Timeout = 30;
            using (IDataReader dr = DBHelper.ExecuteReader(sql, new SqlParameter("@userName", userName)))
            {
                if (dr.Read())
                {
                    salt = dr["Salt"].ToString();
                    string hashed = PasswordDigest.GetHashSha256(tbPassword.Text, salt);
                    if (hashed.Equals(dr["Password"]))   // 认证成功
                    {
                        Session["UserName"] = userName;
                        Session["RealName"] = dr["RealName"];                        
                        Session["FailureCount"] = 0;    // 失败登录计数清零
                        return true;
                    }
                }
                
                //设置失败登录次数
                if (Session["FailureCount"] == null)
                {
                    Session["FailureCount"] = 1;
                }
                else
                {
                    int failureCount = ((int)Session["FailureCount"]) + 1;
                    dvCaptcha.Visible = failureCount > 2;   //连续失败3次以上显示
                    Session["FailureCount"] = failureCount;
                }
                return false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void remeberMe(string userName)
        {
            HttpCookie hcUserName;
            if (cbRememberMe.Checked)
            {
                hcUserName = new HttpCookie("UserName", userName);
                hcUserName.Expires = DateTime.Now.AddMonths(1); // 保存一个月。
            }
            else
            {
                hcUserName = new HttpCookie("UserName", null);
                hcUserName.Expires = new DateTime(1970, 1, 1);
            }

            Response.Cookies.Add(hcUserName);
        }
    }
}
