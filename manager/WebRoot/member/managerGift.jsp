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
		$("#managerGiftForm").attr('action', actionName);
		$("#managerGiftForm").submit();
	}
	
	function onLoad() {
		var url = this.location.href;
		//alert(url);
	}
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>兑换管理</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryManagerGift.action" name="managerGiftForm" id="managerGiftForm">
		<input type="hidden" name="memberScore" value="<s:property value='memberScore' />" />
		<h1 id="actionBanner">		
			<span class="action-span">
				礼品编码：<input type="text" name="giftId" value="<s:property value='model.giftId' />" size="33"/>
				礼品名称：<input type="text" name="giftName" value="<s:property value='model.giftName' />" size="33"/>
				<input type="submit" value="搜索"/>
				<span style="color:red;margin-left:150px;">当前用户'<s:property value="#session.exchangeMember.name"/>'积分为：<s:property value="memberScore" /></span>
			</span>
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >条形码</th>
					<th width="10%" >礼品名称</th>
					<th width="10%" >库存</th>
					<th width="10%" >兑换积分</th>
					<th width="20%" >操作</th>
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
					<td style="">
						<s:property value='score'/>
					</td>
					<td>
						<ul>
							<!--<li onclick="doSubmit('/member/exchangeGift.action?id=<s:property value='giftId'/>');">兑换礼品</li>-->
							<s:if test="memberScore >= score">
							<li onclick="showexchangeGiftContainer('<s:property value='giftId'/>','<s:property value='memberScore'/>','<s:property value='score'/>','<s:property value='reserve'/>');">兑换礼品</li>
							</s:if>
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