<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
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
		<h1 style="width: 125px;"><strong>�һ�����</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryManagerGift.action" name="managerGiftForm" id="managerGiftForm">
		<input type="hidden" name="memberScore" value="<s:property value='memberScore' />" />
		<h1 id="actionBanner">		
			<span class="action-span">
				��Ʒ���룺<input type="text" name="giftId" value="<s:property value='model.giftId' />" size="33"/>
				��Ʒ���ƣ�<input type="text" name="giftName" value="<s:property value='model.giftName' />" size="33"/>
				<input type="submit" value="����"/>
				<span style="color:red;margin-left:150px;">��ǰ�û�'<s:property value="#session.exchangeMember.name"/>'����Ϊ��<s:property value="memberScore" /></span>
			</span>
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >������</th>
					<th width="10%" >��Ʒ����</th>
					<th width="10%" >���</th>
					<th width="10%" >�һ�����</th>
					<th width="20%" >����</th>
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
							<!--<li onclick="doSubmit('/member/exchangeGift.action?id=<s:property value='giftId'/>');">�һ���Ʒ</li>-->
							<s:if test="memberScore >= score">
							<li onclick="showexchangeGiftContainer('<s:property value='giftId'/>','<s:property value='memberScore'/>','<s:property value='score'/>','<s:property value='reserve'/>');">�һ���Ʒ</li>
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