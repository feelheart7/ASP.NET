<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="BBS.Search" Title="搜索页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="搜索内容如下:"></asp:Label> 
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1">
            <Columns>
               <asp:HyperLinkField DataTextField="Title" HeaderText="帖子" 
                                SortExpression="Title" DataNavigateUrlFields="PostsID" 
                                DataNavigateUrlFormatString="tcontent.aspx?PostsID={0}"/>
                
                  <asp:HyperLinkField DataTextField="UserName" HeaderText="作者" 
                                SortExpression="UserName" DataNavigateUrlFields="UserName" 
                                DataNavigateUrlFormatString="Search.aspx?id={0}"/>
                
                
                
                <asp:BoundField DataField="PostTime" HeaderText="发布时间" 
                    SortExpression="PostTime" />
                <asp:BoundField DataField="ReadTimes" HeaderText="阅读次数" 
                    SortExpression="ReadTimes" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT [Title], [UserName], [PostTime], [ReadTimes], [PostsID]  FROM [Posts] WHERE (([Title] LIKE '%' + @Title + '%') OR ([Content] LIKE '%' + @Content + '%') OR ([UserName] LIKE '%' + @UserName + '%'))">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="aa" Name="Title" SessionField="aa" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="aa" Name="Content" SessionField="aa" 
                    Type="String" />
                 <asp:SessionParameter DefaultValue="aa" Name="UserName" SessionField="aa" 
                    Type="String" />    
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
</asp:Content>
