<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>会员系统</title>
<base target="_self">
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script language="JavaScript">
	function doSubmit(actionName) {
		$("#searchShopForm1").attr('action', actionName);
		$("#searchShopForm1").submit();
	}
	
	function onLoad() {
		var obj =  window.dialogArguments;
		if(obj.name == "shop") {
			$("#brandFlag").hide();
		} else {
			$("#shopFlag").hide();
		}
	}
	
	function check_select(value) {
		var obj =  window.dialogArguments;
		//shopId|shopName|brand
		obj.value = $("#" + value).val();
		window.self.close();
	}
</script>
</head>
<body onload="onLoad();"  scroll="no">
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>商户列表</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="#" name="searchShopForm1" id="searchShopForm1" width="85%">
		<h1 id="actionBanner">		
			<span class="action-span">
				<span id="shopFlag">商户名称：<input type="text" name="shopName" value="<s:property value='shopName' />" size="33"/><input type="submit" value="搜索" onclick="doSubmit('/member/queryOpenShopByName.action?');"/></span>
				<span id="brandFlag">品牌：<input type="text" name="brand" value="<s:property value='brand' />" size="33"/><input type="button" value="搜索" onclick="doSubmit('/member/queryOpenShopByBrand.action');"/></span>
			</span>
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th>选择</th><th>品牌</th><th>商户名称</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<input type="radio" name="shopNames" value="<s:property value='shopId' />|<s:property value='shopName' />|<s:property value='brand' />" id="<s:property value='shopId' />" onclick="check_select(<s:property value='shopId' />)" />
					</td>
					<td><s:property value='brand'/></td>
					<td><s:property value='shopName'/></td>
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