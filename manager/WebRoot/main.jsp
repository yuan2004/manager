<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="role" prefix="r"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head><title>��ɽ����Զ�˲���ǲ���޹�˾��Ϣϵͳ</title>
<meta name="robots" content="noindex, nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/admin/js/listTable.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script type="text/javascript">
	/*$(document).ready(function(){
		var url = "countOverdue.html";
		$.get(url,{}, function(response){
			eval("var ret=" + response);
			$('#contractCount').html(ret.employCount);
			$('#companyCount').html(ret.companyCount);

		}); 
	}); */
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 100px;"><strong>��ӭ����</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<div id="helloWord">
			<h1 style="margin-left:1000px;"><a href="#" style="color:#FF0000;" onclick="showChangePasswordContainer('<s:property value='#session.loginName'/>');">�޸�����</a></h1>
			<h1>�û���Ϣ��</h1>
			
			<p>�û��ʺţ�<s:property value='#session.userInf.loginName'/></p>
			<p>�û���ɫ��<s:if test="#session.userInf.role == 1">����Ա</s:if><s:elseif test="#session.userInf.role == 0">����Ա</s:elseif></p>
			<p>�û����ƣ�<s:property value='#session.userInf.name'/></p>
			<p>Ա��ID��<s:property value='#session.userInf.employeeId'/></p>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
</html>
