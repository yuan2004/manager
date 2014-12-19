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
		$("#searchShopForm").attr('action', actionName);
		$("#searchShopForm").submit();
	}
	
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>�̻�����</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryShopByName.action" name="searchShopForm" id="searchShopForm">
		<h1 id="actionBanner">		
			<span class="action-span">
				�̻����ƣ�<input type="text" name="shopName" value="<s:property value='shopName' />" size="33"/>
				�̻��̺ţ�<input type="text" name="locationNo" value="<s:property value='locationNo' />" size="33"/>
				<input type="submit" value="����"/>
			</span>
			<!--<span class="action-span"><input type="button" value="����̻�" onclick="doSubmit('/member/gotoAddShop.action');" /></span>-->
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >�̻�����</th>
					<th width="10%" >�̻�Ʒ��</th>
					<th width="10%" >�̻��̺�</th>
					<th width="10%" >��ϵ��</th>
					<th width="10%" >��ϵ�绰</th>
					<th width="10%" >�Ǽ�ʱ��</th>
					<th width="10%" >�Ǽ��û�</th>
					<th width="10%" >�޸�ʱ��</th>
					<th width="10%" >�޸��û�</th>
					<th width="10%" >����</th>
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
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:property value='registerUser'/>
					</td>
					<td>
						<s:date name="modifyDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:property value='modifyUser'/>
					</td>
					
					<td>
						<ul>
							<li  onclick="doSubmit('/member/gotoEditShop.action?id=<s:property value='shopId'/>');">�޸��̻�</li>
						</ul>
					</td>
				</tr>
				</s:iterator>
			</table>
			<page:pageBar pageObject="page" id="pageBar" />
			<s:if test="page.pageData.isEmpty">
				û�м�¼߹����磡
			</s:if>
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