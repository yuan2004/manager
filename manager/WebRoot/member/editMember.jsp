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
		var form = $('#editMemberForm');
		if(validateForm()) {
			form.submit();
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					//['birthday', '�������²���Ϊ��', 'check'],
					//['birthday', '��������Ч�ĳ�����������', 'isActiveDate'],
					['name', '���Ʋ���Ϊ��', 'check'],
					['mobile', '�绰���벻��Ϊ��', 'check'],
					['mobile', '�绰�������Ϊ����', 'isNum']
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
		<form method="post" name="editMemberForm" id="editMemberForm" action="editMember.action">
		<input type="hidden" name="memberId" id="memberId" value="<s:property value='model.memberId'/>" />
		
		<div class="modifyItem">
			<label for="user.qq">��ɫ��</label>
			<s:if test="model.role == 0">����Ա</s:if><s:elseif test="model.role == 1">����Ա</s:elseif>
		</div>
		<fieldset class="modifySet">
			<legend>��Ա������Ϣ</legend>	
			<div class="modifyItem modifyItemFloat">
				<label for="name">��Ա���ţ�</label><s:property value='model.cardId'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���֣�</label><s:property value='model.score'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >������</label><input type="text" name="name" id="name"  value="<s:property value='model.name'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">�������£�</label><input type="text" name="birthday" id="birthday" value="<s:date name='model.birthday' format='yyyy-MM-dd'/>" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���֤��</label><input type="text" name="idNo" id="idNo"  value="<s:property value='model.idNo'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�ֻ����룺</label><input type="text" name="mobile" id="mobile"  value="<s:property value='model.mobile'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�̶��绰��</label><input type="text" name="tel" id="tel"  value="<s:property value='model.tel'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�Ա�</label>
				<select name="sex" id="sex" style="width:130px;">
					<option value="0" <s:if test='model.sex == 0'>selected="selected"</s:if> >��</option>
					<option value="1" <s:if test='model.sex == 1'>selected="selected"</s:if> >Ů</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���䣺</label>
				<select name="age" id="age" style="width:130px;">
					<option value="0" <s:if test='model.age == 0'>selected="selected"</s:if> >20������</option>
					<option value="1" <s:if test='model.age == 1'>selected="selected"</s:if> >21��29</option>
					<option value="2" <s:if test='model.age == 2'>selected="selected"</s:if> >30��39</option>
					<option value="3" <s:if test='model.age == 3'>selected="selected"</s:if> >40������</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ����룺</label><input type="text" name="exchangeCode" id="exchangeCode"  value="<s:property value='model.exchangeCode'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ�������</label><input type="radio" name="requirement" value="0" <s:if test='model.requirement == 0'>checked="checked"</s:if> />������<input type="radio" name="requirement" value="1" <s:if test='model.requirement == 1'>checked="checked"</s:if> />���֤<input type="radio" name="requirement" value="2" <s:if test='model.requirement == 2'>checked="checked"</s:if> />�һ�����
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >ְҵ��</label><input type="text" name="occupation" id="occupation"  value="<s:property value='model.occupation'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >EMail��</label><input type="text" name="email" id="email"  value="<s:property value='model.email'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >ͨѶ��ַ��</label><input type="text" name="address" id="address"  value="<s:property value='model.address'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���ն����Żݣ�</label><input type="radio" name="accept" value="1" <s:if test='model.accept == 1'>checked="checked"</s:if>  />����<input type="radio" name="accept" value="0" <s:if test='model.accept == 0'>checked="checked"</s:if> />������
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
</script>
</html>
