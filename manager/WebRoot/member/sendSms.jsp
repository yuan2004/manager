<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<%@ taglib uri="role" prefix="r"%>
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
		<h1 style="width: 125px;"><strong>会员管理</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryMemberSendSms.action" name="searchMemberForm" id="searchMemberForm">
		<input type="hidden" id="showFlag" name="showFlag" value="<s:property value='showFlag'/>" />
		<input type="hidden" id="accept" name="accept" value="1" />
		<h1 id="actionBanner">
		<fieldset class="modifySet">
			<div class="modifyItem modifyItemFloat">按会员搜索：<input type="text" name="name" value="<s:property value='model.name' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">会员卡卡号：<input type="text" name="cardId" value="<s:property value='model.cardId' />" size="34"/></div>		
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;积&nbsp;&nbsp;分：<input type="text" name="startScore" value="<s:property value='model.startScore' />" size="13" />--<input type="text" name="stopScore" value="<s:property value='model.stopScore' />" size="13" /></div>
			<div class="modifyItem modifyItemFloat">
			&nbsp;&nbsp;会员类型：<select name="isNew" style="width:212px;">
				<option value="" <s:if test="model.isNew == ''"> selected="selected"</s:if> >全部</option>
				<option value="N" <s:if test='model.isNew == "N"'> selected="selected"</s:if> >新会员</option>
				<option value="O" <s:if test='model.isNew == "O"'> selected="selected"</s:if> >老会员</option>
			</select></div>	
			<input type="button" name="button" onclick="doSubmit('/member/queryMemberSendSms.action');" value=" 搜 索 "/><input type="button" name="send" id="send" value="群发短信" onclick="doSubmit('/member/jumptoSendSms.action')" style="margin-left:100px;display:none;"/>
		</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >姓名</th>
					<th width="10%" >卡号</th>
					<th width="12%" >身份证</th>
					<th width="8%" >手机</th>
					<th width="10%" >积分</th>
					<th width="5%" >性别</th>
					<th width="8%" >注册日期</th>
					<th width="5%" >状态</th>
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
						<s:if test="sex== 0">男</s:if><s:elseif test="sex ==1">女</s:elseif>
					</td>
					<td>
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:if test="status == 1">正常</s:if><span style="color:red"><s:elseif test="status == 0">冻结</s:elseif><s:elseif test="status == 2">未审核</s:elseif></span>
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