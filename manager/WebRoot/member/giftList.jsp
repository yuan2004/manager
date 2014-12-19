<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="pageTag" prefix="page"%>
<%@ taglib uri="role" prefix="r"%>
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
		$("#searchGiftForm").attr('action', actionName);
		$("#searchGiftForm").submit();
	}
	
	
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>��Ʒ����ѯ</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryGiftByName.action" name="searchGiftForm" id="searchGiftForm">
		<h1 id="actionBanner">		
			<span class="action-span">
				��Ʒ���룺<input type="text" name="giftId" value="<s:property value='giftId' />" size="33"/>
				��Ʒ���ƣ�<input type="text" name="giftName" value="<s:property value='giftName' />" size="33"/>
				<input type="submit" value="����"/>
			</span>
			<!--<span class="action-span"><input type="button" value="�����Ʒ" onclick="doSubmit('/member/gotoAddGift.action');" /></span>-->
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="16%" >������</th>
					<th width="10%" >��Ʒ����</th>
					<th width="6%" >���</th>
					<th width="8%" >�һ�����</th>
					<th width="10%" >¼��ʱ��</th>
					<th width="10%" >¼���û�</th>
					<th width="10%" >�޸�ʱ��</th>
					<th width="10%" >�޸��û�</th>
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
						<s:date name="modifyDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:property value='modifyUser'/>
					</td>
					
					<td>
						<ul>
							<r:role roleName="0"><li  onclick="doSubmit('/member/gotoEditGift.action?id=<s:property value='giftId'/>');">�޸���Ʒ</li></r:role>
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