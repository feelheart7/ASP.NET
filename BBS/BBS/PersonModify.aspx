<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PersonModify.aspx.cs" Inherits="BBS.PersonModify" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="panel panel-primary">
   <div class="panel-heading">
              <h3 class="panel-title"> <strong>用户信息</strong></h3>
    </div>

                <table cellpadding="0" cellspacing="0" width="600px" style="height:500px;" id="table1"  border="0"
                                    class="register_table" align="center">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="Label2" runat="server" Style="color: red"></asp:Label>
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                            <asp:Label ID="lbMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                   
                    
                      <tr>
                        <td style="text-align:right; width: 139px;">手机号码：</td>
                        <td style="text-align:left; width: 452px;" align="center"><asp:TextBox ID="phone" runat="server" 
                                 CssClass="input"></asp:TextBox></td>
                    </tr>
                    
                    <tr>
                        <td style="text-align:right; width: 139px;">E-mail：</td>
                        <td style="text-align:left; width: 452px;" align="center"><asp:TextBox ID="email" runat="server" 
                                CssClass="input"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="text-align:right; width: 139px;">性别：</td>
                        <td style="text-align:left; width: 452px;" align="center">
                            <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:RadioButtonList>
                        </td>
                    </tr>    
                    <tr>
                        <td style="text-align:right; width: 139px;">&nbsp;</td>
                        <td style="text-align:left; width: 452px;" align="center">&nbsp;</td>
                    </tr>                                        
                     <tr>
                        <td style="height: 21px; width: 139px;"></td>
                        <td style="text-align:left; height: 21px; width: 452px;" align="center">
                            <asp:Button ID="btnkOK" runat="server" Text="修改" Width="90px" 
                                style="font-size: 12px" OnClick="Button1_Click" CssClass="button" />
                            <asp:Button ID="Button2" runat="server" Text="取消" Width="90px" style="font-size: 12px" OnClick="Button2_Click" CssClass="button" />&nbsp;
                            </td>
                         
                     </tr> 
                     <tr>
                        <td colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                ShowMessageBox="True" ShowSummary="False" />
                         </td>
                    </tr>                               
                </table>
    
</div>


</asp:Content>

