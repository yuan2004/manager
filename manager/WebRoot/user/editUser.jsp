<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>��Աϵͳ</title>
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
<script type="text/javascript">
	function doSubmit() {
		var form = $('#editUserForm');
		if(validateForm()) {
			form.submit();
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					['birthday', '�������²���Ϊ��', 'check'],
					['birthday', '��������Ч�ĳ�����������', 'isActiveDate'],
					['name', '���Ʋ���Ϊ��', 'check'],
					['employeeId', 'Ա��ID����Ϊ��', 'check'],
					['tel', '�绰���벻��Ϊ��', 'check'],
					['tel', '�绰�������Ϊ����', 'isNum']
					]
				);
		return flag;
	}
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>����û���Ϣ</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="editUserForm" id="editUserForm" action="editUser.action">
		<input type="hidden" name="loginName" id="loginName" value="<s:property value='model.loginName'/>" />
		
		<div class="modifyItem">
			<label for="user.qq">��ɫ��<span  style="color:red"><s:if test="model.role == 0">����Ա</s:if><s:elseif test="model.role == 1">����Ա</s:elseif></span></label>
		</div>
		<fieldset class="modifySet">
			<legend>�û�������Ϣ</legend>	
			<div class="modifyItem modifyItemFloat">
				<label for="name">�û�����</label><s:property value='model.loginName'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">�������£�</label><input type="text" name="birthday" id="birthday" value="<s:date name='model.birthday' format='yyyy-MM-dd'/>" /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.userInfo.mail">�Ա�</label>
				<select name="sex" id="sex">
					<option value="1" selected="selected" >��</option>
					<option value="2" >Ů</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >������</label><input type="text" name="name" id="name"  value="<s:property value='model.name'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >Ա��ID��</label><input type="text" name="employeeId" id="employeeId"  value="<s:property value='model.employeeId'/>" onblur="checkIdentityId();"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >��ϵ�绰��</label><input type="text" name="tel" id="tel"  value="<s:property value='model.tel'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >ְλ��</label><input type="text" name="position" id="position" value="<s:property value='model.position' />" />
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >��ע��</label><textarea name="comment"><s:property value="model.comment" /></textarea>
			</div>
		</fieldset>
		
		<div id="modifyButtonDiv">
			<input class="bt" value="�ύ" id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="doSubmit();" />
			<input class="bt" value="����" name="resetButton" style="cursor: pointer;" type="reset" />
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
</html>
