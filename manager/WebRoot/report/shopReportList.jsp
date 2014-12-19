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
		$("#reportShopForm").attr('action', actionName);
		$("#reportShopForm").submit();
	}
	

</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>商户统计</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/report/queryShopReport.action" name="reportShopForm" id="reportShopForm">
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
				<div class="modifyItem modifyItemFloat">商户名称：<input type="text" name="shop.shopName" value="<s:property value='shop.shopName' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;品&nbsp;&nbsp;牌：<input type="text" name="shop.brand" value="<s:property value='shop.brand' />" size="34"/></div>
				<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;铺&nbsp;&nbsp;号：<input type="text" name="shop.locationNo" value="<s:property value='shop.locationNo' />" size="34" /></div>
				<div class="modifyItem modifyItemFloat">联&nbsp;系&nbsp;人：<input type="text" name="shop.contactUser" value="<s:property value='shop.contactUser' />" size="34" /></div>
				<div class="modifyItem modifyItemFloat">联系电话：<input type="text" name="shop.tel" value="<s:property value='shop.tel' />" size="34" /></div>
				<div class="modifyItem modifyItemFloat">登记时间：<input type="text" id="startRegDate" name="shop.startRegDate" value="<s:property value='shop.startRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopRegDate" name="shop.stopRegDate" value="<s:property value='shop.stopRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>	
				<input type="button" name="search" id="search" onclick="doSubmit('/report/queryShopReport.action');" value=" 搜  索 "/>
				<input type="button" name="down" id="down" value=" 下  载 " onclick="doSubmit('/report/exportShopReport.action');" style="margin-left:150px;"/>
			</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="20%" >商户名称</th>
					<th width="20%" >商户品牌</th>
					<th width="20%" >商户铺号</th>
					<th width="10%" >联系人</th>
					<th width="10%" >联系电话</th>
					<th width="10%" >登记用户</th>
					<th width="10%" >登记时间</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
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
						<s:property value='contactUser'/>
					</td>
					<td>
						<s:property value='tel'/>
					</td>
					<td>
						<s:property value='registerUser'/>
					</td>
					<td>
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
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