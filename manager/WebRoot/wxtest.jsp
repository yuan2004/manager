<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>管理页面</title>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script language="JavaScript">
	
	function dox() {
		var datas = {'cardNo':123456781,'startTime':'2012-01-01','endTime':'2013-09-09','pageNum':2,'pageSize':2};    
	$.ajax({
		url: "/wx/GetPointDetails.action",
		type: 'POST',
		data:datas,
		dataType: 'json',
		error: function() {
			alert("error");
		},
		success: function(returnValue) {
			alert(returnValue);
			try {
				var strRec = typeof(returnValue["resCodeValue"]) == "undefined" ? "" : returnValue["resCodeValue"];
			} catch (err) {
				alert("ajax的返回值为空或出现异常");
				error();
			}
		}  
	});
	}
</script>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
<meta http-equiv="refresh" content="60">
<base target="main">
</head>
<body leftmargin="0" topmargin="0">
<input type="button" name="button" value="write" onclick="dox()">
</body>
</html>
