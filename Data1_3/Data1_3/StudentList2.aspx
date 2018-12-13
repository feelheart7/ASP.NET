<%@ Page Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="StudentList2.aspx.cs" Inherits="Data1_3.StudentList2" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">
  <h3 class="p-2">学生列表</h3>    
  <div class="m-1">
    <asp:TextBox ID="tbSearchKey" runat="server" placeholder="按姓名查询"/><asp:RequiredFieldValidator ID="rfvSearchKey" Display="Dynamic" ControlToValidate="tbSearchKey"
        runat="server" ErrorMessage="请输入关键字"></asp:RequiredFieldValidator>
    <asp:Button ID="btnSearch" Text="查询" runat="server" onclick="btnSearch_Click" />
    <asp:Button ID="btnShowAll" runat="server" Text="显示所有" CausesValidation="False" 
          onclick="btnShowAll_Click" />
  </div>
  
    <asp:GridView ID="gvStudents" runat="server" AllowSorting="True" 
        EmptyDataText="无记录" AutoGenerateColumns="False" AllowPaging="True" 
        CssClass="table table-striped table-sm" DataKeyNames="StudentId" 
        DataSourceID="dsStudent" GridLines="None">
        <Columns>            
            <asp:BoundField DataField="StudentId" HeaderText="学号" 
                SortExpression="StudentId" ReadOnly="True" />
            <asp:BoundField DataField="StudentName" HeaderText="姓名" 
                SortExpression="StudentName" />
            <asp:TemplateField HeaderText="年龄" SortExpression="Age">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlAge" runat="server">
                        <asp:ListItem disabled="disabled" selected="selected" Value="-1">请选择年龄</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="性别" SortExpression="Gender">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Text="男" Value="M"></asp:ListItem>
                        <asp:ListItem Text="女" Value="F"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# "M".Equals(Eval("Gender")) ? "男" : "女" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="班级" SortExpression="ClassName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" 
                        DataTextField="ClassName" DataValueField="ClassId" >
                    <asp:ListItem disabled="disabled">请选择班级</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField HeaderText="操作" ShowDeleteButton="True" 
                ShowEditButton="True" />
            <asp:HyperLinkField DataNavigateUrlFields="StudentId" 
                DataNavigateUrlFormatString="ModifyStudent.aspx?StudentId={0}" HeaderText="详细" 
                Text="详细" />
            <asp:TemplateField>                
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" 
                        ImageUrl='<%# Eval("PhotoFile", "~/UploadPhotos/{0}") %>' Width="50px" />
                   <%--<img src='<%# Eval("PhotoFile", "UploadPhotos/{0}") %>' />--%>
                </ItemTemplate>
                <ItemStyle Height="50px" Width="50px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsStudent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM Students WHERE (StudentId = @studentId)" 
        SelectCommand="SELECT Class.ClassName, Students.StudentId, Students.ClassId, Students.StudentName, Students.Age, Students.Gender, Students.PhotoFile FROM Class INNER JOIN Students ON Class.ClassId = Students.ClassId" 
        
        UpdateCommand="UPDATE Students SET StudentName = @studentName, Age = @age, Gender = @gender, ClassId = @classId WHERE (StudentId = @studentId)"  >
        <DeleteParameters>
            <asp:Parameter Name="studentId" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="studentName" />
            <asp:Parameter Name="age" />
            <asp:Parameter Name="gender" />
            <asp:Parameter Name="classId" />
            <asp:Parameter Name="studentId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSearch" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
         SelectCommand="SELECT Class.ClassName, Students.StudentId, Students.ClassId, Students.StudentName, Students.Age, Students.Gender FROM Class INNER JOIN Students ON Class.ClassId = Students.ClassId
WHERE Students.StudentName LIKE @searchKey">
</asp:SqlDataSource> 
</asp:Content>
