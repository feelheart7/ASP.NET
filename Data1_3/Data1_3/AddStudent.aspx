<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" 
Inherits="Data1_3.AddStudent" 
MasterPageFile="~/SiteMaster.Master"
ValidateRequest="false"
%>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <script src="js/tinymce/tinymce.min.js"></script>
    <script src="js/tinymce/jquery.tinymce.min.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="cplMain" runat="server">
    <h3 class="p-2">添加学生信息</h3>
    <div id="divMessage" runat="server"></div>
    <div runat="server" id="tbForm">
    <div class="row">
	    <div class="form-group col-md-4">
	    	<label>学号：</label>
	    	<asp:TextBox ID="tbStudentId" runat="server" class="form-control" placeholder="学号" />
	    	<asp:CustomValidator ID="cvStudentId" runat="server" 
	            ClientValidationFunction="checkStudentId" ControlToValidate="tbStudentId" 
	            CssClass="alert alert-danger" ForeColor="" ValidateEmptyText="True" 
	            onservervalidate="cvStudentId_ServerValidate"></asp:CustomValidator>
	    </div>  
	</div>
	<div class="row">          
	    <div class="form-group col-md-4">
	    	<label>姓名：</label>
	        <asp:TextBox ID="tbStudentName" runat="server" class="form-control" placeholder="姓名" />
	        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
	            ControlToValidate="tbStudentName" CssClass="invalid-feedback" Display="Dynamic"
	            ErrorMessage="姓名不能为空" ForeColor=""></asp:RequiredFieldValidator>
	    </div>
	    <div class="form-group col-md-4">
	    	<label>姓别：</label>
	    	<!-- <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" 
	            RepeatLayout="Flow" CssClass="form-control border-0">
	            <asp:ListItem Value="M">男</asp:ListItem>
	            <asp:ListItem Value="F">女</asp:ListItem>
	        </asp:RadioButtonList> -->
	        <div class="form-control border-0">
		        <div class="custom-control custom-radio custom-control-inline">
	                <input id="rdlMale" type="radio" name="Gender" value="M" class="custom-control-input"> <label for="rdlMale" class="custom-control-label">男</label>
	            </div>
		        <div class="custom-control custom-radio custom-control-inline">
		        	<input id="rdlFemale" type="radio" name="Gender" value="F" class="custom-control-input"> <label for="rdlFemale" class="custom-control-label">女</label>
		    	</div>
	    	</div>
	    </div>
    </div> 
    <div class="row">                              
		<div class="form-group col-md-4">
			<label>班级：</label>
			<asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" class="form-control"
	            DataSourceID="dsStudents" DataTextField="ClassName" DataValueField="ClassId" >
	            <asp:ListItem disabled="disabled" Selected Value="-1">请选择班级</asp:ListItem>
	        </asp:DropDownList>
	        <asp:SqlDataSource ID="dsStudents" runat="server" 
	            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
	            SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
	        <asp:RequiredFieldValidator ID="rvClass" runat="server" 
	                ControlToValidate="ddlClass" CssClass="invalid-feedback" Display="Dynamic" 
	                ErrorMessage="请选择班级" ForeColor="" InitialValue="-1"></asp:RequiredFieldValidator>
	    </div>	    
	    <div class="form-group col-md-4">
			<label>年龄：</label>	
		    <asp:DropDownList ID="ddlAge" runat="server" CssClass="form-control">
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
	    </div>
	</div>
	<div class="row">
	    <div class="form-group col-md-4">
	        <label>照片：</label>
	        <div class="custom-file">
              <asp:FileUpload ID="fuPhoto" runat="server" class="custom-file-input" required />
              <label class="custom-file-label" for="customFile">选择照片文件</label>
            </div>
	    </div>
	</div>
	<div class="row">
		<div class="form-group col-md-8">			
            <label>个人简历：</label>
            <textarea name="cv"></textarea>
        </div>
    </div>         
    <div class="row">
            <div class="col-md-12 text-center">
                    <asp:Button ID="btnOK" Text="确定" runat="server" onclick="btnOK_Click" 
                        CssClass="btn btn-primary" />
            </div>
    </div>
</div>
<script type="text/javascript" language="javascript">
tinymce.init({
  selector: 'textarea',
  height: 300,
  menubar: false,
  plugins: [
    'advlist autolink lists link image charmap print preview anchor textcolor',
    'searchreplace visualblocks code fullscreen',
    'insertdatetime media table contextmenu paste code help wordcount'
  ],
  theme: "modern",
  skin: "lightgray",
  toolbar: 'insert | undo redo |  formatselect | bold italic | forecolor backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
  language: 'zh_CN'
});
String.prototype.startWith=function(str){     
  var reg=new RegExp("^"+str);     
  return reg.test(this);        
}  

String.prototype.endWith=function(str){     
  var reg=new RegExp(str+"$");     
  return reg.test(this);        
}
function checkStudentId(sender, args) { 
    var value = args.Value;
    if(value == null || value == "") {
        sender.innerText = "请输入学号。";
        args.IsValid = false;
        return;
    }   
    if(args.Value.length != 11) {
        sender.innerText = "请输入11位学号。";
        args.IsValid = false;
        return;
    }
    
    if(!args.Value.startWith("2015")) {
        sender.innerText = "学号应以2015开始。";
        args.IsValid = false;
        return;
    }
}
</script>
</asp:Content>
