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
using System.IO;


namespace Data1_3
{
    public partial class AddStudent : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
            {
                Response.Redirect("~/Login.aspx?referUrl=" + Server.UrlEncode(Request.Url.ToString()));
            }
           
            ((SiteMaster)this.Master).PageTitle = "添加学生";
            
            if (!IsPostBack)
            {
                divMessage.Visible = false;
            }
            else
            {
                divMessage.Visible = true;
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (!IsValid)
                return;

            tbForm.Visible = false;

            ConnectionStringSettings mySettings = ConfigurationManager.ConnectionStrings["ConnectionString"];
            if(mySettings == null || string.IsNullOrEmpty(mySettings.ConnectionString))
                throw new ApplicationException("错误：找不到数据库连接字符串！");

            string insertSql = "INSERT INTO students(StudentId, StudentName, ClassId, Age, Gender, CV, PhotoFile)" +
                               "VALUES(@studentId, @studentName, @classId, @age, @gender, @cv, @photoFile)";

            using(SqlConnection conn = new SqlConnection(mySettings.ConnectionString))
            {
                SqlTransaction tran;    //事务，防止出现数据库记录添加成功而学生照片没有成功保存。
                conn.Open();
                tran = conn.BeginTransaction();    // 开始事务
                using(SqlCommand cmd = new SqlCommand(insertSql, conn))
                {
                    cmd.Transaction = tran;
                    cmd.Parameters.AddWithValue("@studentId", tbStudentId.Text.Trim());
                    cmd.Parameters.AddWithValue("@studentName", tbStudentName.Text.Trim());
                    cmd.Parameters.AddWithValue("@classId", ddlClass.SelectedValue);
                    cmd.Parameters.AddWithValue("@age", ddlAge.SelectedValue);
                    cmd.Parameters.AddWithValue("@gender", rblGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@cv", Request.Params["cv"]);
                    try
                    {
                        string photoFileName = fuPhoto.FileName;
                        string ext = Path.GetExtension(fuPhoto.FileName);
                        string newPhotoFileName = tbStudentId.Text.Trim() + ext;
                        string photoPath = Server.MapPath("~/UploadPhotos/") + newPhotoFileName;
                        cmd.Parameters.AddWithValue("@photoFile", newPhotoFileName);

                        int affectedNo = cmd.ExecuteNonQuery();
                        fuPhoto.SaveAs(photoPath);
                        tran.Commit();   //提交事务

                        if (affectedNo == 1)
                        {
                            divMessage.InnerText = "增加学生成功。";
                            divMessage.Attributes.Add("class", "alert alert-success");
                        }
                        else
                        {
                            throw new ApplicationException("错误：数据库返回受影响的行数不为1。");
                        }
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();   //回滚事务
                        divMessage.InnerText = "增加学生失败。";
                        divMessage.Attributes.Add("class", "alert alert-danger");
                        divMessage.InnerHtml += "<br/>" + ex.Message;
                    }
                }
            }                                              
        }

        protected void cvStudentId_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(string.IsNullOrEmpty(args.Value) )
            {
                args.IsValid = false;
                cvStudentId.ErrorMessage = "请输入学号。";
            }
            if (args.Value.Length != 11)
            {
                args.IsValid = false;
                cvStudentId.ErrorMessage = "请输入11位学号。";
            }
            if (!args.Value.StartsWith("2015"))
            {
                args.IsValid = false;
                cvStudentId.ErrorMessage = "学号应以2015开始。";
            }
        }
    }
}
