<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>会员系统</title>
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
</head>
<body>
	<a href="javascript:PDF1.printWithDialog();" style="font-size: 30px;">打印</a>
	<hr />
	<object classid="clsid:CA8A9780-280D-11CF-A24D-444553540000"
		name="PDF1" width="950" height="633" border="0" >
		<param name="src"  value="<s:property value='pdfName'/>" />
		<param name="SCALE" value="noborder" />
	</object>
	<script language="JavaScript" type="text/javascript" >   
	  //显示工具栏(false为隐藏)        
	 PDF1.SetShowToolbar(true);      
	</script>
</body>

</html>
