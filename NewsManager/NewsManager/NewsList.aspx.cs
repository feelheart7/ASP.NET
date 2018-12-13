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
    public partial class NewsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"]==null)
            {
                base.Response.Redirect("Login.aspx", true);
            
            }
            ((Site1)this.Master).PageTitle = "新闻列表";
           // String realname = Session["Realname"].ToString();
            //lbMessage.Text = "您好，【"+realname+"】" ;


        }
    }
}
