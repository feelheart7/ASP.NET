using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;

namespace Data1_3
{
    public class PasswordDigest
    {
        /// <summary>
        /// 对用户输入的密码进行加密
        /// </summary>
        /// <param name="passWord">输入的明文密码</param>
        /// <param name="salt">加密过程中产生的盐值</param>
        /// <returns>加密后的密码值</returns>
        public static string GetHashSha256AndSalt(string passWord, out string salt)
        {
            //首先生成随机加密盐
            RandomNumberGenerator saltNumber = new RNGCryptoServiceProvider();
            byte[] s = new byte[256];
            saltNumber.GetBytes(s);
            salt = Convert.ToBase64String(s); //将盐值转化为字符串
            return GetHashSha256(passWord, salt);//针对盐值和密码一起应用hash加密函数，得到明文密码
        }
        /// <summary>
        /// 对用户输入的密码采用指定的盐值进行加密
        /// </summary>
        /// <param name="passWord">输入的明文密码</param>
        /// <param name="salt">指定的盐值</param>
        /// <returns>加密后的密码值</returns>
        public static string GetHashSha256(string passWord, string salt)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(salt + passWord); //将盐值和密码进行组合
            SHA256Managed hashstring = new SHA256Managed();
            byte[] hash = hashstring.ComputeHash(bytes);//针对组合后的数据应用hash函数
            string hashString = string.Empty;
            foreach (byte x in hash)
            {
                hashString += String.Format("{0:x2}", x);
            }
            return hashString; //得到加密后的密文字符串
        }
    }
}
