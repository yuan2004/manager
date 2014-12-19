<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<%@ taglib uri="role" prefix="r"%>
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
		$("#showFlag").val(1);
		$("#searchMemberForm").attr('action', actionName);
		$("#searchMemberForm").submit();
	}
	
	function onLoad() {
		if($("#showFlag").val() == 1) {
			$("#send").show();
		} else {
			$("#send").hide();
		}
	}
</script>	
</head>
<body onload="onLoad();">
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>��Ա����</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryMemberSendSms.action" name="searchMemberForm" id="searchMemberForm">
		<input type="hidden" id="showFlag" name="showFlag" value="<s:property value='showFlag'/>" />
		<input type="hidden" id="accept" name="accept" value="1" />
		<h1 id="actionBanner">
		<fieldset class="modifySet">
			<div class="modifyItem modifyItemFloat">����Ա������<input type="text" name="name" value="<s:property value='model.name' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">��Ա�����ţ�<input type="text" name="cardId" value="<s:property value='model.cardId' />" size="34"/></div>		
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;�֣�<input type="text" name="startScore" value="<s:property value='model.startScore' />" size="13" />--<input type="text" name="stopScore" value="<s:property value='model.stopScore' />" size="13" /></div>
			<div class="modifyItem modifyItemFloat">
			&nbsp;&nbsp;��Ա���ͣ�<select name="isNew" style="width:212px;">
				<option value="" <s:if test="model.isNew == ''"> selected="selected"</s:if> >ȫ��</option>
				<option value="N" <s:if test='model.isNew == "N"'> selected="selected"</s:if> >�»�Ա</option>
				<option value="O" <s:if test='model.isNew == "O"'> selected="selected"</s:if> >�ϻ�Ա</option>
			</select></div>	
			<input type="button" name="button" onclick="doSubmit('/member/queryMemberSendSms.action');" value=" �� �� "/><input type="button" name="send" id="send" value="Ⱥ������" onclick="doSubmit('/member/jumptoSendSms.action')" style="margin-left:100px;display:none;"/>
		</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >����</th>
					<th width="10%" >����</th>
					<th width="12%" >���֤</th>
					<th width="8%" >�ֻ�</th>
					<th width="10%" >����</th>
					<th width="5%" >�Ա�</th>
					<th width="8%" >ע������</th>
					<th width="5%" >״̬</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<s:property value='name'/>
					</td>
					<td>
						<s:property value='cardId'/>
					</td>
					<td>
						<s:property value='idNo'/>
					</td>
					<td>
						<s:property value='mobile'/>
					</td>
					<td>
						<s:property value='score'/>
					</td>
					<td>
						<s:if test="sex== 0">��</s:if><s:elseif test="sex ==1">Ů</s:elseif>
					</td>
					<td>
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:if test="status == 1">����</s:if><span style="color:red"><s:elseif test="status == 0">����</s:elseif><s:elseif test="status == 2">δ���</s:elseif></span>
					</td>
				</tr>
				</s:iterator>
			</table>
			<page:pageBar pageObject="page" id="pageBar" />
		</div>
	</div>
</div>
<div id="bottom">
	<div id="bottomLeft">
		<div id="bottomRight"></div>
	</div>
</div>
</body>
<script language="javascript" type="text/javascript">
	$("#startRegDate").mask('9999-99-99');
	$("#stopRegDate").mask('9999-99-99');
</script>
</html>