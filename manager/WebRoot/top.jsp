<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>����ҳ��</title>
<script language=JavaScript>
function logout(){
	if (confirm("��ȷ��Ҫ�˳����������"))
	top.Logout.logout();
}
</script>
<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
<meta http-equiv="refresh" content="60">
<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
<base target="main">
<link href="/css/frame.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    <td width="61%" height="64"><img src="images/logo.gif" width="510" height="64"></td>
    <td width="39%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="74%" height="38" class="admin_txt"><s:if test="#session.userRole == 0">����Ա</s:if><s:else>����Ա</s:else>��<b><s:property value="#session.loginName" /></b> ����,��л��½ʹ�ã�</td>
        <td width="22%"><a href="#" target="_self" onClick="logout();"><img src="images/out.gif" alt="��ȫ�˳�" width="46" height="20" border="0"></a></td>
        <td width="4%">&nbsp;</td>
      </tr><%--
      <tr>
        <td height="19" colspan="3"><a href="/js/scriptx/smsx.exe">���ش�ӡ�ؼ�</a></td>
        </tr>
    --%></table></td>
  </tr>
</table>
</body>
</html>
