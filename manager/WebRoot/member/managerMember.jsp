<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>��Աϵͳ</title>
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
		<h1 style="width: 125px;"><strong>��ʧ����</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="managerMemberForm" id="managerMemberForm">
		<div class="modifyItem modifyItemFloat">
			<label >������</label><input type="text" name="name" value="<s:property value='name' />"/>
		</div>
		<div class="modifyItem modifyItemFloat">
			<label >�绰��</label><input type="text" name="mobile" value="<s:property value='mobile' />"/>
		</div>
		<div class="modifyItem modifyItemFloat">
			<label >���֤��</label><input type="text" name="idNo" value="<s:property value='idNo' />"/>
		</div>
		<div class="clear"></div>
		<div class="modifyItem">
			<label >��ע��</label><textarea name="comment" cols="135" rows="10"><s:property value="model.comment" /></textarea>
		</div>
		<div class="clear"></div>
		<div id="modifyButtonDiv">
			<input type="submit" value="��ʧ" onclick="doSubmit('/member/abateMember.action');" />
			<input type="submit" value="�ⶳ" onclick="doSubmit('/member/thawMember.action');" />
		</div>
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