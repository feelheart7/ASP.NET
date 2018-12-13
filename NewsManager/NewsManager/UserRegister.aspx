<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="NewsManager.UserRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>注册界面</title>
    <style type="text/css">
        .style1 {
            width: 703px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   
    <asp:Label ID="lbMessage" runat="server" Text="注册" />
       <div>
    <table runat ="server" id="tbForm">
  <tr>
            <td>用户名：</td>
            <td class="style1"><asp:TextBox runat="server" ID="tbUsername"  />
                <asp:CustomValidator ID="cvUsername" runat="server" 
                    ErrorMessage="" ControlToValidate="tbUsername" ValidateEmptyText=true 
                    onservervalidate="cvUsername_ServerValidate"></asp:CustomValidator>
                    </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td class="style1"><asp:TextBox runat="server" ID="tbPassword" TextMode=Password/>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="请输入密码"   ControlToValidate="tbPassword" Display = Dynamic  ></asp:RequiredFieldValidator>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                  ControlToValidate="tbPassword"  ErrorMessage="请输入6-18由数字或字母组成的密码" ValidationExpression="^[a-zA-Z0-9]{6,18}$" Display=Dynamic></asp:RegularExpressionValidator>
                
            </td>
        </tr>
        <tr>
            <td>确认密码：</td>
            <td class="style1"><asp:TextBox runat="server" ID="tbPassword2" TextMode=Password/>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="两次密码不一样！请重新输入！" ControlToCompare="tbPassword" ControlToValidate="tbPassword2" Operator=Equal></asp:CompareValidator>
                    </td>
        </tr>
        <tr>
             <td>姓名：</td>
            <td class="style1"><asp:TextBox runat="server" ID="tbRealname" /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="请输入姓名"   ControlToValidate="tbRealname" Display = Dynamic  ></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
             <td>性别：</td>
            <td class="style1"><asp:RadioButtonList ID="RadioButtonList1" runat="server" 
RepeatDirection="Horizontal">
<asp:ListItem>男</asp:ListItem>
<asp:ListItem>女</asp:ListItem>
</asp:RadioButtonList><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="请选择性别"   ControlToValidate="RadioButtonList1" Display = Dynamic  ></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
             <td>邮箱：</td>
            <td class="style1"><asp:TextBox runat="server" ID="tbEmail" /> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                  ControlToValidate="tbEmail"  ErrorMessage="请输入合法的邮箱地址!" ValidationExpression="^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$" Display=Dynamic></asp:RegularExpressionValidator></td>
        </tr>
        <tr> 
             <td>电话：</td>
             <td class="style1"><asp:TextBox runat="server" ID="tbContactNum" /> <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                  ControlToValidate="tbContactNum"  ErrorMessage="请输入正确的国际固话和手机号码！" ValidationExpression="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$" Display=Dynamic></asp:RegularExpressionValidator></td>
        </tr>
  
    </table>
        
    </div>   
    <asp:Button Text="注册" runat="server" ID="btnOK1" onclick="btnOK_Click" />
    </form>
      <asp:HyperLink ID="hkMenu" runat="server" Font-Strikeout="False" 
            Font-Underline="False" NavigateUrl="~/Login.aspx">返回登录</asp:HyperLink>
    </body>
</html>
