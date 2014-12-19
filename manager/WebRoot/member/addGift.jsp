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
<script type="text/javascript" src="/js/CJL.0.1.min.js"></script>
<script type="text/javascript" src="/js/QuickUpload.js"></script>
<script type="text/javascript" src="/js/ImagePreviewd.js"></script>
<script type="text/javascript">
	function doSubmit() {
		var form = $('#addGiftForm');
		//alert($("#isTemp").val());
		if($("#isTemp").val() == 1) {
			if(validateForm2()) {
				form.submit();
			}
		} else {
			if(validateForm()) {
				form.submit();
			}
		}
	}
	
	function validateForm() {
		var flag = auto_check_form
				(
					[
					['giftId', '�����벻��Ϊ��', 'check'],
					['giftName', '��Ʒ���Ʋ���Ϊ��', 'check'],
					['reserve', '�����������Ϊ��', 'check'],
					['reserve', '�����������Ϊ����', 'isNum'],
					['score', '�һ����ֲ���Ϊ��', 'check'],
					['score', '�һ����ֱ���Ϊ����', 'isNum']
					//['file', '��ͼƬ�ļ�', 'matchPicFileName']
					]
				);
		return flag;
	}
	
	function validateForm2() {
		var flag = auto_check_form
				(
					[
					['giftId', '�����벻��Ϊ��', 'check'],
					//['giftName', '��Ʒ���Ʋ���Ϊ��', 'check'],
					['reserve', '�����������Ϊ��', 'check'],
					['reserve', '�����������Ϊ����', 'isNum']
					//['score', '�һ����ֲ���Ϊ��', 'check'],
					//['score', '�һ����ֱ���Ϊ����', 'isNum']
					//['file', '��ͼƬ�ļ�', 'matchPicFileName']
					]
				);
		return flag;
	}
	
	function checkIsExistGift() {
		var datas = {'giftId':$("#giftId").val()};
		$.ajax({
				url: '/member/isExistGift.action',
				type: 'POST',
				data: datas,
				dataType: 'json',
				error: function(){
					alert("");
				},
				success: function(returnvalue){
					var isExist = returnvalue["isExist"];
					var score = returnvalue["score"];
					var giftName = returnvalue["giftName"];
					//alert(score);
					//alert(giftName);
					if(isExist == 1) {
						$("#isTemp").val("1");
						//alert("��Ա����"+$("#cardId").val()+"�Ѵ��ڡ�");
						//$("#cardId").focus();
						$("#giftName").val(giftName);
						$("#score").val(score);
						$("#giftName").attr("disabled", "disabled");
						$("#score").attr("disabled", "disabled");
					} else {
						$("#isTemp").val("0");
					}
				}
		});
	}
	
	
</script>
</head>
<body>
<div id="title"><div class="titleRight"><h1 style="width: 150px;"><strong>�����Ʒ��Ϣ</strong></h1></div></div>
<div id="main-div">
	<div id="mainRight">
		<form method="post" name="addGiftForm" id="addGiftForm" action="addGift.action" enctype="multipart/form-data">
		<input type="hidden" name="isTemp" id="isTemp" value="0" />
		<div class="modifyItem">
			
		</div>
		<fieldset class="modifySet">
			<legend>��Ʒ������Ϣ</legend>
			<div class="modifyItem modifyItemFloat">
				<label>��Ʒ�����룺</label><input type="text" name="giftId" id="giftId" onchange="checkIsExistGift();" value="<s:property value='giftId'/>" /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label for="name">��Ʒ���ƣ�</label><input type="text" name="giftName" id="giftName"  value="<s:property value='giftName'/>" /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >���������</label><input type="text" name="reserve" id="reserve"  value="<s:property value='reserve'/>"  /><span  style="color:red">*</span>
			</div>
			<div class="modifyItem modifyItemFloat">
				<label >�һ����֣�</label><input type="text" name="score" id="score"  value="<s:property value='score'/>"  /><span  style="color:red">*</span>
			</div>
			<!--<div class="modifyItem">
				<label >ͼƬ��</label><input type="file" name="file" id="idFile" size="79" />
			</div>
			<div class="modifyItem">
				<label >Ԥ����</label><IMG id="idImg" style="margin-left:10px;">
			</div>-->
			<div class="clear"></div>
			<div class="modifyItem">
				<label >��ע��</label><textarea name="comment"><s:property value="comment" /></textarea>
			</div>
		</fieldset>
		
		<div id="modifyButtonDiv">
			<input class="bt" value="�ύ" id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="doSubmit();" />
			<input class="bt" value="����" name="resetButton" style="cursor: pointer;" type="reset" />
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
<script>
/**
var ip = new ImagePreview( $$("idFile"), $$("idImg"), {
	maxWidth: 200, maxHeight: 200, action: "viewImg.jsp"
});
ip.img.src = ImagePreview.TRANSPARENT;
ip.file.onchange = function(){ ip.preview(); };
*/
</script>
</html>
