<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
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
		$("#searchShopLocationForm").attr('action', actionName);
		$("#searchShopLocationForm").submit();
	}
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>商户铺号管理</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryShopLocation.action" name="searchShopLocationForm" id="searchShopLocationForm">
		<h1 id="actionBanner">		
			<span class="action-span">
				商户铺号：<input type="text" name="locationNo" value="<s:property value='locationNo' />" size="33"/>
				<input type="submit" value="搜索"/>
			</span>
			<!--
			<span class="action-span"><input type="button" value="添加铺号" onclick="doSubmit('/member/gotoAddShopLocation.action');" /></span>-->
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >id</th>
					<th width="10%" >商户名称</th>
					<th width="10%" >商户铺号</th>
					<th width="10%" >联系电话</th>
					<th width="10%" >登记时间</th>
					<th width="10%" >登记用户</th>
					<th width="20%" >操作</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<s:property value='locationId'/>
					</td>
					<td>
						<s:property value='shopName'/>
					</td>
					<td>
						<s:property value='locationNo'/>
					</td>
					<td>
						<s:property value='contactUser'/>
					</td>
					<td>
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:property value='registerUser'/>
					</td>
					<td>
						<ul>
							<li  onclick="doSubmit('/member/gotoEditShopLocation.action?id=<s:property value='locationId'/>');">修改商户铺号</li>
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
</html>