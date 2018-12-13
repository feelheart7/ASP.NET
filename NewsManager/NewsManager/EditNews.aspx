<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="NewsManager.EditNews" MasterPageFile="~/SiteMaster.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">

    <asp:Label ID="lbMessage" runat="server" Text="Message" />
       <div>
    <table runat ="server" id="tbForm">
  <tr>
            <td>新闻id：</td>
            <td><asp:TextBox runat="server" ID="tbNewsId" ReadOnly="True" /></td>
        </tr>
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
            <td><asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" 
                     DataTextField="CategoryName" DataValueField="CategoryId">
                    <asp:ListItem disabled Selected>请选择类别</asp:ListItem>
                </asp:DropDownList> 
            
                       </td>
        </tr>
        <tr>
           <td colspan="2" style="text-align:center;"><asp:Button Text="修改" runat="server" 
                    ID="btnOK" onclick="btnOK_Click" /></td>
        </tr>
    </table>
       
    </div>
 </asp:Content>