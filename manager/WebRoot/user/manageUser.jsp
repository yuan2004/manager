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
		if(confirm('确定要解冻该用户吗？')){
			doChange("/user/auditUser.action", userId);
		}
	}
	
	function abateUser2(userId) {
		if(confirm('确定要冻结该用户吗？')){
			doChange("/user/abateUser.action", userId);
		}
	}
	
	
</script>	
</head>
<body>
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>用户管理</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/user/queryUserByLoginName.action" name="searchUserForm" id="searchUserForm">
		<h1 id="actionBanner">		
			<span class="action-span">
				用户名：<input type="text" id="loginName" name="loginName" value="" size="33"/>
				<input type="submit" value=" 搜 索 "/>
			</span>
			<!--<span class="action-span">
				按用户角色搜索：
				<select id="searchUserByRoleSelector" name="role">
					<option value="1">管理员</option>
					<option value="2">操作员</option>
				</select>
			</span>
			<span class="action-span"><input type="button" value="添加管理员" onclick="doSubmit('/user/gotoAddUser.action');" /></span>-->
			<div class="clear"></div>
		</h1>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="10%" >用户名</th>
					<th width="10%" >角色</th>
					<th width="10%" >姓名</th>
					<th width="10%" >员工ID</th>
					<th width="10%" >联系电话</th>
					<th width="10%" >职位</th>
					<th width="10%" >出生日期</th>
					<th width="5%" >状态</th>
					<th width="25%" >操作</th>
				</tr>
				<s:iterator value="page.pageData">
				<tr onMouseOver="javascript:ListTable.trMouseOver(this);" onMouseOut="javascript:ListTable.trMouseOut(this);"/>
					<td>
						<s:property value='loginName'/>
					</td>
					<td>
						<s:if test="role == 0">管理员</s:if><s:elseif test="role == 1">操作员</s:elseif>
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
						<s:if test="status == 1">正常</s:if><font color="#FF0000"><s:elseif test="status == 0">冻结</s:elseif><s:elseif test="status == 2">未审核</s:elseif></font>
					</td>
					
					<td>
						<ul>
							<li  onclick="showChangePasswordContainer('<s:property value='loginName'/>');">修改密码</li>
							<li  onclick="doSubmit('/user/gotoEditUser.action?tempLoginName=<s:property value='loginName'/>');">修改用户</li>
							<s:if test="status == 1"><li  onclick="abateUser2('<s:property value='loginName'/>');">冻结用户</li></s:if>
							<s:if test="status == 0"><li  onclick="auditUser('<s:property value='loginName'/>');">解除冻结</li></s:if>
							<!--<r:role roleName="0">
							<s:if test="status == 2">
							<li  onclick="if(confirm('确定要审核该用户吗？')){doChange('auditUser.action', '<s:property value='loginName'/>')};">审核用户</li>
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