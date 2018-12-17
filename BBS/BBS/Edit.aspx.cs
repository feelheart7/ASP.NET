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
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
            else
            {


                string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                Session["PostsID"] = Request.QueryString["PostsID"];
                string sqlStr = "select * from Posts where PostsID=@PostsID";



                if (!IsPostBack)
                {

                    SqlConnection conn = new SqlConnection(strConn);
                    conn.Open();



                    using (SqlCommand command = new SqlCommand(sqlStr, conn))
                    {


                        command.Parameters.AddWithValue("@PostsID", Session["PostsID"].ToString());


                        using (SqlDataReader rd = command.ExecuteReader())
                        {
                            if (rd.Read())
                            {

                                this.title.Text = rd["Title"].ToString();


                                content.Text = "    " + rd["Content"].ToString();
                                rd.Close();

                            }

                            else
                            {
                                rd.Close();
                            }

                        }
                    }
                    conn.Close();

                }

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

            string sqlStr = "Update Posts set Title=@Title, Content=@Content WHERE PostsID = @PostsID";
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);


            using (SqlCommand cmd = new SqlCommand(sqlStr, conn))
            {
                cmd.Parameters.AddWithValue("@Title", title.Text);
                cmd.Parameters.AddWithValue("@Content", content.Text);
                cmd.Parameters.AddWithValue("@PostsID", Session["PostsID"].ToString());
               // cmd.Parameters.AddWithValue("@Username", userName);
               // cmd.Parameters.AddWithValue("@PostTime", currentTime);

                try
                {
                    conn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                      

                    }
                    else
                    {
                      
                    }

                }
                catch (Exception ex)
                {
                   
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
