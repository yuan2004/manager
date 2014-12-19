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
		$("#searchMemberForm").attr('action', actionName);
		$("#searchMemberForm").submit();
	}
	
	function showOrHide() {
		$("#showOrHide").toggle();
		if($("#more").text().indexOf(">>") != -1) {
			$("#more").text("<<����");
			$("#showFlag").val(1);
		} else {
			$("#more").text("չ��>>");
			$("#showFlag").val(0);
		}
	}
	
	function onLoad() {
		if($("#showFlag").val() == 1) {
			$("#showOrHide").show();
			$("#more").text("<<����");
		} else {
			$("#showOrHide").hidden();
			$("#more").text("չ��>>");
		}
	}
	
	function confirmPwd(requirement, exchangeCode, cardId) {
		if(requirement == 2) {
			var x = window.prompt("�һ�������ʾ��","���ڴ�������Ķһ�����");
			if(x == exchangeCode) {
				doSubmit('/member/queryGiftByScore.action?searchCardId=' + cardId);
			} else {
				alert("������Ķһ����벻��ȷ��");
				return false;
			}
		} else if(requirement == 1) {
			alert("���ʾ���֤��");
			doSubmit('/member/queryGiftByScore.action?searchCardId=' + cardId);
		} else {
			doSubmit('/member/queryGiftByScore.action?searchCardId=' + cardId);
		}
	}
</script>	
</head>
<body onload="onLoad();">
<div id="title">
	<div class="titleRight">
		<h1 style="width: 125px;"><strong>��Ա����</strong></h1>
	</div>
