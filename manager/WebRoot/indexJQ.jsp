<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<script type="text/javascript" src="/js/jquery.js"></script>
		<script type="text/javascript" src="/js/jquery.PrintArea.js"></script>
		<script type="text/javascript">
			function print() {
				$("div#myPrintArea").printArea();
			}
			
	</script>
	</head>
	<body>
<div id="biuuu_button"><input type="button" id="button" value="��ӡ" onclick="print();" /></div>
<div id="myPrintArea" style="width:100px; height:20px;">
	<table width="100%">
		<tr><td>ʤ�ѳ����г�</td></tr>
		<tr><td>��������͵꣩</td></tr>
	</table>
</div>
	</body>
<%--	<script type="text/javascript">--%>
<%--		$("div#biuuu_button").click(--%>
<%--			function(){$("div#myPrintArea").printArea();}--%>
<%--		);--%>
<%--	</script>--%>
</html>
