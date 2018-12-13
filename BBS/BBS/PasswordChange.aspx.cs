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
    public partial class PasswordChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
        }
        protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
        {
            string userName = Session["UserName"].ToString();
             string sqlStr = "UPDATE Users SET Password=@Passwd where UserName='" + userName + "'";
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            using (SqlCommand cmd = new SqlCommand(sqlStr, conn))
            {  
                    conn.Open();
                    cmd.Parameters.AddWithValue("@Passwd", NewPassword.Text);
                    if (cmd.ExecuteNonQuery() == 1)
                    {   
                        Response.Redirect("PasswordChangeSuccess.aspx");
                    }
                  
                    }
               
            }
        
        protected void CancelPushButton_Click(object sender, EventArgs e)
        {

        }
    }
}
