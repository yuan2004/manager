<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="role" prefix="r"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head><title>佛山市智远人才派遣有限公司信息系统</title>
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
<div id="title"><div class="titleRight"><h1 style="width: 100px;"><strong>欢迎界面</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<div id="helloWord">
			<h1 style="margin-left:1000px;"><a href="#" style="color:#FF0000;" onclick="showChangePasswordContainer('<s:property value='#session.loginName'/>');">修改密码</a></h1>
			<h1>用户信息：</h1>
			
			<p>用户帐号：<s:property value='#session.userInf.loginName'/></p>
			<p>用户角色：<s:if test="#session.userInf.role == 1">操作员</s:if><s:elseif test="#session.userInf.role == 0">管理员</s:elseif></p>
			<p>用户名称：<s:property value='#session.userInf.name'/></p>
			<p>员工ID：<s:property value='#session.userInf.employeeId'/></p>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
</html>
