<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Data1_3.Login" %>

<!DOCTYPE html>

<html lang="zh-cn" >
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">   
    <title>用户登录 - 学生信息管理系统</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
<script type="text/javascript" language="javascript">
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
</head>
<body class="">
<div class="container-fluid">
    <div class="row justify-content-center">
        
        
        <div class="col-sm-8 col-md-6">
            <h1 class="h1 mb-3 font-weight-normal text-center">学生信息管理系统</h1>
            <form id="form1" runat="server" class="form-signin needs-validation" novalidate>
            <h3 class="h4 mb-3 font-weight-normal text-center">请登录</h3>      
            <div ID="dvMessage" runat="server" Visible="false" class="alert alert-danger"></div>
            <label for="tbUserName" class="sr-only">用户名：</label>
            <asp:TextBox ID="tbUserName" runat="server" CssClass="form-control" placeholder="用户名" required></asp:TextBox>
            <div class="invalid-feedback">请输入用户名。</div>

            <label for="tbUserName" class="sr-only">密码：</label>
            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" CssClass="form-control " placeholder="密码" required/>
            <div class="invalid-feedback">请输入密码。</div>
            <div runat="server" id="dvCaptcha" class="form-group mt-1 mb-1">
                <div class="row align-items-center">
                    <div class="col-4 pr-0"><img id="img_code" class="img-fluid" src="Captcha.aspx" onclick="f_refreshtype()" />  </div>
                    <div class="col-8"><asp:TextBox ID="tbCaptcha" runat="server" CssClass="form-control " placeholder="请输入验证码" required EnableViewState="false"/></div>
                </div>
                <div class="text-secondary" style="font-size:0.75em;">看不清？点击验证码图像更换。
                <asp:CustomValidator ID="cvCaptcha" runat="server" ErrorMessage="验证码错误" class="invalid-feedback" OnServerValidate="checkCaptcha" ControlToValidate="tbCaptcha"></asp:CustomValidator></div>
            </div>
            <div class="checkbox mb-3 pl-1 text-secondary">
                <label >                  
                    <asp:CheckBox ID="cbRememberMe" runat="server"/> 记住用户名
                </label>
          </div>
            <asp:Button ID="btnLogin" Text="登录" runat="server" onclick="btnLogin_Click" CssClass="btn btn-lg btn-primary btn-block" />
            <div class="text-sm-center p-3 text-secondary" style="font-size:0.8em;">
                没有注册？点击<asp:HyperLink ID="hlRegister" runat="server" 
                    NavigateUrl="~/UserRegister.aspx">这里</asp:HyperLink>注册。
            </div>
            </form>
        </div>
        

    </div>
</div>
    
</body>
<script language="javascript" type="text/javascript">  
    function f_refreshtype() {  
        var Image1 =  document.getElementById("img_code");  
        if (Image1 != null) {  
            Image1.src = Image1.src + "?";  
        }  
    }  
</script>  
</html>
