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
    public partial class PersonModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = Session["UserName"].ToString();
            string sqlStr = "UPDATE Users SET Email=@Email,ContactNum=@ContactNum,Gender=@Gender where UserName='" + userName + "'";
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            using (SqlCommand cmd = new SqlCommand(sqlStr, conn))
            {
               
                cmd.Parameters.AddWithValue("@Email", email.Text);
               cmd.Parameters.AddWithValue("@ContactNum", phone.Text);
               cmd.Parameters.AddWithValue("@Gender", gender.SelectedValue);
                try
                {
                    conn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lbMessage.Text = "修改成功。";
                         Response.Redirect("Person.aspx");
                    }
                    else
                    {
                        lbMessage.Text = "修改失败。";
                        lbMessage.Style.Add("color", "red");
                    }

                }
                catch (Exception ex)
                {
                    lbMessage.Text = "修改失败。" + ex.Message;
                    lbMessage.Style.Add("color", "red");
                }




            }

               
            }



        protected void index_Click(object sender, EventArgs e)
        {

        }
        protected void Button3_Click(object sender, EventArgs e)
        {

        }
        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}
