<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>����ҳ��</title>
		<script type="text/javascript" src="/js/jquery.js"></script>
		<script language="JavaScript">
			function printsetup(){ 
				// ��ӡҳ������ 
				$("#WB").execWB(8,1); 
			}
			
			function printpreview(){ 
				// ��ӡҳ��Ԥ�� 
				$("#WB").execWB(7,1); 
			} 
			
			function printit() { 
				if (confirm('ȷ����ӡ��')){ 
					document.getElementById('WB').execWB(6,6);
				}
			} 
		</script>
		<meta http-equiv=Content-Type content=text/html;charset=gb2312>
		<meta http-equiv="refresh" content="60">
		<base target="main">
	</head>
	<body leftmargin="0" topmargin="0">
		<OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WB name=WB width=0 VIEWASTEXT codebase="/js/scriptx/smsx.cab#Version=6,5,439,30"></OBJECT>
		<input class="btnSubmit" id="d1" onclick="javascript:printit();" type="button" value="��ӡ" name="button_print" runat="server">
		<input class="btnSubmit" id="d2" onclick=" javascript:printsetup();" type="button" value="��ӡҳ������" name="button_setup" runat="server">
		<input class="btnSubmit" id="d3" onclick="javascript:printpreview();" type="button" value="��ӡԤ��" name="button_show" runat="server">
		<input class="btnSubmit" id="d4" onclick="javascript:jPrintArea();" type="button" value="��ӡPrint" name="button_show" runat="server">
	</body>
</html>
