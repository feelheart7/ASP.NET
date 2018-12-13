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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void CreatedUserButton_Click(object sender, EventArgs e)
        {

            string sqlStr = "insert into Users(Username,Password,Email) values (@UserName,@Password,@Email)";
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            //conn.Open();
            using (SqlCommand cmd = new SqlCommand(sqlStr, conn))
            {
                cmd.Parameters.AddWithValue("@UserName", UserName.Text);
                cmd.Parameters.AddWithValue("@Password", Password.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);
               // cmd.Parameters.AddWithValue("@ContactNum", contactnum.Text);
               // cmd.Parameters.AddWithValue("@Gender", gender.SelectedValue);
                try
                {
                    conn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lbMessage.Text = "注册成功。";
                        Response.Redirect("login.aspx", false);
                    }
                    else
                    {
                        lbMessage.Text = "注册失败。";
                        lbMessage.Style.Add("color", "red");
                    }

                }
                catch (Exception ex)
                {
                    lbMessage.Text = "注册失败。" + ex.Message;
                    lbMessage.Style.Add("color", "red");
                }




            }


        }
     
       
        protected void Reset_Click(object sender, EventArgs e)
        {
            /*userid.Text = null;
            //username.Text = null;
            code.Text = null;
            recode.Text = null;
            telephone.Text = null;
            email.Text = null;
             */

        }
    }
}
