<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="Data1_3.UserRegister" %>

<!DOCTYPE html>

<html lang="zh-cn" >
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>用户注册 - 学生信息管理系统</title>
    <meta charset="utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/userregister.css?v2" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/gijgo-combined-1.9.6/js/gijgo.min.js" type="text/javascript"></script>
    <script src="js/gijgo-combined-1.9.6/js/messages/messages.zh-cn.js" type="text/javascript"></script>
    <link href="js/gijgo-combined-1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="bg-light">
<div class="container-fluid">
    <div class="row justify-content-center">        
        <div class="col-sm-8 col-md-6">
            <h1 class="h1 mb-3 font-weight-normal text-center">学生信息管理系统</h1>
            <h3 class="h3 font-weight-normal text-center">用户注册</h3>
    <form id="form1" runat="server" novalidate>
    <div id="dvMessage" runat="server" visible="false">
        注册成功！点击<asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Login.aspx">这里</asp:HyperLink>登录。
    </div>
    <div id="dvRegisterForm" runat="server" class="form-register border-primary rounded">
        <div class="form-row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="tbUserName">用户名：</label>
                    <asp:TextBox ID="tbUserName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvUsername" runat="server" ValidateEmptyText="true"
                        ErrorMessage="" ClientValidationFunction="checkUsername" ForeColor="" CssClass="error-msg"
                        ControlToValidate="tbUserName" onservervalidate="cvUsername_ServerValidate" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-sm">
                <div class="form-group">
                    <label for="tbPassword1">密码：</label>
                    <asp:TextBox ID="tbPassword1" TextMode="Password" runat="server" CssClass="form-control" />
                    <asp:CustomValidator ID="cvPassword1" runat="server" ValidateEmptyText="true" ClientValidationFunction="checkPassword1"
                        ErrorMessage="" ControlToValidate="tbPassword1" ForeColor="" CssClass="error-msg"
                        onservervalidate="cvPassword1_ServerValidate"></asp:CustomValidator>
                </div>
            </div>
            <div class="col-sm">
                <div class="form-group">
                    <label for="tbPassword2">确认密码：</label>
                    <asp:TextBox ID="tbPassword2" TextMode="Password" runat="server" CssClass="form-control" />
                    <asp:CustomValidator ID="cvPassword2" runat="server" ValidateEmptyText="true" ClientValidationFunction="checkPassword2"
                        ErrorMessage="cvPassword2" ControlToValidate="tbPassword2" ForeColor="" CssClass="error-msg"
                        onservervalidate="cvPassword2_ServerValidate"></asp:CustomValidator>
                </div>
           </div> 
        </div>
        <div class="form-row">
            <div class="col-sm">
                <div class="form-group">
                    <label for="rbRealName">真实姓名：</label>
                    <asp:TextBox ID="tbRealName" runat="server" CssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="rvRealName" runat="server" ForeColor="" CssClass="error-msg"
                        ControlToValidate="tbRealName" ErrorMessage="请输入真实姓名" />
                </div>
            </div>
            <div class="col-sm">
                <div class="form-group">
                    <label >性别：</label>
                    <div class="form-control bg-transparent border-0">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input id="genderMale" name="Gender" type="radio" class="custom-control-input" value="M" required>
                            <label class="custom-control-label" for="genderMale">男</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input id="genderFemale" name="Gender" type="radio" class="custom-control-input" value="F" required>
                            <label class="custom-control-label" for="genderFemale">女</label>
                        </div>
                    </div>
                    <asp:CustomValidator ID="cvGender" runat="server" ErrorMessage="请选择性别。" 
                        ClientValidationFunction="checkGender" ForeColor="" CssClass="error-msg"
                        onservervalidate="cvGender_ServerValidate"></asp:CustomValidator>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-sm">
                <div class="form-group">
                    <label for="tbEmail">Email：</label>
                    <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ForeColor=""
                        ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="无效的电子邮件地址" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error-msg" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor=""
                        ControlToValidate="tbEmail" Display="Dynamic" CssClass="error-msg" ErrorMessage="请输入电子邮件地址" />
                </div>
            </div>
            <div class="col-sm">
                <div class="form-group">
                    <label for="tbPhone">电话：</label>
                    <asp:TextBox ID="tbPhone" runat="server" CssClass="form-control" />
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ForeColor="" CssClass="error-msg"
                        ControlToValidate="tbPhone" Display="Dynamic" ErrorMessage="无效手机号"
                        ValidationExpression="^1[34578]\d{9}$" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-sm-6">                
                <div class="form-group">
                <label for="tbDob">出生日期：</label>
                <input type='text' id="Dob" name="Dob" class="form-control" />                    
                <asp:CustomValidator ID="cvDob" runat="server" ValidateEmptyText="true"
                 ErrorMessage="请输入出生日期。" ForeColor="" CssClass="error-msg"
                 OnServerValidate="cbDob_ServerValidate" ClientValidationFunction="checkDob" />
                <script type="text/javascript">
                $('#Dob').datepicker({
                    uiLibrary: 'bootstrap4',
                    format: 'yyyy-mm-dd',
                    locale: 'zh-cn'
                });
        </script>
            </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-sm text-center">
                <asp:Button ID="btnOK" Text="确定" runat="server" onclick="btnOK_Click" CssClass="btn btn-lg btn-primary " />
            </div>
        </div>    
    </div>
    </form>
    </div>
    </div>
</div>
<script type="text/javascript" language="javascript">
function checkUsername(sender, args) {
    if($.trim(args.Value).length == 0) {
        sender.innerText = "请输入用户名。";
        args.IsValid = false;
        return;
    }
    if(!/^[0-9a-zA-Z_]{5,}$/.test(args.Value)) {
        sender.innerText = "用户名由5位以上字母、数字和下划线组成。";
        args.IsValid = false;
        return;
    }
}

function checkPassword1(sender, args) {
    if($.trim(args.Value).length == 0) {
        sender.innerText = "请输入密码。";
        args.IsValid = false;
        return;
    }
    if(!/^[0-9a-zA-Z_\.\?\(\)\'\"]{6,}$/.test(args.Value)) {
        sender.innerText = "密码必须由6位以上字母、数字或符号_.?()\'\"组成。";
        args.IsValid = false;
        return;
    }
    if(!(/[0-9]+/.test(args.Value) && /[a-z]+/.test(args.Value) && /[A-Z]+/.test(args.Value)) ) {
        sender.innerText = "密码必须包含数字、小写字母和大小字母。";
        args.IsValid = false;
        return;
    }
}

function checkPassword2(sender, args) {
    if($.trim(args.Value).length == 0) {
        sender.innerText = "请再次输入密码。";
        args.IsValid = false;
        return;
    }
    if(args.Value != document.getElementById('<%=tbPassword2.ClientID %>').value) {
        sender.innerText = "两次输入的密码不一致。";
        args.IsValid = false;
        return;
    }
}

function checkGender(sender, args) {
    args.IsValid = document.getElementById("genderMale").checked || document.getElementById("genderFemale").checked;
}

function checkDob(sender, args) {
    args.Value = document.getElementById("Dob").value;
    if($.trim(args.Value).length == 0) {
        sender.innerText = "请输入出生日期。";
        args.IsValid = false;
        return;
    }
    var r = new RegExp("^[1-2]\\d{3}-(0?[1-9]||1[0-2])-(0?[1-9]||[1-2][0-9]||3[0-1])$");
    if(!r.test(args.Value)) {
        sender.innerText = "请输入有效的出生日期。";
        args.IsValid = false;
        return;
    }
}
</script>
</body>
</html>
