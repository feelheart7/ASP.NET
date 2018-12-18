<%@ Page Language="C#" MasterPageFile="~/BBSHead.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="BBS.login" Title="登录页面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">      
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


<div class="container-fluid" style="width:600px;height:280px">
    <div class="row justify-content-center">
        
        
        <div class="col-sm-8 col-md-6" >
            <h1 class="h1 mb-3 font-weight-normal text-center">校园计算机论坛</h1>
          
            <h3 class="h4 mb-3 font-weight-normal text-center">请登录</h3>      
            <div ID="dvMessage" runat="server" Visible="false" class="alert alert-danger"></div>
            <label for="tbUserName" class="sr-only">用户名：</label>
            <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="用户名" required></asp:TextBox>
            <div class="invalid-feedback">请输入用户名。</div>

            <label for="tbUserName" class="sr-only">密码：</label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control " placeholder="密码" required/>
            <div class="invalid-feedback">请输入密码。</div>
          <%--  <div runat="server" id="dvCaptcha" class="form-group mt-1 mb-1">
                <div class="row align-items-center">
                    <div class="col-4 pr-0"><img id="img_code" class="img-fluid" src="Captcha.aspx" onclick="f_refreshtype()" />  </div>
                    <div class="col-8"><asp:TextBox ID="tbCaptcha" runat="server" CssClass="form-control " placeholder="请输入验证码" required EnableViewState="false"/></div>
                </div>
                <div class="text-secondary" style="font-size:0.75em;">看不清？点击验证码图像更换。
                <asp:CustomValidator ID="cvCaptcha" runat="server" ErrorMessage="验证码错误" class="invalid-feedback" OnServerValidate="checkCaptcha" ControlToValidate="tbCaptcha"></asp:CustomValidator></div>
            </div>
          --%>
            <div class="checkbox mb-3 pl-1 text-secondary">
                <label >                  
                    <asp:CheckBox ID="cbRememberMe" runat="server"/> 记住用户名
                </label>
          </div>
          验证码：
          <asp:TextBox ID="tbx_yzm" runat="server" Width="70px"></asp:TextBox>
         <asp:ImageButton ID="ibtn_yzm" runat="server" />
         点击图片更换验证吗
         <asp:Button ID="btnLogin" Text="登录" runat="server" onclick="btnLogin_Click" CssClass="btn btn-lg btn-primary btn-block" />
            <div class="text-sm-center p-3 text-secondary" style="font-size:0.8em;">
                没有注册？点击<asp:HyperLink ID="hlRegister" runat="server" 
                    NavigateUrl="~/register.aspx">这里</asp:HyperLink>注册。
            </div>
        </div>
        <asp:Label ID="lbMessage" runat="server" ></asp:Label>
  </div>      

    </div>

    
<script type="text/javascript">



<script language="javascript" type="text/javascript">  
    function f_refreshtype() {  
        var Image1 =  document.getElementById("img_code");  
        if (Image1 != null) {  
            Image1.src = Image1.src + "?";  
        }  
    }  
</script>  
 </asp:Content>                



