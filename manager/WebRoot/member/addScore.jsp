<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<title>会员系统</title>
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
				alert('积分录入失败');
				$('#submitButton').attr('disabled',"");
				
			},
			success: function(returnvalue){
				$('#submitButton').attr('disabled',"");
				if(returnvalue["succ"] == 0) {
					alert('积分录入成功');
					clean();
				} else {
					alert('积分录入失败');
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
					//['shop', '商户不能为空', 'check'],
					['brand', '商户品牌不能为空', 'check'],
					['locationId', '商户铺号不能为空', 'check'],
					['amount','消费金额不能为空','check'],
					['amount','消费必须为数字','isNum'],
					['score','积分不能为空','check'],
					['score','积分必须为数字','isNum']
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
					alert('失败');
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
			$("#locationId").html('<option value="">------请选择------</option>');
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
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>积分录入信息</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<fieldset class="modifySet">
			<legend>会员基本信息</legend>
			<div class="modifyItem modifyItemFloat">
				<label for="name">会员卡号：</label><s:property value='model.cardId'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >姓名：</label><s:property value='model.name'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="user.qq">出生年月：</label><s:date name='model.birthday' format='yyyy-MM-dd'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >身份证：</label><s:property value='model.idNo'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >手机号码：</label><s:property value='model.mobile'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >固定电话：</label><s:property value='model.tel'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >积分：</label><s:property value='model.score'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >性别：</label>
				<s:if test="model.sex == 0">男</s:if><s:elseif test="model.sex == 1">女</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >年龄：</label>
				<s:if test="model.age == 0">20岁以下</s:if><s:elseif test="model.age == 1">21～29</s:elseif><s:elseif test="model.age == 2">30～39</s:elseif><s:elseif test="model.age == 3">40岁以上</s:elseif>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换密码：</label><s:property value='model.exchangeCode'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >兑换条件：</label><s:if test="model.requirement == '0'" >无条件</s:if><s:elseif test="model.requirement == '1'">身份证</s:elseif><s:else>兑换密码</s:else>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >职业：</label><s:property value='model.occupation'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >EMail：</label><s:property value='model.email'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >接收短信优惠：</label><s:if test="model.accept == '1'" >接受</s:if><s:else>不接受</s:else>
			</div>
			<div class="modifyItem">
				<label >通讯地址：</label><s:property value='model.address'/>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >备注：</label><s:property value="comment" />
			</div>
		</fieldset>
		<form method="post" action="/member/addScore.action" name="addScore" id="addScore">
		<input type="hidden" name="memberId" id="memberId" value="<s:property value='model.memberId' />" />
		<input type="hidden" name="shopId" id="shopId" />
		<!--<h1 id="actionBanner">		
			<span class="action-span">
				会员卡号：<input type="text" name="searchCardId" value="<s:property value='searchCardId' />" size="33"/>
				&nbsp;&nbsp;&nbsp;&nbsp;会员手机：<input type="text" name="searchMobile" value="<s:property value='searchMobile' />" size="11"/>
				<input type="submit" value="搜索"/>
			</span>
			<div class="clear"></div>
		</h1>
		<div class="clear"></div>-->
		<h1 id="actionBanner">		
			<fieldset class="modifySet">
			<legend>积分录入</legend>	
			<div class="modifyItem modifyItemFloat">
				<label>品牌：</label><input type="text" name="brand" id="brand" readonly="true" /><input class="bt" value="选择" id="brandButton" name="brandButton" style="cursor: pointer;" type="button" onclick="openBrand();" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>商户：</label><input type="text" name="shop" id="shop" readonly="true" /><input class="bt" value="选择" id="shopButton" name="shopButton" style="cursor: pointer;" type="button" onclick="openShop();" />
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>铺号：</label><select name="locationId" id="locationId" style="width:130px;">
					<option value="">------请选择------</option>
				</select>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>金额：</label><input name="amount" id="amount" type="text"><span  style="color:red">*必须是数字</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label>积分：</label><input name="score" id="score" type="text"><span  style="color:red">*必须是数字</span>
			</div>
			<div class="modifyItem">
				<label>备注：</label><textarea id="comment" name="comment"></textarea>
			</div>
			
			<div class="modifyItem modifyItemFloat">
				<input class="bt" value=" 录 入 " id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="doSubmit();" style="margin-left:300px;" />
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
