<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="NewsManager.AddNews" MasterPageFile="~/SiteMaster.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">
    <asp:Label ID="lbMessage" runat="server" Text="Message" />
       <div>
       <p></p>
       <p></p>
       <p></p>
    <table runat ="server" id="tbForm">
  
        <tr>
            <td>新闻标题：</td>
            <td><asp:TextBox runat="server" ID="tbNewsTitle" /></td>
        </tr>
        <tr>
            <td>作者：</td>
            <td><asp:TextBox runat="server" ID="tbNewsAuthor" /></td>
        </tr>
        <tr>
             <td>内容：</td>
            <td><asp:TextBox runat="server" ID="tbNewsContent" /></td>
        </tr>
        <tr>
             <td>发布时间：</td>
            <td><asp:TextBox runat="server" ID="tbNewsTime" /></td>
        </tr>
        <tr>
             <td>新闻类别：</td>
            <td>
            <asp:DropDownList runat="server" ID="tbCategory"  
            AppendDataBoundItems="True" DataSourceID="ds_newCategory" 
            DataTextField="CategoryName" DataValueField="CategoryId">
            
            <asp:ListItem disabled Selected="">请选择</asp:ListItem>
            </asp:DropDownList>
            
                <asp:SqlDataSource ID="ds_newCategory" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [CategoryId], [CategoryName] FROM [NewsCategory]">
                </asp:SqlDataSource>
                       </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;"><asp:Button Text="发布" runat="server" 
                    ID="btnOK" onclick="btnOK_Click" /></td>
        </tr>
    </table>
       
    </div>
</asp:Content> 