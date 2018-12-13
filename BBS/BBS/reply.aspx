<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reply.aspx.cs" Inherits="BBS.reply" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<form id="form1" runat="Server">
<body style="margin:0;border:0" class="Body">
   
       <table width="100%" border="0" cellspacing="0" cellpadding="0" runat="server">
              <tr>
                <td bgcolor="#E9E7E3"><table width="1001" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top" bgcolor="#E9E7E3"><table width="99%" border="0" cellPadding="5" 
                              cellSpacing="0" bgcolor="#FFFFFF" 
                              style="margin-left:10px; margin-top:10px; margin-bottom:10px">
                        <tr>
                          <td bgcolor="#DEDEDE"><b>在线论坛:帖子版面</b></td>
                        </tr>
                        <tr>
                          <TD height="1" bgcolor="#CCCCCC">
                                 <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				帖子名称:</td>
			<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="300px" Enabled="False"></asp:TextBox>
			    <asp:Label ID="lbMessage" runat="server" ></asp:Label>
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="top" class="LeftTD" align="right">
				回复内容:</td>
			<td valign="middle"><asp:TextBox ID="tbBody" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="8000" Width="560px" Height="300px" TextMode="MultiLine"></asp:TextBox>
				<asp:RequiredFieldValidator ID="rfBody" runat="server" ControlToValidate="tbBody"
					Display="Dynamic" ErrorMessage="回复内容不能为空！"></asp:RequiredFieldValidator>
			</td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
                &nbsp;<asp:Button ID="btnUpdateAndReturn" runat="server" CssClass="Button" SkinID="btnSkin" Text="回复，并返回" OnClick="btnUpdateAndReturn_Click"/>
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" Width="80px" /></td>
		</tr>
    </table> 
                             </td>
                        </tr>
                        <tr>
                          <TD height="1" bgcolor="#EDEDED">
				              &nbsp;</TD>
                        </tr>
											
											</td>
                    </tr>
                </table></td>
              </tr>
            </table> 

</body>
</form>

</html>

