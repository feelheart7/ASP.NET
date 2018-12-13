using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text.RegularExpressions;
using System.Globalization;



namespace Data1_3
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string sql =    "INSERT INTO Users(UserName, Password, Salt, Email, RealName, Gender, Phone, Dob) " +
                                "Values(@userName, @password, @salt, @email, @realName, @gender, @phone, @dob)";
                SqlParameter pUserName = new SqlParameter("@userName", tbUserName.Text.Trim());
                string salt = string.Empty;
                string hashed = PasswordDigest.GetHashSha256AndSalt(tbPassword1.Text, out salt);
                SqlParameter pPassword = new SqlParameter("@password", hashed);
                SqlParameter pSalt = new SqlParameter("@salt", salt);
                SqlParameter pEmail = new SqlParameter("@email", tbEmail.Text.Trim());
                SqlParameter pRealName = new SqlParameter("@realName", tbRealName.Text.Trim());
                SqlParameter pGender = new SqlParameter("@gender", Request.Params["Gender"]);
                SqlParameter pPhone = new SqlParameter("@phone", tbPhone.Text.Trim());
                SqlParameter pDob = new SqlParameter("@dob", DateTime.Parse(Request.Params["Dob"].Trim()));
                if (DBHelper.ExecuteSql(sql, pUserName, pPassword, pSalt, pEmail, pRealName, pGender, pPhone, pDob) == 1)
                {
                    dvMessage.Visible = true;
                    dvRegisterForm.Visible = false;
                }
            }
        }

        #region 服务器端验证方法
        protected void cvPassword2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(args.Value))
            {
                cvPassword2.ErrorMessage = "请再次输入密码。";
                args.IsValid = false;
            }
            if (!tbPassword1.Text.Equals(tbPassword2.Text))
            {
                cvPassword2.ErrorMessage = "两次输入的密码不一致。";
                args.IsValid = false;
            }
        }

        protected void cvUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(args.Value))
            {
                cvUsername.ErrorMessage = "请输入用户名。";
                args.IsValid = false;
            }
            Regex reg = new Regex("^[0-9a-zA-Z_]{5,}$");
            if (!reg.IsMatch(args.Value))
            {
                cvUsername.ErrorMessage = "用户名由5位以上字母、数字和下划线组成。";
                args.IsValid = false;
            }
        }

        protected void cvPassword1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(args.Value))
            {
                cvPassword1.ErrorMessage = "请输入密码。";
                args.IsValid = false;
            }
            Regex reg1 = new Regex("^[0-9a-zA-Z_\\.\\?\\(\\)\\\'\\\"]{6,}$");
            if (!reg1.IsMatch(args.Value))
            {
                cvPassword1.ErrorMessage = "密码必须由6位以上字母、数字或符号_.?()\'\"组成。";
                args.IsValid = false;
            }
            Regex reg2 = new Regex("[0-9]+");
            Regex reg3 = new Regex("[a-z]+");
            Regex reg4 = new Regex("[A-Z]+");
            if (!(reg2.IsMatch(args.Value) && reg3.IsMatch(args.Value) && reg4.IsMatch(args.Value)))
            {
                cvPassword1.ErrorMessage = "密码必须包含数字、小写字母和大小字母。";
                args.IsValid = false;
            }
        }

        protected void cbDob_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // 验证非ASP.Net控件，页面中不设置ControlToValidate属性，
            // 通过Request.Params取出表单中HTML输入控件的值
            string dobValue = Request.Params["Dob"].Trim();
            if (string.IsNullOrEmpty(dobValue))
            {
                args.IsValid = false;
                ((CustomValidator)source).Text = "请输入出生日期。";
                return;
            }
            DateTime dob;
            if (!DateTime.TryParse(dobValue, out dob))
            {
                args.IsValid = false;
                ((CustomValidator)source).Text = "请输入有效的出生日期。";
                return;
            }
        }

        protected void cvGender_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // 验证非ASP.Net控件，页面中不设置ControlToValidate属性，
            // 通过Request.Params取出表单中HTML输入控件的值
            args.IsValid = !string.IsNullOrEmpty(Request.Params["Gender"]);
        }
        #endregion
    }
}
