<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>123</title>
		<script type="text/javascript" src="/js/jquery.js"></script>
		<script type="text/javascript" src="/js/jquery.PrintArea.js"></script>
	</head>
	<body>
		<a href="javascript:PDF1.printWithDialog();">打印</a>
		<hr>
		<object classid="clsid:CA8A9780-280D-11CF-A24D-444553540000"
			name="PDF1" width="950" height="633" border="0" >
			<param name="src" value="a.pdf" />
		</object>
		<script language="JavaScript" type="text/javascript" >   
		  //显示工具栏(false为隐藏)        
		 // PDF1.SetShowToolbar(true);      
		</script>
	</body>

</html>
