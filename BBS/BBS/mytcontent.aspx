
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mytcontent.aspx.cs" Inherits="BBS.mytcontent" Title="我的帖子" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



 <div class="container-fluid col-md-8" style="margin-bottom:100px">
          <div class="panel panel-primary"  style="min-height:473px;width:900px;">
              <div class="panel-heading">
                <h3 class="panel-title">学习交流
                <span class="badge" style="color:#F00;">hot</span>
               
               
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT [Title], [PostsID], [PostTime] FROM [Posts] WHERE ([UserName] = @UserName)" 
                        onselecting="SqlDataSource1_Selecting" 
                        DeleteCommand="Delete from Posts where PostsID=@PostsID">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="PostsID" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                  </h3>
              </div>
              <div class="panel-body"  style="color:#666;word-wrap:break-word;">
                <asp:GridView 
                        ID="GridView1" runat="server"  AllowSorting="True" 
                   AutoGenerateColumns="False" CellPadding="4"  ForeColor="#333333" GridLines="None"
            Width="100%" Font-Size="20px" DataSourceID="SqlDataSource1" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged1" 
                        DataKeyNames="PostsID" >
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                       
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <Columns>
                         <asp:HyperLinkField DataTextField="Title" HeaderText="帖子标题" 
                                SortExpression="Title" DataNavigateUrlFields="PostsID" 
                                DataNavigateUrlFormatString="tcontent.aspx?PostsID={0}"/>  
                            <asp:BoundField DataField="PostsID" HeaderText="帖子编号" InsertVisible="False" 
                                ReadOnly="True" SortExpression="PostsID" />
                            <asp:BoundField DataField="PostTime" HeaderText="发布时间" 
                                SortExpression="PostTime" />
                            <asp:HyperLinkField NavigateUrl="Edit.aspx?PostID={0}" Text="编辑" />
                            <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                       
                        <AlternatingRowStyle BackColor="White" />
                   </asp:GridView>
               
               
                   <div style =" word-break :break-all ; word-wrap:break-word "> 
               
               
              </div>
               
               </p> 
               <hr/>
              
             
               </div>  
          </div>
        </div>

</asp:Content>
