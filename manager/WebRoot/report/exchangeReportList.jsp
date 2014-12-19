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
		$("#reportExchangeForm").attr('action', actionName);
		$("#reportExchangeForm").submit();
	}
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>���ֶһ�ͳ��</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/report/queryExchangeReport.action" name="reportExchangeForm" id="reportExchangeForm">
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
				<div class="modifyItem modifyItemFloat">��Ա���ţ�<input type="text" name="exchange.memberCardId" value="<s:property value='exchange.memberCardId' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">��Ʒ���룺<input type="text" name="exchange.giftId" value="<s:property value='exchange.giftId' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">��Ʒ���ƣ�<input type="text" name="exchange.giftName" value="<s:property value='exchange.giftName' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">�һ��ʺţ�<input type="text" name="exchange.userId" value="<s:property value='exchange.userId' />" size="34" /></div>
				<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;��&nbsp;&nbsp;�֣�<input type="text" name="exchange.startScore" value="<s:property value='exchange.startScore' />" size="13" />--<input type="text" name="exchange.stopScore" value="<s:property value='exchange.stopScore' />" size="13" /></div>
				<div class="modifyItem modifyItemFloat">�һ�ʱ�䣺<input type="text" id="startRecordDate" name="exchange.startRecordDate" value="<s:property value='exchange.startRecordDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopRecordDate" name="exchange.stopRecordDate" value="<s:property value='exchange.stopRecordDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>
				<!--<div class="modifyItem modifyItemFloat">&nbsp;</div>-->
				<input type="button" value=" ��  �� " onclick="doSubmit('/report/queryExchangeReport.action');"/><input type="button" name="down" id="down" value=" ��  �� " onclick="doSubmit('/report/exportExchangeReport.action');" style="margin-left:140px;"/>
			</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >��Ա����</th>
					<th width="10%" >��Ա����</th>
					<th width="20%" >��Ʒ����</th>
					<th width="10%" >��Ʒ����</th>
					<th width="10%" >�һ�����</th>
					<th width="10%" >�һ�����</th>
					<th width="10%" >�һ�ʱ��</th>
					<th width="10%" >����Ա</th>
					<th width="10%" >״̬</th>
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
						<s:property value='giftId'/>
					</td>
					<td>
						<s:property value='giftName'/>
					</td>
					<td>
						<s:property value='score'/>
					</td>
					<td>
						1
					</td>
					<td>
						<s:date name="recordDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:property value='userId'/>
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