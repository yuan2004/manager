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
	/*$(document).ready(
		function(){	
			$('#searchUserByRoleSelector').change(function(e){
					window.location.href = 'searchUserByRole.html?role=' + e.target.options[e.target.selectedIndex].value;
				});
		});*/
	function doSubmit(actionName) {
		$("#searchUserForm").attr('action', actionName);
		$("#searchUserForm").submit();
	}
	
	function doChange(actionName, loginName) {
		$("#searchUserForm").attr('action', actionName + "?userId=" + loginName);
		$("#searchUserForm").submit();
	}
	
	function auditUser(userId) {
		if(confirm('ȷ��Ҫ�ⶳ���û���')){
			doChange("/user/auditUser.action", userId);
		}
	}
	
	function abateUser2(userId) {
		if(confirm('ȷ��Ҫ������û���')){
			doChange("/user/abateUser.action", userId);
		}
	}
	
	
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>�û�����</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/user/queryUserByLoginName.action" name="searchUserForm" id="searchUserForm">
		<h1 id="actionBanner">		
			<span class="action-span">
				�û�����<input type="text" id="loginName" name="loginName" value="" size="33"/>
				<input type="submit" value=" �� �� "/>
			</span>
			<!--<span class="action-span">
				���û���ɫ������
				<select id="searchUserByRoleSelector" name="role">
					<option value="1">����Ա</option>
					<option value="2">����Ա</option>
				</select>
			</span>
			<span class="action-span"><input type="button" value="��ӹ���Ա" onclick="doSubmit('/user/gotoAddUser.action');" /></span>-->
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >�û���</th>
					<th width="10%" >��ɫ</th>
					<th width="10%" >����</th>
					<th width="10%" >Ա��ID</th>
					<th width="10%" >��ϵ�绰</th>
					<th width="10%" >ְλ</th>
					<th width="10%" >��������</th>
					<th width="5%" >״̬</th>
					<th width="25%" >����</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<s:property value='loginName'/>
					</td>
					<td>
						<s:if test="role == 0">����Ա</s:if><s:elseif test="role == 1">����Ա</s:elseif>
					</td>
					<td>
						<s:property value='name'/>
					</td>
					<td>
						<s:property value='employeeId'/>
					</td>
					<td>
						<s:property value='tel'/>
					</td>
					<td>
						<s:property value='position'/>
					</td>
					<td>
						<s:date name='birthday' format='yyyy-MM-dd'/>
					</td>
					<td>
						<s:if test="status == 1">����</s:if><font color="#FF0000"><s:elseif test="status == 0">����</s:elseif><s:elseif test="status == 2">δ���</s:elseif></font>
					</td>
					
					<td>
						<ul>
							<li  onclick="showChangePasswordContainer('<s:property value='loginName'/>');">�޸�����</li>
							<li  onclick="doSubmit('/user/gotoEditUser.action?tempLoginName=<s:property value='loginName'/>');">�޸��û�</li>
							<s:if test="status == 1"><li  onclick="abateUser2('<s:property value='loginName'/>');">�����û�</li></s:if>
							<s:if test="status == 0"><li  onclick="auditUser('<s:property value='loginName'/>');">�������</li></s:if>
							<!--<r:role roleName="0">
							<s:if test="status == 2">
							<li  onclick="if(confirm('ȷ��Ҫ��˸��û���')){doChange('auditUser.action', '<s:property value='loginName'/>')};">����û�</li>
							</s:if>
							</r:role>-->
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