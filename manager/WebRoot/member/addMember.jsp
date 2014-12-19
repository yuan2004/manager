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
		var form = $('#addMemberForm');
		if(validateForm()) {
			if($("#isTemp").val() == 1) {
				alert("��Ա����"+$("#cardId").val()+"�Ѵ��ڡ�");
				$("#cardId").focus();
				return false;
			} else if($("#isTemp1").val() == 1) {
				alert("���֤����"+$("#idNo").val()+"�Ѵ��ڡ�");
				$("#cardId").focus();
				return false;
			} else if($("#isTemp2").val() == 1) {
				alert("�ֻ�����"+$("#mobile").val()+"�Ѵ��ڡ�");
				$("#mobile").focus();
				return false;
			} else {
				if($("#cardId").val().length != 8) {
					alert("��Ա����Ϊ"+$("#cardId").val()+",���ȱ���Ϊ8λ");
					$("#cardId").focus();
					return false;
				}
				form.submit();
			}
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					['cardId', '��Ա���Ų���Ϊ��', 'check'],
					//['birthday', '�������²���Ϊ��', 'check'],
					//['birthday', '��������Ч�ĳ�����������', 'isActiveDate'],
					['name', '���Ʋ���Ϊ��', 'check'],
					//['score', '���ֲ���Ϊ��', 'check'],
					//['score', '���ֱ���Ϊ����', 'isNUm'],
					['mobile', '�绰���벻��Ϊ��', 'check'],
					['mobile', '�绰�������Ϊ����', 'isNum']
					]
				);
		return flag;
	}
	
	function checkIsExistCard() {
		var datas = {'cardId':$("#cardId").val()};
		$.ajax({
				url: '/member/isExist.action',
				type: 'POST',
				data: datas,
				dataType: 'json',
				error: function(){
					alert("");
				},
				success: function(returnvalue){
					var isExist = returnvalue["isExist"];
					if(isExist == 1) {
						$("#isTemp").val("1");
						alert("��Ա����"+$("#cardId").val()+"�Ѵ��ڡ�");
						$("#cardId").focus();
					} else {
						$("#isTemp").val("0");
					}
				}
		});
	}
	
	function checkIsExistMobile() {
		var datas = {'mobile':$("#mobile").val(),'flag':'2'};
		$.ajax({
				url: '/member/isExist.action',
				type: 'POST',
				data: datas,
				dataType: 'json',
				error: function(){
					alert("");
				},
				success: function(returnvalue){
					var isExist = returnvalue["isExist"];
					if(isExist == 1) {
						$("#isTemp1").val("1");
						alert("�绰����"+$("#mobile").val()+"�Ѵ��ڡ�");
						$("#mobile").focus();
					} else {
						$("#isTemp1").val("0");
					}
				}
		});
	}
	
	function checkIsExistIdNo() {
		var datas = {'idNo':$("#idNo").val(),'flag':'1'};
		$.ajax({
				url: '/member/isExist.action',
				type: 'POST',
				data: datas,
				dataType: 'json',
				error: function(){
					alert("");
				},
				success: function(returnvalue){
					var isExist = returnvalue["isExist"];
					if(isExist == 1) {
						$("#isTemp2").val("1");
						alert("���֤����"+$("#idNo").val()+"�Ѵ��ڡ�");
						$("#idNo").focus();
					} else {
						$("#isTemp2").val("0");
					}
				}
		});
	}
	
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>��ӻ�Ա��Ϣ</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="addMemberForm" id="addMemberForm" action="addMember.action">
		<input type="hidden" name="isTemp" id="isTemp" value="0" />
		<input type="hidden" name="isTemp1" id="isTemp" value="0" />
		<input type="hidden" name="isTemp2" id="isTemp" value="0" />
		<div class="modifyItem">
			
		</div>
		<fieldset class="modifySet">
			<legend>��Ա������Ϣ</legend>	
			<div class="modifyItem modifyItemFloat">
				<label for="name">��Ա���ţ�</label><input type="text" name="cardId" id="cardId" onchange="checkIsExistCard();" value="<s:property value='model.cardId'/>" /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >������</label><input type="text" name="name" id="name"  value="<s:property value='model.name'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">�������£�</label><input type="text" name="birthday" id="birthday" value="<s:date name='model.birthday' format='yyyy-MM-dd'/>" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���֤��</label><input type="text" name="idNo" id="idNo"" onchange="checkIsExistIdNo();"  value="<s:property value='model.idNo'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�ֻ����룺</label><input type="text" name="mobile" id="mobile"" onchange="checkIsExistMobile();"  value="<s:property value='model.mobile'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�̶��绰��</label><input type="text" name="tel" id="tel"  value="<s:property value='model.tel'/>"  />
			</div>
			<!--<div class="modifyItem modifyItemFloat">
				<label >���֣�</label><input type="text" name="score" id="score"  value="<s:property value='model.score'/>"  /><span  style="color:red">*</span>
			</div>-->
			<div class="modifyItem modifyItemFloat">
				<label >�Ա�</label>
				<select name="sex" id="sex" style="width:130px;">
					<option value="0">��</option>
					<option value="1">Ů</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���䣺</label>
				<select name="age" id="age" style="width:130px;">
					<option value="0">20������</option>
					<option value="1">21��29</option>
					<option value="2">30��39</option>
					<option value="3">40������</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ����룺</label><input type="text" name="exchangeCode" id="exchangeCode"  value="<s:property value='model.exchangeCode'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ�������</label><input type="radio" name="requirement" value="0" checked="checked" />������<input type="radio" name="requirement" value="1"  />���֤<input type="radio" name="requirement" value="2"  />�һ�����
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
				<label >���ն����Żݣ�</label><input type="radio" name="accept" value="1" checked="checked"  />����<input type="radio" name="accept" value="0"  />������
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >��ע��</label><textarea name="comment"><s:property value="comment" /></textarea>
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
