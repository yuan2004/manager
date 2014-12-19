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
		var form = $('#editMemberForm');
		if(validateForm()) {
			form.submit();
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					//['birthday', '出生年月不能为空', 'check'],
					//['birthday', '请输入有效的出生年月日期', 'isActiveDate'],
					['name', '名称不能为空', 'check'],
					['mobile', '电话号码不能为空', 'check'],
					['mobile', '电话号码必有为数字', 'isNum']
					]
				);
		return flag;
	}
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>添加用户信息</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="editMemberForm" id="editMemberForm" action="editMember.action">
		<input type="hidden" name="memberId" id="memberId" value="<s:property value='model.memberId'/>" />
		
		<div class="modifyItem">
			<label for="user.qq">角色：</label>
			<s:if test="model.role == 0">管理员</s:if><s:elseif test="model.role == 1">操作员</s:elseif>
		</div>
		<fieldset class="modifySet">
			<legend>会员基本信息</legend>	
			<div class="modifyItem modifyItemFloat">
				<label for="name">会员卡号：</label><s:property value='model.cardId'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >积分：</label><s:property value='model.score'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >姓名：</label><input type="text" name="name" id="name"  value="<s:property value='model.name'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">出生年月：</label><input type="text" name="birthday" id="birthday" value="<s:date name='model.birthday' format='yyyy-MM-dd'/>" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >身份证：</label><input type="text" name="idNo" id="idNo"  value="<s:property value='model.idNo'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >手机号码：</label><input type="text" name="mobile" id="mobile"  value="<s:property value='model.mobile'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >固定电话：</label><input type="text" name="tel" id="tel"  value="<s:property value='model.tel'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >性别：</label>
				<select name="sex" id="sex" style="width:130px;">
					<option value="0" <s:if test='model.sex == 0'>selected="selected"</s:if> >男</option>
					<option value="1" <s:if test='model.sex == 1'>selected="selected"</s:if> >女</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >年龄：</label>
				<select name="age" id="age" style="width:130px;">
					<option value="0" <s:if test='model.age == 0'>selected="selected"</s:if> >20岁以下</option>
					<option value="1" <s:if test='model.age == 1'>selected="selected"</s:if> >21～29</option>
					<option value="2" <s:if test='model.age == 2'>selected="selected"</s:if> >30～39</option>
					<option value="3" <s:if test='model.age == 3'>selected="selected"</s:if> >40岁以上</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换密码：</label><input type="text" name="exchangeCode" id="exchangeCode"  value="<s:property value='model.exchangeCode'/>"  />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换条件：</label><input type="radio" name="requirement" value="0" <s:if test='model.requirement == 0'>checked="checked"</s:if> />无条件<input type="radio" name="requirement" value="1" <s:if test='model.requirement == 1'>checked="checked"</s:if> />身份证<input type="radio" name="requirement" value="2" <s:if test='model.requirement == 2'>checked="checked"</s:if> />兑换密码
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
				<label >接收短信优惠：</label><input type="radio" name="accept" value="1" <s:if test='model.accept == 1'>checked="checked"</s:if>  />接受<input type="radio" name="accept" value="0" <s:if test='model.accept == 0'>checked="checked"</s:if> />不接受
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >备注：</label><textarea name="comment"><s:property value="model.comment" /></textarea>
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
