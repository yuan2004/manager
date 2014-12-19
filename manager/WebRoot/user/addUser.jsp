<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>会员系统</title>
<meta name="robots" content="noindex, nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/admin/js/listTable.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script type="text/javascript" src="/js/validateFormUtil.js"></script>
<script type="text/javascript" src="employ.js"></script>
<script type="text/javascript" src="/js/CJL.0.1.min.js"></script>
<script type="text/javascript" src="/js/QuickUpload.js"></script>
<script type="text/javascript" src="/js/ImagePreviewd.js"></script>
<script type="text/javascript">
	function doSubmit() {
		var form = $('#addUserForm');
		if(validateForm()) {
			if($("#isTemp").val() == 1) {
				alert($("#loginName").val() + "该用户已经存在。");
				$("#loginName").focus();
				return false;
			} else if($("#isTemp1").val() == 1) {
				alert($("#employeeId").val() + "该员工ID已经存在。");
				$("#employeeId").focus();
			} else {
				form.submit();
			}
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					['loginName', '用户名不能为空', 'check'],
					['birthday', '出生年月不能为空', 'check'],
					['birthday', '请输入有效的出生年月日期', 'isActiveDate'],
					['name', '名称不能为空', 'check'],
					['employeeId', '员工ID不能为空', 'check'],
					['tel', '电话号码不能为空', 'check'],
					['tel', '电话号码必须为数字', 'isNum']
					//['file', '非图片文件', 'matchPicFileName']
					]
				);
		return flag;
	}
	
	function checkIsExistLoginName() {
		var datas = {'loginName':$("#loginName").val()};
		var value = false;
		$.ajax({
				url: '/user/isExistLoginName.action?temp=' + Math.random(),
				type: 'POST',
				data: datas,
				dataType: 'json',
				async: false,      //ajax同步
				error: function(){
					alert("");
					return false;
				},
				success: function(returnvalue){
					var isExist = returnvalue["isExist"];
					if(isExist == 1) {
						$("#isTemp").val("1");
						alert($("#loginName").val() + "该用户已经存在。");
						$("#loginName").focus();
					} else {
						$("#isTemp").val("0");
					}
				}
		});
	}
	
	function checkIsExistEmployeeId() {
		var datas = {'employeeId':$("#employeeId").val()};
		var value = false;
		$.ajax({
				url: '/user/queryExistEmployeeId.action?temp=' + Math.random(),
				type: 'POST',
				data: datas,
				dataType: 'json',
				async: false,      //ajax同步
				error: function(){
					alert("");
					return false;
				},
				success: function(returnvalue){
					var isExist = returnvalue["success"];
					if(isExist == 1) {
						$("#isTemp1").val("1");
						alert($("#employeeId").val() + "该员工ID已经存在。");
						$("#employeeId").focus();
					} else {
						$("#isTemp1").val("0");
					}
				}
		});
	}
	
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>添加用户信息</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="addUserForm" id="addUserForm" action="addUser.action" enctype="multipart/form-data">
		<input type="hidden" name="id" id="employId" value="<s:property value='id'/>" />
		<input type="hidden" name="code" id="code" value="<s:property value='employ.code'/>" />
		<input type="hidden" name="companyId" value="<s:property value='companyId'/>" />
		<input type="hidden" name="isTemp" id="isTemp" value="0" />
		<input type="hidden" name="isTemp1" id="isTemp1" value="0" />
		
		<div class="modifyItem">
			<label for="user.qq">角色：</label>
			<select name="role" id="role">
				<option value="0">管理员</option>
				<option value="1">操作员</option>
			</select>
		</div>
		<fieldset class="modifySet">
			<legend>用户基本信息</legend>	
			<div class="modifyItem modifyItemFloat">
				<label for="name">用户名：</label><input type="text" name="loginName" id="loginName" onchange="checkIsExistLoginName();"  value="<s:property value='loginName'/>" /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">出生年月：</label><input type="text" name="birthday" id="birthday" value="<s:date name='birthday' format='yyyy-MM-dd'/>" /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >姓名：</label><input type="text" name="name" id="name"  value="<s:property value='name'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >员工ID：</label><input type="text" name="employeeId" id="employeeId"  value="<s:property value='employeeId'/>" onchange="checkIsExistEmployeeId();"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >联系电话：</label><input type="text" name="tel" id="tel"  value="<s:property value='tel'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >职位：</label><input type="text" name="position" id="position" />
			</div>
			<!--<div class="modifyItem">
				<label >图片：</label><input type="file" name="file" id="idFile" size="79" />
			</div>
			<div class="modifyItem">
				<label >预览：</label><IMG id="idImg" style="margin-left:10px;">
			</div>-->
			<div class="clear"></div>
			<div class="modifyItem">
				<label >备注：</label><textarea name="comment"><s:property value="comment" /></textarea>
			</div>
		</fieldset>
		
		<div id="modifyButtonDiv">
			<input class="bt" value="提交" id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="doSubmit();" />
			<input class="bt" value="重置" name="resetButton" style="cursor: pointer;" type="reset" />
		</div>
		</form>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
<script language="javascript" type="text/javascript">
	$("#birthday").mask('9999-99-99');
	$("#dimissionDate").mask('9999-99-99');
	$("#pensionStartDate").mask('9999-99-99');
	$("#pensionEndDate").mask('9999-99-99');
	$("#pensionPickCardDate").mask('9999-99-99');
	$("#pensionSendCardDate").mask('9999-99-99');
	$("#pensionSignDate").mask('9999-99-99');
	
	$("#fundStartDate").mask('9999-99-99');
	$("#fundEndDate").mask('9999-99-99');
	$("#fundPickAccountDate").mask('9999-99-99');
	$("#fundSendAccountDate").mask('9999-99-99');
	$("#fundSignDate").mask('9999-99-99');
</script>
<script>

var ip = new ImagePreview( $$("idFile"), $$("idImg"), {
	maxWidth: 200, maxHeight: 200, action: "viewImg.jsp"
});
ip.img.src = ImagePreview.TRANSPARENT;
ip.file.onchange = function(){ ip.preview(); };

</script>
</html>
