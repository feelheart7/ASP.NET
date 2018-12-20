<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NewsManager.Login" %>



<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>登录</title>
</head>
<body>
 <form id="form1" runat="server">   
    <asp:Label ID="lbMessage" runat="server" Text="登录" />
       <div>
    <table runat ="server" id="tbForm">
  <tr>
            <td>用户名：</td>
            <td class="style1"><asp:TextBox runat="server" ID="tbUsername"  />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="请输入用户名"   ControlToValidate="tbUsername" Display = Dynamic  ></asp:RequiredFieldValidator>
                    </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td class="style1"><asp:TextBox runat="server" ID="tbPassword" TextMode=Password />
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="请输入密码"   ControlToValidate="tbPassword" Display = Dynamic  ></asp:RequiredFieldValidator>
                
                
                
            </td>
        </tr>
      
      
  
    </table>
        
    </div>   
    <asp:Button Text="登录" runat="server" ID="btnOK1" onclick="btnOK_Click" />
    &nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox1" runat="server"  Text="记住用户名" Checked=false />
&nbsp;<p>
  <asp:HyperLink ID="hkMenu" runat="server" Font-Strikeout="False" 
            Font-Underline="False" NavigateUrl="~/UserRegister.aspx">注册</asp:HyperLink>  
        </p>
    </form>
  </body>
</html>
