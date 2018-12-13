<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" 
Inherits="Data1_3.StudentList" MasterPageFile="~/SiteMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">        
    <h3 class="p-2">学生列表</h3>    
    <table <%--class="table table-striped table-sm"--%> width="600px">
        <%--<thead>
            <tr>
                <th>#</th>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
                <th>性别</th>
                <th>年龄</th>
                <th></th>
                <th></th>
            </tr>
        </thead>--%>
        <tbody>
            <asp:Repeater ID="rptStudent" runat="server">
                <ItemTemplate>
                    <tr>
                        <td>
                            <table border="0">
                                <tr>
                                    <td rowspan="2" height="100" valign="middle" width="10%"><%# Eval("RowNumber")%></td>
                                    <td rowspan="2"  width="150px"><asp:Image ID="Image1" runat="server" 
                                        ImageUrl='<%# Eval("PhotoFile", "~/UploadPhotos/{0}") %>' Width="100px" /></td>
                                    <td width="40%" colspan="2"><b>学号：</b><%# Eval("StudentId") %></td>
                                    <td width="30%"><b>姓名：</b><%# Eval("StudentName") %></td>
                                    <td rowspan="2" valign="middle" width="10%">
                                        <a href="ModifyStudent.aspx?studentId=<%# Eval("StudentId") %>">编辑</a>
                                    </td>
                                    <td  rowspan="2" valign="middle" width="10%">
                                        <asp:LinkButton ID="lbDelete" CommandName="Delete" CommandArgument='<%# Eval("StudentId") %>' Text="删除" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>班级：</b><%# Eval("ClassName") %></td>
                                    <td><b>性别：</b><%# "M".Equals(Eval("Gender")) ? "男" : "女" %></td>
                                    <td><b>年龄：</b><%# Eval("Age") %></td>                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>        
    </table>
    <nav aria-label="Page navigation">
      <ul class="pagination">
        <li class="page-item <%= PageIndex == 1 ? "disabled" : "" %>"><a class="page-link" href="StudentList.aspx?Page=<%=PageIndex - 1 %>">前页</a></li>
        
        <% for (int i = 1; i <= PageCount; i++)
           { %>
        <li class="page-item <%= PageIndex == i ? "active" : "" %>"><a class="page-link" href="StudentList.aspx?Page=<%=i %>"><%=i%></a></li>
        <%} %>
        <li class="page-item <%= PageIndex == PageCount ? "disabled" : "" %>"><a class="page-link" href="StudentList.aspx?Page=<%=PageIndex + 1 %>">后页</a></li>
      </ul>
    </nav>
</asp:Content> 
