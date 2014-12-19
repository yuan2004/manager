<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>��Աϵͳ</title>
<meta name="robots" content="noindex, nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link rel="stylesheet" type="text/css"  href="/css/general.css" />
<link  rel="stylesheet" type="text/css" href="/css/css.css" />
<script type="text/javascript" src="/admin/js/listTable.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/manager.js"></script>
<script type="text/javascript" src="/js/validateFormUtil.js"></script>
<script type="text/javascript" src="employ.js"></script>
<script type="text/javascript">
	function doSubmit() {
		$('#submitButton').attr('disabled',"true");
		var datas = {'memberId' : $("#memberId").val(), 'shopId' : $("#shopId").val(), 'locationId' : $("#locationId").val()
				, 'amount' : $("#amount").val(), 'score' : $("#score").val()};
		var comment = escape($("#comment").val());
		var brand = escape($("#brand").val());
		var url = "/member/addScore.action?comment=" + comment + "&brand=" + brand;
		url = unescape(url);
		$.ajax({
			url: url,
			type: 'post',
			data: datas,
			dataType: 'json',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			error: function(){
				alert('����¼��ʧ��');
				$('#submitButton').attr('disabled',"");
				
			},
			success: function(returnvalue){
				$('#submitButton').attr('disabled',"");
				if(returnvalue["succ"] == 0) {
					alert('����¼��ɹ�');
					clean();
				} else {
					alert('����¼��ʧ��');
				}
			}
		});
	}
	
	function clean() {
		$("#brand").val("");
		$("#shop").val("");
		$("#locationId").val("");
		$("#amount").val("");
		$("#score").val("");
		$("#comment").val("");
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					//['shop', '�̻�����Ϊ��', 'check'],
					['brand', '�̻�Ʒ�Ʋ���Ϊ��', 'check'],
					['locationId', '�̻��̺Ų���Ϊ��', 'check'],
					['amount','���ѽ���Ϊ��','check'],
					['amount','���ѱ���Ϊ����','isNum'],
					['score','���ֲ���Ϊ��','check'],
					['score','���ֱ���Ϊ����','isNum']
					]
				);
		return flag;
	}
	
	function onSelectShop() {
		var shopId = $("#shopId").val();
		if(shopId != "") {
			var datas = {'shopId' : shopId};
			$.ajax({
				url: '/member/onSelectShop.action',
				type: 'post',
				data: datas,
				dataType: 'json',
				error: function(){
					alert('ʧ��');
				},
				success: function(returnvalue){
					var option = "";
					for(var key in returnvalue) {
						option += '<option value=' + key + '>' +returnvalue[key]+'</option>';
					}
					$("#locationId").html(option);
				}
			});
		} else {
			$("#locationId").html('<option value="">------��ѡ��------</option>');
		}
	}
	
	function openShop() {
		var obj = new Object();   
		obj.name="shop";
		var brand = $("#brand").val();
		window.showModalDialog('/member/queryOpenShopByName.action?temp=' + Math.random(), obj, "dialogWidth=800px;dialogHeight=600px");
		if(obj.value != null) {
			var array = obj.value.split("|");
			//alert(array[0]);
			$("#shopId").val(array[0]);
			$("#shop").val(array[1]);
			$("#brand").val(array[2]);
			onSelectShop();
		}
	}
	
	function openBrand() {
		var obj = new Object();   
		obj.name="brand";
		var shopName = $("#shop").val();
		window.showModalDialog('/member/queryOpenShopByBrand.action?temp=' + Math.random(), obj, "dialogWidth=800px;dialogHeight=600px;");
		if(obj.value != null) {
			var array = obj.value.split("|");
			$("#shopId").val(array[0]);
			$("#shop").val(array[1]);
			$("#brand").val(array[2]);
			onSelectShop();
		}
	}
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>����¼����Ϣ</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<fieldset class="modifySet">
			<legend>��Ա������Ϣ</legend>
			<div class="modifyItem modifyItemFloat">
				<label for="name">��Ա���ţ�</label><s:property value='model.cardId'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >������</label><s:property value='model.name'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">�������£�</label><s:date name='model.birthday' format='yyyy-MM-dd'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���֤��</label><s:property value='model.idNo'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�ֻ����룺</label><s:property value='model.mobile'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�̶��绰��</label><s:property value='model.tel'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���֣�</label><s:property value='model.score'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�Ա�</label>
				<s:if test="model.sex == 0">��</s:if><s:elseif test="model.sex == 1">Ů</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���䣺</label>
				<s:if test="model.age == 0">20������</s:if><s:elseif test="model.age == 1">21��29</s:elseif><s:elseif test="model.age == 2">30��39</s:elseif><s:elseif test="model.age == 3">40������</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ����룺</label><s:property value='model.exchangeCode'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ�������</label><s:if test="model.requirement == '0'" >������</s:if><s:elseif test="model.requirement == '1'">���֤</s:elseif><s:else>�һ�����</s:else>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >ְҵ��</label><s:property value='model.occupation'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >EMail��</label><s:property value='model.email'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���ն����Żݣ�</label><s:if test="model.accept == '1'" >����</s:if><s:else>������</s:else>
			</div>
			<div class="modifyItem">
				<label >ͨѶ��ַ��</label><s:property value='model.address'/>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >��ע��</label><s:property value="comment" />
			</div>
		</fieldset>
		<form method="post" action="/member/addScore.action" name="addScore" id="addScore">
		<input type="hidden" name="memberId" id="memberId" value="<s:property value='model.memberId' />" />
		<input type="hidden" name="shopId" id="shopId" />
		<!--<h1 id="actionBanner">		
			<span class="action-span">
				��Ա���ţ�<input type="text" name="searchCardId" value="<s:property value='searchCardId' />" size="33"/>
				&nbsp;&nbsp;&nbsp;&nbsp;��Ա�ֻ���<input type="text" name="searchMobile" value="<s:property value='searchMobile' />" size="11"/>
				<input type="submit" value="����"/>
			</span>
			<div class="clear"></div>
		</h1>
		<div class="clear"></div>-->
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
			<legend>����¼��</legend>	
			<div class="modifyItem modifyItemFloat">
				<label>Ʒ�ƣ�</label><input type="text" name="brand" id="brand" readonly="true" /><input class="bt" value="ѡ��" id="brandButton" name="brandButton" style="cursor: pointer;" type="button" onclick="openBrand();" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>�̻���</label><input type="text" name="shop" id="shop" readonly="true" /><input class="bt" value="ѡ��" id="shopButton" name="shopButton" style="cursor: pointer;" type="button" onclick="openShop();" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>�̺ţ�</label><select name="locationId" id="locationId" style="width:130px;">
					<option value="">------��ѡ��------</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>��</label><input name="amount" id="amount" type="text"><span  style="color:red">*����������</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>���֣�</label><input name="score" id="score" type="text"><span  style="color:red">*����������</span>
			</div>
			<div class="modifyItem">
				<label>��ע��</label><textarea id="comment" name="comment"></textarea>
			</div>
			
			<div class="modifyItem modifyItemFloat">
				<input class="bt" value=" ¼ �� " id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="doSubmit();" style="margin-left:300px;" />
			</div>
			<div class="clear"></div>
			</fieldset>
		</h1>
		</form>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
<script language="javascript" type="text/javascript">
	$("#birthday").mask('9999-99-99');
</script>
</html>
