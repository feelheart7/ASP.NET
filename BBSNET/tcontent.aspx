<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tcontent.aspx.cs" Inherits="BBS.tcontent" Title="帖子内容" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="container">
      <div class="row">
         <div class="col-md-12">
              <div class="panel panel-primary"  
                  style="min-height:473px;width:845px; height: 696px;">
              <div class="panel-heading">
                <h3 class="panel-title" style="text-align:center;font-size:25px;">帖子内容</h3>
              </div>
              
<br />
          <h4 style="color:#666;text-align:center;font-size:20px;"> <span class="pull-center"><asp:Label ID="Label1" runat="server"
              Text="Label"></asp:Label></span>  </h4>
                  <span class="pull-center">
                  <asp:Label ID="Label2" runat="server" Text="发布者："></asp:Label>
                  </span>  
                  <asp:Label ID="username" runat="server" ></asp:Label>
                  <asp:Label ID="Label4" runat="server" Text="           "></asp:Label>
                  <asp:Label ID="Label5" runat="server" Text="阅读量："></asp:Label>
                  <asp:Label ID="readtimes" runat="server"></asp:Label>
                  <asp:Label ID="Label6" runat="server" Text="发布时间："></asp:Label>
                  <asp:Label ID="posttime" runat="server"></asp:Label>
          <br/>
          <hr/>
            <div style =" word-break :break-all;word-wrap:break-word; text-align:center; height: 456px; width: 865px;"> 
         <asp:TextBox ID="TextBox2" runat="server" Width="715px" Height="405px" ReadOnly="true"
                    TextMode="MultiLine" BorderStyle="None" style="margin-left: 0px"></asp:TextBox>
                
              
                
              </div>
          <div style="text-align:center">
         <asp:Button ID="Button1" runat="server" Text="评论" onclick="Button1_Click" 
                  Height="36px" Width="105px" BackColor="AliceBlue" ForeColor="Black" />
         </div>
         </div>
      </div>
 
        </div>
                            <h3 class="panel-title" 
                                style="text-align:center;font-size:25px; height: 31px; width: 844px;">评论详情</h3>
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataSourceID="SqlDataSource1" Width="763px" CellPadding="4" 
          ForeColor="#333333" GridLines="None" Height="205px">
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <Columns>
              <asp:BoundField DataField="UserName" HeaderText="评论用户名" 
                  SortExpression="UserName" />
              <asp:BoundField DataField="Content" HeaderText="评论内容" 
                  SortExpression="Content" />
              <asp:BoundField DataField="ReplyTime" HeaderText="评论时间" 
                  SortExpression="ReplyTime" />
          </Columns>
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
      </asp:GridView>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
          SelectCommand="SELECT [UserName], [Content], [ReplyTime] FROM [Reply] WHERE ([PostsID] = @PostsID)">
          <SelectParameters>
              <asp:SessionParameter Name="PostsID" SessionField="PostsID" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>


</asp:Content>

