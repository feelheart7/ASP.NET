<%@ Page Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="StudentList4.aspx.cs" Inherits="Data1_3.StudentList4" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">
    <asp:GridView ID="gvStudents" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StudentId" 
        DataSourceID="dsStudents">
        <Columns>
            <asp:BoundField DataField="StudentId" HeaderText="学号" ReadOnly="True" 
                SortExpression="StudentId" />
            <asp:BoundField DataField="StudentName" HeaderText="姓名" 
                SortExpression="StudentName" />
            <asp:BoundField DataField="Age" HeaderText="年龄" SortExpression="Age" />
            <asp:TemplateField HeaderText="性别" SortExpression="Gender">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Text="男" Value="M" />
                        <asp:ListItem Text="女" Value="F" />
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# "M".Equals(Eval("Gender")) ? "男" : "女" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ClassName" HeaderText="班级" 
                SortExpression="ClassName" />
            <asp:CommandField HeaderText="操作" ShowDeleteButton="True" 
                ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsStudents" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM Students WHERE StudentId = @studentId" 
        SelectCommand="SELECT Students.StudentId, Students.ClassId, Students.StudentName, Students.Age, Students.Gender, Class.ClassName FROM Class INNER JOIN Students ON Class.ClassId = Students.ClassId" 
        UpdateCommand="UPDATE Students SET ClassId = @classId, StudentName = @studentName, Age = @age, Gender = @gender WHERE (StudentId = @studentId)">
        <DeleteParameters>
            <asp:Parameter Name="studentId" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="classId" />
            <asp:Parameter Name="studentName" />
            <asp:Parameter Name="age" />
            <asp:Parameter Name="gender" />
            <asp:Parameter Name="studentId" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
