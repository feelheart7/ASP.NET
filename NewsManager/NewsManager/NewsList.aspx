<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsList.aspx.cs" Inherits="NewsManager.NewsList" MasterPageFile="~/SiteMaster.Master"%>




<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">

   
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ConnectionString" Height="215px" Width="529px" 
        AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
        GridLines="Vertical" DataKeyNames="NewsId">
        <Columns>
            
            <asp:BoundField DataField="NewsId" HeaderText="ID" ReadOnly="True" 
                SortExpression="NewsId"  />
            <asp:BoundField DataField="Title" HeaderText="标题" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="作者" 
                SortExpression="Author" />
            <asp:BoundField DataField="Content" HeaderText="内容" 
                SortExpression="Content" />
            <asp:BoundField DataField="AddTime" HeaderText="添加时间" 
                SortExpression="AddTime" />
            <asp:BoundField DataField="CategoryName" HeaderText="分类" 
                SortExpression="CategoryId" />
            <asp:HyperLinkField DataNavigateUrlFields="NewsId" 
                DataNavigateUrlFormatString="EditNews.aspx?NewsId={0}" Text="编辑" />
            <asp:CommandField ShowDeleteButton="True" />
            
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="ConnectionString" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT s.NewsId, s.Title, s.Author, s.Content,s.AddTime,c.CategoryName
 FROM News AS s INNER JOIN NewsCategory AS c 
     ON s.CategoryId = c.CategoryId" 
        DeleteCommand="DELETE FROM News WHERE NewsId = @NewsId">
        <DeleteParameters>
             <asp:Parameter Name="student_num" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>    
    
    
    
