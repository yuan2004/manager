<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>��Աϵͳ</title>
<meta name="robots" content="noindex, nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/admin/js/listTable.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script type="text/javascript" src="/js/validateFormUtil.js"></script>
<script type="text/javascript" src="employ.js"></script>
<script type="text/javascript">
	function doSubmit() {
		var form = $('#addScoreLineModify');
		if(validateForm()) {
			form.submit();
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					['newScore','���ֲ���Ϊ��','check'],
					['newScore','���ֱ���Ϊ����','isNum']
					]
				);
		return flag;
	}
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>����¼����Ϣ</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/addScoreLineModify.action" name="addScoreLineModify" id="addScoreLineModify">
		<input type="hidden" name="recordId" id="recordId" value="<s:property value='model.recordId' />" />
		<input type="hidden" name="memberId" id="memberId" value="<s:property value='model.memberId' />" />
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
			<legend>�����޸�</legend>	
			<div class="modifyItem modifyItemFloat">
				<label>�̻���</label><s:property value="model.shopName" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>Ʒ�ƣ�</label><s:property value="model.brand" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>�̺ţ�</label><s:property value="model.locationId" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>��</label><s:property value="model.amount" />
			</div>
			<div class="modifyItem modifyItemFloat">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="flag" value="1" checked="checked" />����<input type="radio" name="flag" value="0" />����
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>���֣�</label><input name="newScore" id="newScore" type="text"><span  style="color:red">*����������</span>
			</div>
			<div class="modifyItem">
				<label>��ע��</label><textarea id="comment" name="comment"></textarea>
			</div>
			
			<div class="modifyItem modifyItemFloat">
				<input class="bt" value=" �� �� " id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="doSubmit();" style="margin-left:300px;" />
			</div>
			<div class="clear"></div>
			</fieldset>
		</h1>
		</form>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
<script language="javascript" type="text/javascript">
	$("#birthday").mask('9999-99-99');
</script>
</html>
