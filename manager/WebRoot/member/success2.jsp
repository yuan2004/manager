<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>会员系统</title>
<meta http-equiv="Refresh" content="5;URL=/member/queryMemberByModel.action"/>
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script language="JavaScript">
	function doSubmit(actionName) {
		$("#managerMemberForm").attr('action', actionName);
		$("#managerMemberForm").submit();
	}
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<!--<h1 style="width: 125px;"><strong></strong></h1>-->
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="managerMemberForm" id="managerMemberForm">
		<h1 id="actionBanner">		
			<span class="action-span">
				成功，5秒后自动跳转到会员查询界面。
			</span>
			<div class="clear"></div>
		</h1>
		</form>
	</div>
</div>
<div id="bottom">
	<div id="bottomLeft">
		<div id="bottomRight"></div>
	</div>
</div>
</body>
</html>