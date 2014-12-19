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
		$("#searchMemberForm").attr('action', actionName);
		$("#searchMemberForm").submit();
	}

</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>СƱ����</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryTicketList.action" name="searchMemberForm" id="searchMemberForm">
		<input type="hidden" id="showFlag" name="showFlag" value="<s:property value='showFlag'/>" />
		<h1 id="actionBanner">
		<fieldset class="modifySet">
			<div class="modifyItem modifyItemFloat">��Ա�����ţ�<input type="text" name="ticketRecord.cardId" value="<s:property value='ticketRecord.cardId' />" size="34"/></div>
			
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;�Ǽ�ʱ�䣺<input type="text" id="startRegDate" name="ticketRecord.startRegDate" value="<s:property value='ticketRecord.startRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopRegDate" name="ticketRecord.stopRegDate" value="<s:property value='ticketRecord.stopRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>

		<input type="submit" value=" �� �� "/>
		</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >����</th>
					<th width="10%" >��Ʒ����</th>
					<th width="10%" >����</th>
					<th width="10%" >�һ�����</th>
					<th width="10%" >ʣ�����</th>
					<th width="10%" >����Ա</th>
					<th width="10%" >��ӡ����</th>
					<th width="20%" >����</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<s:property value='cardId'/>
					</td>
					<td>
						<s:property value='giftName'/>
					</td>
					<td>
						<s:property value='count'/>
					</td>
					<td>
						<s:property value='score'/>
					</td>
					<td>
						<s:property value='balanceScore'/>
					</td>
					<td>
						<s:property value='userId'/>
					</td>
					<td>
						<s:date name="printDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<ul>
							<li  onclick="doSubmit('/member/printTicket.action?id=<s:property value='recordId'/>');">����</li>
						</ul>
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