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
		<h1 style="width: 125px;"><strong>积分修改统计</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/report/queryScoreModifyReport.action" name="reportScoreLineForm" id="reportScoreLineForm">
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
				<div class="modifyItem modifyItemFloat">会员卡号：<input type="text" name="scoreModify.memberCardId" value="<s:property value='scoreModify.memberCardId' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">会员姓名：<input type="text" name="scoreModify.memberName" value="<s:property value='scoreModify.memberName' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">手机号码：<input type="text" name="scoreModify.memberTel" value="<s:property value='scoreModify.memberTel' />" size="34" /></div>
				<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;积&nbsp;&nbsp;分：<input type="text" name="scoreModify.startScore" value="<s:property value='scoreModify.startScore' />" size="13" />--<input type="text" name="scoreModify.stopScore" value="<s:property value='scoreModify.stopScore' />" size="13" /></div>
				<div class="modifyItem modifyItemFloat">修改用户：<input type="text" name="scoreModify.userId" value="<s:property value='scoreModify.userId' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">积分金额：<input type="text" name="scoreModify.startAmount" value="<s:property value='scoreModify.startAmount' />" size="13" />--<input type="text" name="scoreModify.stopAmount" value="<s:property value='scoreModify.stopAmount' />" size="13" /></div>
				<div class="modifyItem modifyItemFloat">修改时间：<input type="text" id="startModifyDate" name="scoreModify.startModifyDate" value="<s:property value='scoreModify.startModifyDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopModifyDate" name="scoreModify.stopModifyDate" value="<s:property value='scoreModify.stopModifyDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>
				<div class="modifyItem modifyItemFloat">&nbsp;</div>
				
				<input type="button" name="search" id="search" onclick="doSubmit('/report/queryScoreModifyReport.action');" value=" 搜  索 "/>
				<input type="button" name="down" id="down" value=" 下  载 " onclick="doSubmit('/report/exportScoreModifyReport.action');" style="margin-left:150px;"/>
			</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="20%" >会员卡号</th>
					<th width="10%" >会员名称</th>
					<th width="10%" >商户名称</th>
					<th width="10%" >商户品牌</th>
					<th width="10%" >商户铺号</th>
					<th width="7%" >消费金额</th>
					<th width="7%" >修改积分</th>
					<th width="10%" >修改用户</th>
					<th width="10%" >修改时间</th>
					<th width="6%" >状态</th>
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
						<s:date name="modifyDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:if test="status == 1">正常</s:if><s:else>作废</s:else>
					</td>
				</tr>
				</s:iterator>
			</table>
			<page:pageBar pageObject="page" id="pageBar" />
		</div>
		<s:if test="showFlag == 1">
		<h1 id="actionBanner2">		
			<fieldset class="modifySet">
			<legend>积分汇总</legend>
			<div class="modifyItem">
				修改总积分：<span  style="color:red"><s:property value='incomeScore'/></span>
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
	$("#startModifyDate").mask('9999-99-99');
	$("#stopModifyDate").mask('9999-99-99');
</script>
</html>