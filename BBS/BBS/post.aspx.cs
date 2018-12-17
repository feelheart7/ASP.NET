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
    public partial class post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
        }
        protected void TextBox_Init(object sender, EventArgs e)
        {

        }
        protected void TextBoxInit()
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string userName = Session["UserName"].ToString();
            System.DateTime currentTime = new System.DateTime();
            currentTime = System.DateTime.Now;
            string sqlStr = "insert into Posts(Title,[Content],Username,PostTime) values (@Title,@Content,@Username,@PostTime)";
              string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);


                using (SqlCommand cmd = new SqlCommand(sqlStr, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", title.Text);
                    cmd.Parameters.AddWithValue("@Content", content.Text);
                    cmd.Parameters.AddWithValue("@Username", userName);
                    cmd.Parameters.AddWithValue("@PostTime", currentTime);

                    try
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                        {
                            lbMessage.Text = "发布成功。";

                        }
                        else
                        {
                            lbMessage.Text = "发布失败。";
                            lbMessage.Style.Add("color", "red");
                        }

                    }
                    catch (Exception ex)
                    {
                        lbMessage.Text = "发布失败。" + ex.Message;
                        lbMessage.Style.Add("color", "red");
                    }


                }


            
                Response.Redirect("index.aspx");

            }
        protected void Button2_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("index.aspx", true);
        }
        }
    }
