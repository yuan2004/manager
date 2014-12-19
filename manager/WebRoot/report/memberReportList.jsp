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
		$("#reportMemberForm").attr('action', actionName);
		$("#reportMemberForm").submit();
	}
	
	function showOrHide() {
		$("#showOrHide").toggle();
		if($("#more").text().indexOf(">>") != -1) {
			$("#more").text("<<收起");
			$("#showFlag").val(1);
		} else {
			$("#more").text("展开>>");
			$("#showFlag").val(0);
		}
	}
	
	function onLoad() {
		if($("#showFlag").val() == 1) {
			$("#showOrHide").show();
			$("#more").text("<<收起");
		} else {
			$("#showOrHide").hidden();
			$("#more").text("展开>>");
		}
	}
</script>	
</head>
<body onload="onLoad();">
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>会员统计</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/report/queryMemberReport.action" name="reportMemberForm" id="reportMemberForm">
		<input type="hidden" id="showFlag" name="showFlag" value="<s:property value='showFlag'/>" />
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;会员名称：<input type="text" name="member.name" value="<s:property value='member.name' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;会员卡号：<input type="text" name="member.cardId" value="<s:property value='member.cardId' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">手&nbsp;&nbsp;机&nbsp;&nbsp;号：<input type="text" name="member.mobile" value="<s:property value='member.mobile' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;固定电话：<input type="text" name="member.tel" value="<s:property value='member.tel' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">新&nbsp;&nbsp;会&nbsp;&nbsp;员：<select name="member.isNew" style="width:212px;"><option value="" <s:if test="member.isNew == null"> selected="selected" </s:if> >全部</option><option value="N" <s:if test='member.isNew == "N"'> selected="selected" </s:if> >是</option><option value="O" <s:if test='member.isNew == "O"'> selected="selected" </s:if> >否</option></select></div>
			<div class="modifyItem modifyItemFloat">身&nbsp;&nbsp;份&nbsp;&nbsp;证：<input type="text" name="member.idNo" value="<s:property value='member.idNo' />" size="34"/></div>
			
			<div id="showOrHide" style="display:none;">
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;登记时间：<input type="text" id="startRegDate" name="member.startRegDate" value="<s:property value='member.startRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopRegDate" name="member.stopRegDate" value="<s:property value='member.stopRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;别：<select name="member.sex" style="width:212px;"><option value="" <s:if test="model.sex == null"> selected="selected" </s:if> >全部</option><option value="0" <s:if test="model.sex == 0"> selected="selected" </s:if> >男</option><option value="1" <s:if test="model.sex == 1"> selected="selected" </s:if> >女</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;积&nbsp;&nbsp;分：<input type="text" name="member.startScore" value="<s:property value='member.startScore' />" size="13" />--<input type="text" name="member.stopScore" value="<s:property value='member.stopScore' />" size="13" /></div>
			<div class="modifyItem modifyItemFloat">年&nbsp;&nbsp;龄&nbsp;&nbsp;段：<select name="member.age" style="width:212px;"><option value="" <s:if test="model.age == null"> selected="selected" </s:if> >全部</option><option value="0" <s:if test="model.age == 0"> selected="selected" </s:if> >20岁以下</option><option value="1" <s:if test="model.age == 1"> selected="selected" </s:if> >21～29</option><option value="2" <s:if test="model.age == 2"> selected="selected" </s:if> >30～39</option><option value="3" <s:if test="model.age == 3"> selected="selected" </s:if> >40岁以上</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;兑换条件：<select name="member.requirement" style="width:212px;"><option value="" <s:if test="model.requirement == null"> selected="selected" </s:if> >全部</option><option value="0" <s:if test="model.requirement == 0"> selected="selected" </s:if> >无条件</option><option value="1" <s:if test="model.requirement == 1"> selected="selected" </s:if> >凭身份证</option><option value="2" <s:if test="model.requirement == 2"> selected="selected" </s:if> >兑换密码</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;职&nbsp;&nbsp;业：<input type="text" name="member.occupation" value="<s:property value='member.occupation' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;短信优惠：<select name="member.accept" style="width:212px;"><option value="" <s:if test="model.accept == null"> selected="selected" </s:if> >全部</option><option value="0" <s:if test="model.accept == 0"> selected="selected" </s:if> >不接受</option><option value="1" <s:if test="model.accept == 1"> selected="selected" </s:if> >接受</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;登记用户：<input type="text" name="member.registerUser" value="<s:property value='member.registerUser' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;审核状态：<select name="member.verifyStatus" style="width:212px;"><option value="" <s:if test="model.verifyStatus == null"> selected="selected" </s:if> >全部</option><option value="0" <s:if test="model.verifyStatus == 0"> selected="selected" </s:if> >未审核</option><option value="1" <s:if test="model.verifyStatus == 1"> selected="selected" </s:if> >已审核</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;审核用户：<input type="text" name="member.verifier" value="<s:property value='member.verifier' />" size="34"/></div>
			</div>
			<!--<div class="modifyItem modifyItemFloat"></div>--><a id="more" href="#" onclick="showOrHide();">展开>></a><input type="button" name="search" id="search" onclick="doSubmit('/report/queryMemberReport.action');" value=" 搜  索 "/><input type="button" name="down" id="down" value=" 下  载 " onclick="doSubmit('/report/exportMemberReport.action');" style="margin-left:100px;"/>
			</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="8%" >会员名称</th>
					<th width="7%" >会员卡号</th>
					<th width="5%" >积分</th>
					<th width="4%" >性别</th>
					<th width="7%" >生日</th>
					<!--<th width="5%" >年龄</th>-->
					<th width="12%" >身份证</th>
					<th width="8%" >手机号</th>
					<!--<th width="8%" >固定电话</th>
					<th width="5%" >职业</th>-->
					<th width="15%" >EMail</th>
					<th width="12%" >地址</th>
					<th width="8%" >登记用户</th>
					<th width="10%" >登记时间</th>
					<th width="8%" >状态</th>
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
						<s:property value='score'/>
					</td>
					<td>
						<s:if test="sex== 0">男</s:if><s:elseif test="sex ==1">女</s:elseif>
					</td>
					<td>
						<s:date name="birthday" format="yyyy-MM-dd hh:mm" />
					</td>
					<!--<td>
						<s:if test="age== 0">20岁以下</s:if><s:elseif test="age ==1">21～29</s:elseif><s:elseif test="age ==2">30～39</s:elseif><s:elseif test="age ==3">40岁以上</s:elseif>
					</td>-->
					<td>
						<s:property value='idNo'/>
					</td>
					<td>
						
						<s:property value='mobile'/>
					</td>
					<!--<td>
						<s:property value='tel'/>
					</td>
					<td>
						<s:property value='occupation'/>
					</td>-->
					<td>
						<s:property value='email'/>
					</td>
					<td>
						<s:property value='address'/>
					</td>
					<td>
						<s:property value='registerUser'/>
					</td>
					<td>
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:if test="status == 1">正常</s:if><s:elseif test="status == 0">冻结</s:elseif>
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