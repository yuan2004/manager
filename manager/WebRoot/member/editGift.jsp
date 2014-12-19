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
		var form = $('#editGiftForm');
		if(validateForm()) {
			form.submit();
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					['giftName', '礼品名称不能为空', 'check'],
					//['reserve', '入库数量不能为空', 'check'],
					//['reserve', '入库数量必须为数字', 'isNum'],
					['score', '兑换积分不能为空', 'check'],
					['score', '兑换积分必须为数字', 'isNum'],
					]
				);
		return flag;
	}
	
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>添加礼品信息</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="editGiftForm" id="editGiftForm" action="editGift.action">
		<input type="hidden" name="giftId" id="giftId" value="<s:property value='model.giftId' />" />
		<div class="modifyItem">
			
		</div>
		<fieldset class="modifySet">
			<legend>礼品基本信息</legend>
			<div class="modifyItem modifyItemFloat">
				<label>礼品条形码：</label><s:property value='model.giftId'/>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="name">礼品名称：</label><input type="text" name="giftName" id="giftName"  value="<s:property value='model.giftName'/>" /><span  style="color:red">*</span>
			</div>
			<!--<div class="modifyItem modifyItemFloat">
				<label >入库数量：</label><input type="text" name="reserve" id="reserve"  value="<s:property value='model.reserve'/>"  /><span  style="color:red">*</span>
			</div>-->
			<div class="modifyItem modifyItemFloat">
				<label >兑换积分：</label><input type="text" name="score" id="score"  value="<s:property value='model.score'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="clear"></div>
			<div class="modifyItem">
				<label >备注：</label><textarea name="comment"><s:property value="model.comment" /></textarea>
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

</html>
