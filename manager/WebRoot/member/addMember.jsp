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
<script type="text/javascript">
	function doSubmit() {
		var form = $('#addMemberForm');
		if(validateForm()) {
			if($("#isTemp").val() == 1) {
				alert("会员卡号"+$("#cardId").val()+"已存在。");
				$("#cardId").focus();
				return false;
			} else if($("#isTemp1").val() == 1) {
				alert("身份证号码"+$("#idNo").val()+"已存在。");
				$("#cardId").focus();
				return false;
			} else if($("#isTemp2").val() == 1) {
				alert("手机号码"+$("#mobile").val()+"已存在。");
				$("#mobile").focus();
				return false;
			} else {
				if($("#cardId").val().length != 8) {
					alert("会员卡号为"+$("#cardId").val()+",长度必须为8位");
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
					['cardId', '会员卡号不能为空', 'check'],
					//['birthday', '出生年月不能为空', 'check'],
					//['birthday', '请输入有效的出生年月日期', 'isActiveDate'],
					['name', '名称不能为空', 'check'],
					//['score', '积分不能为空', 'check'],
					//['score', '积分必须为数字', 'isNUm'],
					['mobile', '电话号码不能为空', 'check'],
					['mobile', '电话号码必有为数字', 'isNum']
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
						alert("会员卡号"+$("#cardId").val()+"已存在。");
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
						alert("电话号码"+$("#mobile").val()+"已存在。");
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
						alert("身份证号码"+$("#idNo").val()+"已存在。");
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
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>添加会员信息</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="addMemberForm" id="addMemberForm" action="addMember.action">
		<input type="hidden" name="isTemp" id="isTemp" value="0" />
		<input type="hidden" name="isTemp1" id="isTemp" value="0" />
		<input type="hidden" name="isTemp2" id="isTemp" value="0" />
		<div class="modifyItem">
			
		</div>
		<fieldset class="modifySet">
			<legend>会员基本信息</legend>	
			<div class="modifyItem modifyItemFloat">
				<label for="name">会员卡号：</label><input type="text" name="cardId" id="cardId" onchange="checkIsExistCard();" value="<s:property value='model.cardId'/>" /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >姓名：</label><input type="text" name="name" id="name"  value="<s:property value='model.name'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">出生年月：</label><input type="text" name="birthday" id="birthday" value="<s:date name='model.birthday' format='yyyy-MM-dd'/>" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >身份证：</label><input type="text" name="idNo" id="idNo"" onchange="checkIsExistIdNo();"  value="<s:property value='model.idNo'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >手机号码：</label><input type="text" name="mobile" id="mobile"" onchange="checkIsExistMobile();"  value="<s:property value='model.mobile'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >固定电话：</label><input type="text" name="tel" id="tel"  value="<s:property value='model.tel'/>"  />
			</div>
			<!--<div class="modifyItem modifyItemFloat">
				<label >积分：</label><input type="text" name="score" id="score"  value="<s:property value='model.score'/>"  /><span  style="color:red">*</span>
			</div>-->
			<div class="modifyItem modifyItemFloat">
				<label >性别：</label>
				<select name="sex" id="sex" style="width:130px;">
					<option value="0">男</option>
					<option value="1">女</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >年龄：</label>
				<select name="age" id="age" style="width:130px;">
					<option value="0">20岁以下</option>
					<option value="1">21～29</option>
					<option value="2">30～39</option>
					<option value="3">40岁以上</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换密码：</label><input type="text" name="exchangeCode" id="exchangeCode"  value="<s:property value='model.exchangeCode'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换条件：</label><input type="radio" name="requirement" value="0" checked="checked" />无条件<input type="radio" name="requirement" value="1"  />身份证<input type="radio" name="requirement" value="2"  />兑换密码
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >职业：</label><input type="text" name="occupation" id="occupation"  value="<s:property value='model.occupation'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >EMail：</label><input type="text" name="email" id="email"  value="<s:property value='model.email'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >通讯地址：</label><input type="text" name="address" id="address"  value="<s:property value='model.address'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >接收短信优惠：</label><input type="radio" name="accept" value="1" checked="checked"  />接受<input type="radio" name="accept" value="0"  />不接受
			</div>
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
</script>
</html>
