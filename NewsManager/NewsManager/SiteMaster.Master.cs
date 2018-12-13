using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System;
using System.Collections;
using System.Collections.Generic;
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


namespace NewsManager
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private IList <LinkItem>  navLinks;
        public string PageTitle { get; set; }
        

        protected void Page_Load(object sender, EventArgs e)
        {
            navLinks = new List<LinkItem>();
            navLinks.Add(new LinkItem("添加新闻", "~/AddNews.aspx"));
           // navLinks.Add(new LinkItem("管理新闻", "~/EditNews.aspx"));
            navLinks.Add(new LinkItem("管理新闻（使用GridView）", "~/NewsList.aspx"));
            rMainMenu.DataSource = navLinks;
            rMainMenu.DataBind();
        }

        class LinkItem
        {
            private string _link;

            public string Text { get; set; }
            public string Link
            {
                get { return _link; }
                set
                {
                    _link = value.Replace("~/", System.Web.HttpContext.Current.Request.ApplicationPath);
                }
            }

            public LinkItem(string text, string link)
            {
                Text = text;
                Link = link;
            }
        }

        
    }
}