</div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" action="/member/queryMemberByModel.action" name="searchMemberForm" id="searchMemberForm">
		<input type="hidden" id="showFlag" name="showFlag" value="<s:property value='showFlag'/>" />
		<h1 id="actionBanner">
		<fieldset class="modifySet">
			<div class="modifyItem modifyItemFloat">����Ա������<input type="text" name="name" value="<s:property value='model.name' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">��Ա�����ţ�<input type="text" name="cardId" value="<s:property value='model.cardId' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">��&nbsp;&nbsp;��&nbsp;&nbsp;�ţ�<input type="text" name="mobile" value="<s:property value='model.mobile' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;�̶��绰��<input type="text" name="tel" value="<s:property value='model.tel' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">��&nbsp;&nbsp;��&nbsp;&nbsp;֤��<input type="text" name="idNo" value="<s:property value='model.idNo' />" size="34"/></div>
			
			<div id="showOrHide" style="display:none;">
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;�Ǽ�ʱ�䣺<input type="text" id="startRegDate" name="startRegDate" value="<s:property value='model.startRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/>--<input type="text" id="stopRegDate" name="stopRegDate" value="<s:property value='model.stopRegDate' />"  format='yyyy-MM-dd' size="13" maxlength="10"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��<select name="sex" style="width:212px;"><option value="" <s:if test="model.sex == null"> selected="selected" </s:if> >ȫ��</option><option value="0" <s:if test="model.sex == 0"> selected="selected" </s:if> >��</option><option value="1" <s:if test="model.sex == 1"> selected="selected" </s:if> >Ů</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;�֣�<input type="text" name="startScore" value="<s:property value='model.startScore' />" size="13" />--<input type="text" name="stopScore" value="<s:property value='model.stopScore' />" size="13" /></div>
			<div class="modifyItem modifyItemFloat">��&nbsp;&nbsp;��&nbsp;&nbsp;�Σ�<select name="age" style="width:212px;"><option value="" <s:if test="model.age == null"> selected="selected" </s:if> >ȫ��</option><option value="0" <s:if test="model.age == 0"> selected="selected" </s:if> >20������</option><option value="1" <s:if test="model.age == 1"> selected="selected" </s:if> >21��29</option><option value="2" <s:if test="model.age == 2"> selected="selected" </s:if> >30��39</option><option value="3" <s:if test="model.age == 3"> selected="selected" </s:if> >40������</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;�һ�������<select name="requirement" style="width:212px;"><option value="" <s:if test="model.requirement == null"> selected="selected" </s:if> >ȫ��</option><option value="0" <s:if test="model.requirement == 0"> selected="selected" </s:if> >������</option><option value="1" <s:if test="model.requirement == 1"> selected="selected" </s:if> >ƾ���֤</option><option value="2" <s:if test="model.requirement == 2"> selected="selected" </s:if> >�һ�����</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;&nbsp;&nbsp;ְ&nbsp;&nbsp;ҵ��<input type="text" name="occupation" value="<s:property value='model.occupation' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;�����Żݣ�<select name="accept" style="width:212px;"><option value="" <s:if test="model.accept == null"> selected="selected" </s:if> >ȫ��</option><option value="0" <s:if test="model.accept == 0"> selected="selected" </s:if> >������</option><option value="1" <s:if test="model.accept == 1"> selected="selected" </s:if> >����</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;�Ǽ��û���<input type="text" name="registerUser" value="<s:property value='model.registerUser' />" size="34"/></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;���״̬��<select name="verifyStatus" style="width:212px;"><option value="" <s:if test="model.verifyStatus == null"> selected="selected" </s:if> >ȫ��</option><option value="0" <s:if test="model.verifyStatus == 0"> selected="selected" </s:if> >δ���</option><option value="1" <s:if test="model.verifyStatus == 1"> selected="selected" </s:if> >�����</option></select></div>
			<div class="modifyItem modifyItemFloat">&nbsp;&nbsp;����û���<input type="text" name="verifier" value="<s:property value='model.verifier' />" size="34"/></div>
			</div>
			<div class="modifyItem modifyItemFloat"><input type="hidden" /></div><a id="more" href="#" onclick="showOrHide();">չ��>></a><input type="submit" value=" �� �� "/>
		</fieldset>
		</h1>
		<div class="clear"></div>
		</form>
		<!-- start ad position list -->
		<div class="list-div" id="listDiv">
			<table id="list-table">
				<tr>
					<th width="8%" >����</th>
					<th width="8%" >����</th>
					<th width="12%" >���֤</th>
					<th width="8%" >�ֻ�</th>
					<th width="8%" >����</th>
					<th width="5%" >�Ա�</th>
					<!--<th width="5%" >����</th>-->
					<th width="10%" >ע������</th>
					<th width="5%" >״̬</th>
					<th width="40%" >����</th>
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
						<s:property value='idNo'/>
					</td>
					<td>
						<s:property value='mobile'/>
					</td>
					<td>
						<s:property value='score'/>
					</td>
					<td>
						<s:if test="sex== 0">��</s:if><s:elseif test="sex ==1">Ů</s:elseif>
					</td>
					<!--<td>
						<s:if test="age== 0">20������</s:if><s:elseif test="age ==1">21��29</s:elseif><s:elseif test="age ==2">30��39</s:elseif><s:elseif test="age ==3">40������</s:elseif>
					</td>-->
					<td>
						<s:date name="registerDate" format="yyyy-MM-dd hh:mm" />
					</td>
					<td>
						<s:if test="status == 1">����</s:if><span style="color:red"><s:elseif test="status == 0">����</s:elseif><s:elseif test="status == 2">δ���</s:elseif></span>
					</td>
					<td>
						<ul>
							<li  onclick="doSubmit('/member/viewMember.action?id=<s:property value='memberId'/>');" style="color:#FF0000">���ֻ���</li>
							<li  onclick="doSubmit('/member/gotoEditMember.action?id=<s:property value='memberId'/>');">�޸Ļ�Ա</li>
							<li  onclick="doSubmit('/member/abateMember.action?id=<s:property value='memberId'/>');">��ʧ</li>
							<li  onclick="doSubmit('/member/thawMember.action?id=<s:property value='memberId'/>');">�ⶳ</li>
							<li  onclick="doSubmit('/member/queryMember.action?searchCardId=<s:property value='cardId'/>');">����¼��</li>
							<li  onclick="doSubmit('/member/queryScoreLine.action?memberId=<s:property value='memberId'/>');">�����޸�</li>
							<s:if test="status == 1">
							<li  onclick="confirmPwd(<s:property value='requirement'/>,'<s:property value='exchangeCode'/>','<s:property value='cardId'/>');">���ֶһ�</li>
							</s:if>
							<r:role roleName="0">
							<s:if test="status == 2">
							<li  onclick="doSubmit('/member/auditMember.action?id=<s:property value='memberId'/>');">����û�</li>
							</s:if>
							</r:role>
							<s:if test="#session.loginName == 'admin'">
								<li  onclick="doSubmit('/member/deleteMember.action?id=<s:property value='memberId'/>');">ɾ��</li>
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
<script language="javascript" type="text/javascript">
	$("#startRegDate").mask('9999-99-99');
	$("#stopRegDate").mask('9999-99-99');
</script>
</html>