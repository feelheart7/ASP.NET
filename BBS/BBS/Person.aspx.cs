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
    public partial class Person : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
            else
            {
                this.Bind();
            }
        }
        private void Bind()
        {
            string userName = Session["UserName"].ToString();
            username.Text = userName;       
            string sqlStr = "select * from Users where UserName='" + userName + "'";
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            using (SqlCommand cmd = new SqlCommand(sqlStr, conn))
            {
                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    if (rd.Read())
                    {
                        this.phone.Text = rd["ContactNum"].ToString();
                        this.email.Text = rd["Email"].ToString();
                        this.gender.Text = rd["Gender"].ToString();
                        rd.Close();

                    }
                    else
                    {
                        rd.Close();
                    }
                }
            }
        }
    }
}