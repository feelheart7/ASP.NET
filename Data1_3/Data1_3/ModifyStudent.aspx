<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyStudent.aspx.cs" Inherits="Data1_3.ModifyStudent" MasterPageFile="~/SiteMaster.Master" %>

<asp:Content ContentPlaceHolderID="cplMain" runat="server">
    <div id="divSuccessMessage" runat="server" visible="false" class="alert alert-success">
        更新学生信息成功。
    </div>
    <div id="divErrorMessage" runat="server" visible="false" class="alert alert-danger">
        更新学生信息失败。<br />
        <asp:Literal ID="ltrExceptionMessage" runat="server"></asp:Literal>
    </div>
    <table id="tbForm" runat="server">
        <thead>
            <tr><th colspan="2">修改学生信息</th></tr>
        </thead>
        <tbody>
            <tr>
                <td>学号：</td>
                <td><asp:TextBox ID="tbStudentId" runat="server" Enabled="false" /></td>
                
            </tr>
            <tr>
                <td>姓名：</td>
                <td><asp:TextBox ID="tbStudentName" runat="server" /></td>
            </tr>
            <tr>
                <td>班级：</td>
                <td><asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" 
                        DataTextField="ClassName" DataValueField="ClassId" >
                    <asp:ListItem disabled="disabled">请选择班级</asp:ListItem>
                    </asp:DropDownList>                    
                </td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td>
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" 
                        RepeatLayout="Flow">
                        <asp:ListItem Value="M">男</asp:ListItem>
                        <asp:ListItem Value="F">女</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td>
                    <asp:DropDownList ID="ddlAge" runat="server">
                        <asp:ListItem disabled="disabled">请选择年龄</asp:ListItem>
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
                </td>
            </tr>  
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnOK" Text="确定" runat="server" onclick="btnOK_Click" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
