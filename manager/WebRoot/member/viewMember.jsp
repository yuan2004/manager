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
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>���ֻ���</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<fieldset class="modifySet">
			<legend>��Ա������Ϣ</legend>
			<div class="modifyItem modifyItemFloat">
				<label for="name">��Ա���ţ�</label><s:property value='model.cardId'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >������</label><s:property value='model.name'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">�������£�</label><s:date name='model.birthday' format='yyyy-MM-dd'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���֤��</label><s:property value='model.idNo'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�ֻ����룺</label><s:property value='model.mobile'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�̶��绰��</label><s:property value='model.tel'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���֣�</label><s:property value='model.score'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�Ա�</label>
				<s:if test="model.sex == 0">��</s:if><s:elseif test="model.sex == 1">Ů</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���䣺</label>
				<s:if test="model.age == 0">20������</s:if><s:elseif test="model.age == 1">21��29</s:elseif><s:elseif test="model.age == 2">30��39</s:elseif><s:elseif test="model.age == 3">40������</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ����룺</label><s:property value='model.exchangeCode'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ�������</label><s:if test="model.requirement == 0" >������</s:if><s:elseif test="model.requirement == 1">���֤</s:elseif><s:else>�һ�����</s:else>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >ְҵ��</label><s:property value='model.occupation'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >EMail��</label><s:property value='model.email'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���ն����Żݣ�</label><s:if test="model.accept == 1" >����</s:if><s:else>������</s:else>
			</div>
			<div class="modifyItem">
				<label >ͨѶ��ַ��</label><s:property value='model.address'/>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >��ע��</label><s:property value="comment" />
			</div>
		</fieldset>
		<form method="post" action="/member/addScore.action" name="addScore" id="addScore">
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
			<legend>���ֻ���</legend>
			<div class="clear"></div>
			<div class="modifyItem">
				<label>��&nbsp;&nbsp;��&nbsp;&nbsp;�֣�</label><span  style="color:red"><s:property value='model.incomeScore'/></span>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label>�����ܻ��֣�</label><span  style="color:red"><s:property value='model.costScore'/></span>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label>&nbsp;&nbsp;ʣ����֣�</label><span  style="color:red"><s:property value='model.score'/></span>
			</div>
		
			</fieldset>
		</h1>
		</form>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
</html>
