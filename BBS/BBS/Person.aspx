<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Person.aspx.cs" Inherits="BBS.Person" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<body>
 <div class="container-fluid col-md-8" style="margin-bottom:100px">
          <div class="panel panel-primary"  style="min-height:473px;width:900px;">
              <div class="panel-heading">
                <h3 class="panel-title">个人信息
              </div>
              <div class="panel-body"  style="color:#666;word-wrap:break-word;">
<p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
                &nbsp;<br />
            <br />
            
                &nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
             <asp:Label ID="Label2" runat="server" Text="用户名："></asp:Label>
                &nbsp;<asp:TextBox ID="username" runat="server" ReadOnly="True" Height="25px" 
                    Width="178px"></asp:TextBox>
            
             <br />
            <br />
            
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
             <asp:Label ID="Label3" runat="server" Text="性&nbsp;&nbsp;&nbsp;别："></asp:Label>
                &nbsp;<asp:TextBox ID="gender" runat="server" ReadOnly="True" Width="176px"></asp:TextBox>
            
             <br />
            <br />
            
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;&nbsp;话：&nbsp;<asp:TextBox ID="phone" runat="server" 
                    ReadOnly="True" Width="169px"></asp:TextBox>
            
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            
             <br />
            <br />
            
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 邮&nbsp;&nbsp;&nbsp;箱 ：&nbsp;<asp:TextBox ID="email" runat="server" 
                    ReadOnly="True" Height="25px" Width="165px"></asp:TextBox>
            
            
            </p>
               <p>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [UserName], [Email], [Gender], [ContactNum] FROM [Users]">
                </asp:SqlDataSource>
            
            
            </p>
            
            
             
               </div>  
          </div>
        </div>
</body>
</asp:Content>

