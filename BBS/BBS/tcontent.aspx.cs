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
    public partial class tcontent : System.Web.UI.Page
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

                string sqlRT = "update Posts set ReadTimes=ReadTimes+1 where PostsID=@PostsID";

                SqlConnection conn = new SqlConnection(strConn);
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sqlRT, conn))
                {



                    cmd.Parameters.AddWithValue("@PostsID", Session["PostsID"].ToString());
                    try
                    {

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

             

                 using (SqlCommand command = new SqlCommand(sqlStr, conn))
                    {

                        
                        command.Parameters.AddWithValue("@PostsID", Session["PostsID"].ToString());
                        

                        using (SqlDataReader rd = command.ExecuteReader())
                        {
                            if (rd.Read())
                            {

                                this.Label1.Text = rd["Title"].ToString();
                                this.username.Text = rd["UserName"].ToString();
                                this.readtimes.Text = rd["ReadTimes"].ToString();
                                this.posttime.Text = rd["PostTime"].ToString();
                                TextBox2.Text = "    " + rd["Content"].ToString();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["PostsID"] = Request.QueryString["PostsID"];
            Response.Redirect("reply.aspx", false);
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
}
}