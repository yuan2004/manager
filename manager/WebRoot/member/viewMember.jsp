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
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>积分汇总</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<fieldset class="modifySet">
			<legend>会员基本信息</legend>
			<div class="modifyItem modifyItemFloat">
				<label for="name">会员卡号：</label><s:property value='model.cardId'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >姓名：</label><s:property value='model.name'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">出生年月：</label><s:date name='model.birthday' format='yyyy-MM-dd'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >身份证：</label><s:property value='model.idNo'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >手机号码：</label><s:property value='model.mobile'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >固定电话：</label><s:property value='model.tel'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >积分：</label><s:property value='model.score'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >性别：</label>
				<s:if test="model.sex == 0">男</s:if><s:elseif test="model.sex == 1">女</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >年龄：</label>
				<s:if test="model.age == 0">20岁以下</s:if><s:elseif test="model.age == 1">21～29</s:elseif><s:elseif test="model.age == 2">30～39</s:elseif><s:elseif test="model.age == 3">40岁以上</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换密码：</label><s:property value='model.exchangeCode'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换条件：</label><s:if test="model.requirement == 0" >无条件</s:if><s:elseif test="model.requirement == 1">身份证</s:elseif><s:else>兑换密码</s:else>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >职业：</label><s:property value='model.occupation'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >EMail：</label><s:property value='model.email'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >接收短信优惠：</label><s:if test="model.accept == 1" >接受</s:if><s:else>不接受</s:else>
			</div>
			<div class="modifyItem">
				<label >通讯地址：</label><s:property value='model.address'/>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >备注：</label><s:property value="comment" />
			</div>
		</fieldset>
		<form method="post" action="/member/addScore.action" name="addScore" id="addScore">
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
			<legend>积分汇总</legend>
			<div class="clear"></div>
			<div class="modifyItem">
				<label>总&nbsp;&nbsp;积&nbsp;&nbsp;分：</label><span  style="color:red"><s:property value='model.incomeScore'/></span>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label>消费总积分：</label><span  style="color:red"><s:property value='model.costScore'/></span>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label>&nbsp;&nbsp;剩余积分：</label><span  style="color:red"><s:property value='model.score'/></span>
			</div>
		
			</fieldset>
		</h1>
		</form>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
</html>
