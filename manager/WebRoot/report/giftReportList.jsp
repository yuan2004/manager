<%@ page language="java" contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>会员系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script type="text/javascript" src="/js/validateFormUtil.js"></script>
<script language="JavaScript">
	function doSubmit(actionName) {
		$("#reportGiftForm").attr('action', actionName);
		if(vaild()) {
			$("#reportGiftForm").submit();
		}
	}
	
	function vaild() {
		var flag = auto_check_form
				(
					[
					['startReserve', '开始库存必须为数字', 'isNum'],
					['stopReserve', '结束库存必须为数字', 'isNum']
					]
				);
		return flag;
	}
	
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>礼品统计</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/report/queryGiftReport.action" name="reportGiftForm" id="reportGiftForm">
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
				<div class="modifyItem modifyItemFloat">礼品编码：<input type="text" name="gift.giftId" value="<s:property value='gift.giftId' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">礼品名称：<input type="text" name="gift.giftName" value="<s:property value='gift.giftName' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;库&nbsp;&nbsp;存：<input type="text" id="startReserve" name="gift.startReserve" value="<s:property value='gift.startReserve' />" size="13" />--<input type="text" id="stopReserve" name="gift.stopReserve" value="<s:property value='gift.stopReserve' />" size="13" /></div>
				<div class="modifyItem modifyItemFloat">兑换积分：<input type="text" name="gift.startScore" id="stopScore" value="<s:property value='gift.stopScore' />" size="13" />--<input type="text" name="gift.stopScore" value="<s:property value='gift.stopScore' />" size="13" /></div>
				<div class="modifyItem modifyItemFloat">入库时间：<input type="text" id="startRegDate" name="gift.startRegDate" value="<s:property value='gift.startRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopRegDate" name="gift.stopRegDate" value="<s:property value='gift.stopRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>
				<div class="modifyItem modifyItemFloat">修改时间：<input type="text" id="startModifyDate" name="gift.startModifyDate" value="<s:property value='gift.startModifyDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopModifyDate" name="gift.stopModifyDate" value="<s:property value='gift.stopModifyDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>
				
				<input type="button" name="search" id="search" onclick="doSubmit('/report/queryGiftReport.action');" value=" 搜  索 "/>
				<input type="button" name="down" id="down" value=" 下  载 " onclick="doSubmit('/report/exportGiftReport.action');" style="margin-left:150px;"/>
			</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="20%" >条形码</th>
					<th width="10%" >礼品名称</th>
					<th width="10%" >库存</th>
					<th width="10%" >兑换积分</th>
					<th width="10%" >录入时间</th>
					<th width="10%" >录入用户</th>
					<th width="10%" >修改时间</th>
					<th width="10%" >修改用户</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<s:property value='giftId'/>
					</td>
					<td>
						<s:property value='giftName'/>
					</td>
					<td>
						<s:property value='reserve'/>
					</td>
					<td>
						<s:property value='score'/>
					</td>
					<td>
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:property value='registerUser'/>
					</td>
					<td>
						<s:date name="moidfyDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:property value='modifyUser'/>
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
	$("#startModifyDate").mask('9999-99-99');
	$("#stopModifyDate").mask('9999-99-99');
</script>
</html>