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

namespace Data1_3
{
    public partial class ModifyStudent : System.Web.UI.Page
    {

        string studentId = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
            {
                Response.Redirect("~/Login.aspx?referUrl=" + Server.UrlEncode(Request.Url.ToString()));
            }

            studentId = Request.Params["studentId"];
            if (string.IsNullOrEmpty(studentId))
                throw new ApplicationException("错误：无效的URL参数。");

            if (!IsPostBack)
            {
                //
                BindStudentData();
            }

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            tbForm.Visible = false;
            try
            {
                updateStudent();
                divSuccessMessage.Visible = true;
            }
            catch (Exception ex)
            {
                divErrorMessage.Visible = true;
                ltrExceptionMessage.Text = ex.Message;
            }
        }

        private void BindStudentData()
        {
            string selClaSql = "SELECT * FROM Class";
            using (SqlDataReader dr = DBHelper.ExecuteReader(selClaSql))
            {
                ddlClass.DataSource = dr;
                ddlClass.DataBind();
            }

            string selStuSql =
                "SELECT s.StudentId, s.StudentName, s.Age, s.Gender, c.ClassId, c.ClassName " +
                "FROM Students AS s INNER JOIN Class AS c " +
                "ON c.ClassId = s.ClassId " +
                "WHERE s.StudentId = @studentId";
            SqlParameter pStudentId = new SqlParameter("@studentId", SqlDbType.VarChar);
            pStudentId.Value = studentId;
            using (SqlDataReader dr = DBHelper.ExecuteReader(selStuSql, pStudentId))
            {
                if (dr.Read())
                {
                    tbStudentId.Text = dr["StudentId"].ToString();
                    tbStudentName.Text = dr["StudentName"].ToString();
                    foreach (ListItem item in rblGender.Items)
                    {
                        item.Selected = item.Value.Equals(dr["Gender"].ToString());
                    }
                    foreach (ListItem item in ddlClass.Items)
                    {
                        if (item.Value.Equals(dr["ClassId"].ToString()))
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                    foreach (ListItem item in ddlAge.Items)
                    {
                        if (item.Value.Equals(dr["Age"].ToString()))
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                }
                else
                {
                    throw new ApplicationException("错误：找不到指定的学生信息。");
                }
            }
        }

        private void updateStudent()
        {
            string updateSql =
                "UPDATE Students " +
                "   SET StudentName = @studentName, " +
                "       ClassId = @classId, " +
                "       Gender = @gender, " +
                "       Age = @age " +
                " WHERE StudentId = @studentId";
            int affectedRow = DBHelper.ExecuteSql(updateSql,
                                            new SqlParameter("@studentName", tbStudentName.Text),
                                            new SqlParameter("@classId", Int32.Parse(ddlClass.SelectedValue)),
                                            new SqlParameter("@gender", rblGender.SelectedValue.ToCharArray()[0]),
                                            new SqlParameter("@age", Int32.Parse(ddlAge.SelectedValue)),
                                            new SqlParameter("@studentId", studentId));
            if (affectedRow != 1)
                throw new ApplicationException("错误：更新受影响记录不等于1。");
        }
    }
}
