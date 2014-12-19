<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>管理中心</title>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/user/userManage.js"></script>
</head>
<frameset rows="64,*"  frameborder="no" border="0" framespacing="0">
	<frame src="top.jsp" noresize="noresize" frameborder="no" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" />
	<frameset cols="150,10,*"  rows="860,*" id="frame-body">
		<frame src="menu.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" />
		<frame id=drag-frame name=drag-frame src="drag.htm" frameBorder=no scrolling=no />
		<frame src="main.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto"  />
	</frameset>
</frameset>
<noframes>
  <body></body>
</noframes>
</html>
