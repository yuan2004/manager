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
		var form = $('#addShopLocationForm');
		if(validateForm()) {
			form.submit();
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					['locationNo', '铺号不能为空', 'check'],
					['shopId', '商铺不能为空', 'check']
					]
				);
		return flag;
	}
	
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>添加商户铺号信息</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="addShopLocationForm" id="addShopLocationForm" action="addShopLocation.action">
		
		<div class="modifyItem">
			
		</div>
		<fieldset class="modifySet">
			<legend>商户铺号基本信息</legend>
			<div class="modifyItem modifyItemFloat">
				<label for="name">铺号名称：</label><input type="text" name="locationNo" id="locationNo"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="name">所属商户：</label>
				<select name="shopId" id="shopId">
					<option value="">------请选择-----</option>
					<s:iterator value="list">
						<option value="<s:property value='shopId' />"><s:property value='shopName' /></option>
					</s:iterator>
				</select><span  style="color:red">*</span>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >备注：</label><textarea name="comment"><s:property value="comment" /></textarea>
			</div>
		</fieldset>
		
		<div id="modifyButtonDiv">
			<input class="bt" value="提交" id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="doSubmit();" />
			<input class="bt" value="重置" name="resetButton" style="cursor: pointer;" type="reset" />
		</div>
		</form>
	</div>
</div>
<div id="bottom"><div id="bottomLeft"><div id="bottomRight"></div></div></div>
</body>
<script language="javascript" type="text/javascript">
	//$("#reserve").mask('999999999999');
	//$("#scroe").mask('99999999');
</script>
</html>
