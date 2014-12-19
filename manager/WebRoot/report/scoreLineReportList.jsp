<%@ page language="java" contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>��Աϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script language="JavaScript">
	function doSubmit(actionName) {
		$("#reportScoreLineForm").attr('action', actionName);
		$("#reportScoreLineForm").submit();
	}
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>����¼��ͳ��</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/report/queryScoreLineReport.action" name="reportScoreLineForm" id="reportScoreLineForm">
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
				<div class="modifyItem modifyItemFloat">��Ա���ţ�<input type="text" name="scoreLine.memberCardId" value="<s:property value='scoreLine.memberCardId' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">��Ա������<input type="text" name="scoreLine.memberName" value="<s:property value='scoreLine.memberName' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">�ֻ����룺<input type="text" name="scoreLine.memberTel" value="<s:property value='scoreLine.memberTel' />" size="34" /></div>
				<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;��&nbsp;&nbsp;�֣�<input type="text" name="scoreLine.startScore" value="<s:property value='scoreLine.startScore' />" size="13" />--<input type="text" name="scoreLine.stopScore" value="<s:property value='scoreLine.stopScore' />" size="13" /></div>
				<div class="modifyItem modifyItemFloat">¼���û���<input type="text" name="scoreLine.userId" value="<s:property value='scoreLine.userId' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">���ֽ�<input type="text" name="scoreLine.startAmount" value="<s:property value='scoreLine.startAmount' />" size="13" />--<input type="text" name="scoreLine.stopAmount" value="<s:property value='scoreLine.stopAmount' />" size="13" /></div>
				<div class="modifyItem modifyItemFloat">¼��ʱ�䣺<input type="text" id="startRecordDate" name="scoreLine.startRecordDate" value="<s:property value='scoreLine.startRecordDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopRecordDate" name="scoreLine.stopRecordDate" value="<s:property value='scoreLine.stopRecordDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>
				<div class="modifyItem modifyItemFloat">��&nbsp;��&nbsp;Ա��<select name="scoreLine.isNew" style="width:212px;"><option value="" <s:if test="scoreLine.isNew == null"> selected="selected" </s:if> >ȫ��</option><option value="N" <s:if test='scoreLine.isNew == "N"'> selected="selected" </s:if> >��</option><option value="O" <s:if test='member.isNew == "O"'> selected="selected" </s:if> >��</option></select></div>
				<input type="button" name="search" id="search" onclick="doSubmit('/report/queryScoreLineReport.action');" value=" ��  �� "/><input type="button" name="down" id="down" value=" ��  �� " onclick="doSubmit('/report/exportScoreLineReport.action');" style="margin-left:140px;"/>
			</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="20%" >��Ա����</th>
					<th width="10%" >��Ա����</th>
					<th width="10%" >�̻�����</th>
					<th width="10%" >�̻�Ʒ��</th>
					<th width="10%" >�̻��̺�</th>
					<th width="7%" >���ѽ��</th>
					<th width="7%" >¼�����</th>
					<th width="10%" >¼���û�</th>
					<th width="10%" >¼��ʱ��</th>
					<th width="6%" >״̬</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<s:property value='memberCardId'/>
					</td>
					<td>
						<s:property value='memberName'/>
					</td>
					<td>
						<s:property value='shopName'/>
					</td>
					<td>
						<s:property value='brand'/>
					</td>
					<td>
						<s:property value='locationNo'/>
					</td>
					<td>
						<s:property value='amount'/>
					</td>
					<td>
						<s:property value='score'/>
					</td>
					<td>
						<s:property value='userId'/>
					</td>
					<td>
						<s:date name="recordDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:if test="status == 1">����</s:if><s:else>����</s:else>
					</td>
				</tr>
				</s:iterator>
			</table>
			<page:pageBar pageObject="page" id="pageBar" />
		</div>
		<s:if test="showFlag == 1">
		<h1 id="actionBanner2">		
			<fieldset class="modifySet">
			<legend>���ֻ���</legend>
			<div class="modifyItem">
				��&nbsp;&nbsp;��&nbsp;&nbsp;�֣�<span  style="color:red"><s:property value='incomeScore'/></span>&nbsp;&nbsp;&nbsp;&nbsp;�����ܻ��֣�<span  style="color:red"><s:property value='costScore'/></span>&nbsp;&nbsp;&nbsp;&nbsp;ʣ����֣�<span  style="color:red"><s:property value='balanceScore'/></span>
			</div>
			</fieldset>
		</h1>
		</s:if>
	</div>
</div>
<div id="bottom">
	<div id="bottomLeft">
		<div id="bottomRight"></div>
	</div>
</div>
</body>
<script language="javascript" type="text/javascript">
	$("#startRecordDate").mask('9999-99-99');
	$("#stopRecordDate").mask('9999-99-99');
</script>
</html>