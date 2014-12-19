<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>会员系统</title>
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
		<h1 style="width: 125px;"><strong>群发短信</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="managerMemberForm" id="managerMemberForm" action="/member/sendSms.action">
		<input type="hidden" name="name" value="<s:property value='name' />" />
		<input type="hidden" name="cardId" value="<s:property value='model.cardId' />" />
		<input type="hidden" name="startScore" value="<s:property value='model.startScore' />" />
		<input type="hidden" name="stopScore" value="<s:property value='model.stopScore' />" />
		<input type="hidden" name="isNew" value="<s:property value='model.isNew' />" />
		<h1 id="actionBanner">
		<fieldset class="modifySet">
			<div class="modifyItem">
				<label style="margin-top:20px;">短信内容：</label><textarea name="sms"></textarea>
			</div>
			<input type="submit" name="send" id="send" value=" 发  送 " style="margin-left:300px;margin-top:30px;"/>
		</fieldset>
		</h1>
		<div class="clear"></div>
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