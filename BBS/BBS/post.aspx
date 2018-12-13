<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="post.aspx.cs" Inherits="BBS.post" Title="发布帖子" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<body>

<div id="containers" 
        style=" background-image:url('public/image/background.jpg'); height: 600px;"> 
<div id="con" style="margin:0 auto;
width:800px; margin-top:0px; position: absolute; margin-left:0px;">
<div class="panel panel-primary">
   <div class="panel-heading">
              <h3 class="panel-title"></span> <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="发布新帖子"></asp:Label></strong></h3>
    </div>
   
    <asp:Label ID="lbMessage" runat="server" ></asp:Label>
   
    <br />
    <br />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:TextBox ID="title" runat="server" placeholder="请输入标题"
        oninit="TextBox_Init" BackColor="#ECFFFF" Height="42px" Width="750px" 
        BorderStyle="None"></asp:TextBox>
    <br />
    
   <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="content" runat="server" TextMode="MultiLine"  placeholder="请输入帖子内容"
        BackColor="#ECFFFF" BorderColor="#0066FF" BorderStyle="Groove" Height="200px" 
        Width="750px"></asp:TextBox>

    <br />

    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;

    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" 
        Width="64px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="取消" onclick="Button2_Click" 
        Width="64px" />
         <br />
    <br />
</div>
</div>
</div>


</body>
</asp:Content>

