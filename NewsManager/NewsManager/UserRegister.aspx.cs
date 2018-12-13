using System;
using System.Collections;
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

namespace NewsManager
{
    public partial class UserRegister : System.Web.UI.Page
    {
        private string connString = null;


        protected void Page_Load(object sender, EventArgs e)
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



        protected void btnOK_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {


                string sql =
                    "INSERT INTO Users(Username, Realname, Password, Email,Gender,ContactNum) " +
                    "VALUES(@newsUsername, @newsRealname, @newsPassword, @newsEmail,@newsGender, @newsContactNum)";
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {

                        cmd.Parameters.AddWithValue("@newsUsername", tbUsername.Text);
                        cmd.Parameters.AddWithValue("@newsRealname", tbRealname.Text);
                        cmd.Parameters.AddWithValue("@newsPassword", tbPassword.Text);
                        cmd.Parameters.AddWithValue("@newsEmail", tbEmail.Text);
                        cmd.Parameters.AddWithValue("@newsGender", RadioButtonList1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@newsContactNum", tbContactNum.Text);
                        try
                        {
                            conn.Open();
                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                lbMessage.Text = "注册成功。";
                               
                            }
                            else
                            {
                                lbMessage.Text = "添加失败。";
                                lbMessage.Style.Add("color", "red");
                            }

                        }
                        catch (Exception ex)
                        {
                            lbMessage.Text = "添加失败。" + ex.Message;
                            lbMessage.Style.Add("color", "red");
                        }
                    }
                }
            }
        }

        protected void cvUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;       
            string cName = args.Value;
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select Count(*) from Users where Username='" + cName + "'", conn);
            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (tbUsername.Text == "")
            {
                cvUsername.Text = "用户名输入为空";
            }
            else if (count > 0)
            {
                cvUsername.Text = "用户名已存在";
            }
            else
            {
                args.IsValid = true;
            }
            conn.Close();

        }

      


    }
}
