	//----------------------------common.js
	//验证码图片路径
	var Validate = new Object();
	Validate.getValidateCodeImageUrl = function(){
		return "/validateCode/validateCode!createImage.action?action=create&random=" + Math.random();
	}
	//----------------------------permission.js
	var Permission = {};
	Permission.scriptOnloadCallbackFunctionString = null;
	Permission.bulidScriptSuccess = true;
	//创建权限js
	Permission.bulidScript = function (scriptOnloadCallbackFunctionString) {
		var bgDIv = FloatContainer.drawBackground("permissionLoadingBgDiv", "#FFF", 0);
		Permission.bulidScriptSuccess = false;
		$("#permissionJsLabel").remove();
		var scriptObj = document.createElement("script");
		scriptObj.id = "permissionJsLabel";
	    scriptObj.type="text/javascript";
		scriptObj.src = "/loginAndRegister/getPermissionJS.html?" + Math.random();
		var headArray = document.getElementsByTagName("head");
		headArray[0].appendChild(scriptObj);
		if(Browser.isIE()){
	        scriptObj.onreadystatechange = function () {
				if (scriptObj.readyState == 'loaded' || scriptObj.readyState == 'complete') {
					Permission.bulidScriptSuccess = true;
					if(scriptOnloadCallbackFunctionString != null){
						eval(scriptOnloadCallbackFunctionString);
					}
					$(bgDIv).remove();
				}   
	        }
		}else if(Browser.isFirefox()){
	        scriptObj.onload = function () {
				Permission.bulidScriptSuccess = true;
				if(scriptOnloadCallbackFunctionString != null){
					eval(scriptOnloadCallbackFunctionString);
				}
				$(bgDIv).remove();
	        }
		}
    	return false;  
	}
	Permission.setLogoutButton = function() {
		if($("#loginOrlogoutButton").size() > 0){
			$("#loginOrlogoutButton").html("<a href='javascript:void%200;Logout.logout();' style='color: #00742C;'>[退出]</a>");
		}
	}
	Permission.setLoginButton = function() {
		if($("#loginOrlogoutButton").size() > 0){
			$("#loginOrlogoutButton").html("<a href='javascript:void%200;login();' style='color: #00742C;'>[登录]</a><a href='javascript:void%200;Register.builderRegisterWindow(\"loginCallback(Register.userName)\");' style='color: #00742C;'>[免费注册]</a>");
		}
	}
	//----------------------------register.js
	
	var registerWindowContent = new String('\
		<div id="registerWindow" style="margin:20px;color:#000000;">\
			<fieldset>\
			<legend>请填写注册信息</legend>\
			<form method="post" name="registerForm" id="registerForm">\
			<div style="text-align: left;padding-left:20px;margin-bottom:5px;" id="register_userNameDiv">\
				<label style="float: left;width: 80px;text-align:right;" for="register_userName">　用户名：</label><input size="20" name="register_userName" id="register_userName" type="text" onchange="Register.checkAccount();" ><span  style="color:red">*</span><span id="register_userNameErrorInput">用户名3-16个字符</span>\
			</div>\
			<div style="text-align: center;margin-bottom:5px;display:none;" id="register_checkAccountResultDiv"></div>\
			<div style="text-align: left;padding-left:20px;margin-bottom:5px;" id="register_pwdDiv">\
				<label style="float: left;width: 80px;text-align:right;" for="register_userPass">　密码：</label><input size="20" name="register_userPass" id="register_userPass" type="password" onchange="Register.checkPassword();" ><span  style="color:red">*</span><span id="register_userPassErrorInput">密码6-12位</span>\
			</div>\
			<div style="text-align: left;padding-left:20px;margin-bottom:5px;" id="register_rePwdDiv">\
				<label style="float: left;width: 80px;text-align:right;" for="register_reUserPass">确认密码：</label><input size="20" name="register_reUserPass" id="register_reUserPass" type="password" onchange="Register.checkRePassword();"><span  style="color:red">*</span><span id="register_reUserPassErrorInput"></span>\
			</div>\
			<div style="text-align: left;padding-left:20px;margin-bottom:5px;" id="register_emailDiv">\
				<label style="float: left;width: 80px;text-align:right;" for="register_email">电子邮箱：</label><input size="20" name="register_email" id="register_email" type="text" onchange="Register.checkEmail();"><span  style="color:red">*</span><span id="register_emailErrorInput"></span>\
			</div>\
			<div style="text-align: left;padding-left:20px;margin-bottom:5px;" id="register_qqDiv">\
				<label style="float: left;width: 80px;text-align:right;" for="register_qq">　　 QQ：</label><input size="20" name="register_qq" id="register_qq" type="text"><span  style="color:#000000" >*</span><span id="register_qqErrorInput">联系电话或QQ至少要填一个</span>\
			</div>\
			<div style="text-align: left;padding-left:20px;margin-bottom:5px;" id="register_phoneDiv">\
				<label style="float: left;width: 80px;text-align:right;" for="register_phone">联系电话：</label><input size="20" name="register_phone" id="register_phone" type="text" ><span  style="color:#000000">*</span><span id="register_phoneErrorInput">联系电话或QQ至少要填一个</span>\
			</div>\
			<div style="text-align: left;padding-left:20px;margin-bottom:5px;" id="register_codeDiv">\
				<label style="float: left;width: 80px;text-align:right;" for="register_inputCode">　验证码：</label><input maxlength="4" size="11" name="register_inputCode" id="register_inputCode" type="text" onkeydown="if(event.keyCode==13) {Register.register(); return false;}" ><span  style="color:red">*</span>\
				<a title="刷新" id="codeLink" href="javascript:void%200;Register.reloadImage();"><img src="${imgUrl}" name="register_validateCode" id="register_validateCode" style="cursor: pointer;" align="middle" border="0" height="20" width="60"></a>\
			</div>\
			<div style="text-align: center;margin-bottom:5px;" id="register_buttonDiv">\
				<input class="bt" value="注册" id="registerButton" name="registerButton" style="cursor: pointer;" type="button" onclick="Register.register();">\
				<input class="bt" value="重置" name="resetButton" style="cursor: pointer;" type="reset">\
			</div>\
			<div style="text-align: center;"><span  style="color:red">*为必填信息</span>　　<span  style="color:#000000">*为选填信息</span></div>\
			<div style="text-align: center;" id="register_resultDiv"></div>\
			</form>\
			</fieldset>\
		</div>\
	');


	var Register = {};
	Register.floatContainer = null;
	Register.callbackFunctionString = null;
	//用户名是否有效标志
	Register.validate = false;
	Register.userName = null;
	Register.builderRegisterWindow = function( callbackFunctionString ){
		Register.callbackFunctionString = callbackFunctionString;
		Register.floatContainer = new FloatContainer("Register.floatContainer", "会员注册", 500, 400, null, null, 15);
		var parameter ={imgUrl:Validate.getValidateCodeImageUrl()};
		Register.floatContainer.setHTML( registerWindowContent.processUseCache(parameter) );
		$("#register_userName").focus();
		$("#register_inputCode").onkeydown = new Function("if(event.keyCode==13){Register.register();}");
	}
	
	Register.reloadImage = function (){
		$("#register_validateCode").src = Validate.getValidateCodeImageUrl();
	}
	Register.checkAccount = function(){
		Register.validate = false;
		$("#register_checkAccountResultDiv").hide()
		if($("#register_userName").val().Trim() != ""){
			if( Check.auto_check_form([
						   ['register_userName','用户名由3-16个字符组成','between','3','16']
									], $("#register_userNameErrorInput")[0])){
				var userName = $("#register_userName").val();
				var checkAccountCallbackObject = new Register.checkAccountCallbackObject();
				new Net.ContentLoader(checkAccountCallbackObject, "/loginAndRegister/checkAccount.html?userName=" + userName);
			}
		}
	}
	Register.checkPassword = function(){
		Check.auto_check_form([
			   ['register_userPass','密码不能为空','check'],
			   ['register_userPass','密码由6-12个字符组成','between','6','12'],
			   ['register_userPass','密码不能包含汉字','china']
								], $("#register_userPassErrorInput")[0]);
	}
	Register.checkRePassword = function(){
		Check.auto_check_form([
			   ['register_reUserPass','确认密码不能为空','check'],
			   ['register_userPass','二次密码不相符','userPass','register_reUserPass']
								], $("#register_reUserPassErrorInput")[0]);
	}
	Register.checkEmail = function(){
		Check.auto_check_form([
			   ['register_email','Email不能为空或格式不正确','email']
								], $("#register_emailErrorInput")[0]);
	}

	Register.register = function(){
			if(!Register.validate){
				alert("请先检测用户名，才能进行注册。");
				return;
			}
			if( Check.auto_check_form([
		               ['register_userName','用户名不能为空','check'],
					   ['register_userName','用户名由3-16个字符组成','between','3','16'],
					   ['register_userPass','密码不能为空','check'],
					   ['register_userPass','密码由6-12个字符组成','between','6','12'],
					   ['register_userPass','密码不能包含汉字','china'],
					   ['register_reUserPass','确认密码不能为空','check'],
					   ['register_userPass','二次密码不相符','userPass','register_reUserPass'],
					   ['register_email','Email不能为空或格式不正确','email'],
					   ['register_inputCode','验证码不能为空','check']
								])){
				
				if(Check.check($("#register_qq").val()) || Check.check($("#register_phone").val())){
					if( !Check.check($("#register_qq").val()) || Check.auto_check_form([['register_qq','QQ不能为空或格式不正确','num']], $("#register_qqErrorInput")[0])){
						Register.disableModule();
						Register.userName = $("#register_userName").val();
						var pwd = $("#register_userPass").val();
						var email = $("#register_email").val();
						var qq = $("#register_qq").val();
						var phone = $("#register_phone").val();
						var inputCode = $("#register_inputCode").val();
						var registerCallbackObject = new Register.registerCallbackObject();
						new Net.ContentLoader(registerCallbackObject,  "/loginAndRegister/quickRegister.html?userName=" + Register.userName + "&password=" + pwd + "&inputCode=" + inputCode + "&email=" + email + "&qq=" + qq + "&phone=" + phone);			
					}
				}else{
					$("#register_phoneErrorInput").html( "<img src='/images/error.gif'/>联系电话或QQ至少要填一个");
					$("#register_phone").focus();	
				}				
			}
	}

	Register.disableModule = function (){
        $("#registerButton").disabled = true;
    	$("#register_inputCode").disabled = true;
    }
    Register.enableModule = function (){
        $("#registerButton").disabled = false;
    	$("#register_inputCode").disabled = false;
    }
	Register.checkAccountCallbackObject = function(){}
	
	Register.checkAccountCallbackObject.prototype = new Net.Listener();
	
	Register.checkAccountCallbackObject.prototype.callBack = function(xmlDoc){
		var resultString = "";
		if(xmlDoc != null){		
			var resultList = xmlDoc.getElementsByTagName("result");
			$("#register_checkAccountResultDiv").show().html(resultList[0].childNodes[0].nodeValue);
			var validate = xmlDoc.getElementsByTagName("validate");
			if(validate[0].childNodes[0].nodeValue == "true"){
				$("#register_checkAccountResultDiv").css("backgroundColor" ,"#7CFC00");
				Register.validate = true;
			}else{
				$("#register_checkAccountResultDiv").css("backgroundColor" ,"#FA8072");
				$("#register_userNameErrorInput").html( "<img src='/images/error.gif'/>");
				Register.validate = false;
				$("#register_userName").focus();
			}

		}
	}
	
	Register.registerCallbackObject = function(){}
	
	Register.registerCallbackObject.prototype = new Net.Listener();
	
	Register.registerCallbackObject.prototype.callBack = function(xmlDoc){
		var resultString="";
		if(xmlDoc !=null){
			var validate = xmlDoc.getElementsByTagName("validate");
			if(validate[0].childNodes[0].nodeValue == "true"){
				//注册后自动登陆，所以要更新权限js
				Permission.bulidScript();
				$("#registerWindow").html("<div style='text-align: center;backgroundColor:#1E90FF;'>注册成功，3秒后自动返回。</div>");
				setTimeout(Register.repeat,2000);
			}else{
				var resultList=xmlDoc.getElementsByTagName("result");
				$("#register_resultDiv").css("backgroundColor" ,"#FA8072").html(resultList[0].childNodes[0].nodeValue);
			}
		}
		Register.reloadImage();
		Register.enableModule();
	}
	
	//注册成功后调用的方法
	Register.repeat = function (){	
    	Register.floatContainer.removeObj();
    	Permission.setLogoutButton();
		//登陆成功后，重新执行一次方法
		if(Register.callbackFunctionString != null ){
			eval(Register.callbackFunctionString);
			Register.callbackFunctionString = null;
		}
		
    }
    
	var Login = {};
	Login.floatContainer = null;
	Login.commonUser = 1;
	Login.enterpriseUser = 2;
	Login.manager = 10;
	Login.role = null;
	Login.callbackFunctionString = null;
	Login.userName = null;
	Login.builderLoginWindow = function( role, callbackFunctionString ){
		Login.role = role;
		Login.callbackFunctionString = callbackFunctionString;
		Login.checkMustValidate();
	}
	
	Login.checkMustValidate = function(){
		var callbackObject = new Login.checkMustValidateCallbackObject();
		new Net.ContentLoader(callbackObject, "/checkMustValidate.action", null, Net.type.xml);
	}
	Login.checkMustValidateCallbackObject = function(){}
	
	Login.checkMustValidateCallbackObject.prototype = new Net.Listener();
	
	Login.checkMustValidateCallbackObject.prototype.callBack = function(xmlDoc){
		if(xmlDoc !=null){
			$("#login_userName").focus();
			var result = xmlDoc.getElementsByTagName("result")[0].childNodes[0].nodeValue;
			if(result == "true"){
				Login.reloadImage();
			}
		}
	}
	
	Login.login = function (){
		if(!Check.auto_check_form(
					[
						['login_userName','用户名不能为空','check'],
						['login_password','密码不能为空','check']
					])){
			return false;
		}
		if($("#login_inputCode").size() > 0){
			if(!Check.auto_check_form(
						[
							['login_inputCode','验证码不能为空','check']
						])){
				return false;
			}
		}
		/*alert($("#login_inputCode").val() + " ||　" + $("#tempCode").val());
		if($("#login_inputCode").val() != $("#tempCode").val()) {
			alert("请输入正确的验证码");
			return false;
		}*/
		$("#btnLogin").attr("disabled", "disabled");
		Login.disableModule();
		Login.userName = $("#login_userName").val();
		var pwd = $("#login_password").val();
		var loginCallbackObject = new Login.loginCallbackObject();
		var url =  null;
		if( Login.role == Login.manager ){
			url = "/login.action";
		}else{
			url =  "/login.action";
		}
		//alert(Login.userName);
		new Net.ContentLoader(loginCallbackObject, url, "loginName=" + Login.userName + "&password=" + pwd + ($("#login_inputCode").size() > 0 ? "&login_inputCode=" + $("#login_inputCode").val() : ""), Net.type.xml);
    }
    
    Login.reloadImage = function (){
		$("#login_validateCode").attr("src", Validate.getValidateCodeImageUrl());
	}
	
    
	Login.disableModule = function (){
        $("#loginButton").disabled = true;
        if($("#login_inputCode").size() > 0){
			$("#login_inputCode").disabled = true;
        }	
    }
    Login.enableModule = function (){
        $("#loginButton").disabled = false;
        if($("#login_inputCode").size() > 0){
			$("#login_inputCode").disabled = false;
        }
    }
    Login.loginCallbackObject =function(){}
	
	Login.loginCallbackObject.prototype = new Net.Listener();
	
	Login.loginCallbackObject.prototype.callBack = function(data){
		var INEXISTENT_USER = '3';
    	var PASSWORD_ERROR = '2';
		var CODE_ERROR = '4';
		var SUCCESS = '1';
		var INVALID_USER = '5';
		var NO_PERMISSION = '6';	
		var xmlDoc = data;
		if(xmlDoc !=null){
			var result = xmlDoc.getElementsByTagName('result')[0].childNodes[0].nodeValue;
			var resultNode = $('#login_resultDiv')[0];
			if(result == SUCCESS){
				Login.printResult(resultNode, '登录成功，3秒后跳转到管理首页。', '#7CFC00');
				setTimeout(Login.repeat, 2000);
			}else{
				Login.printResult(resultNode, xmlDoc.getElementsByTagName('resultMessage')[0].childNodes[0].nodeValue, "#FA8072");	
				Login.reloadImage();
				Login.enableModule();
			}
		}
		$("#btnLogin").removeAttr("disabled");
	}
	
	//注册成功后调用的方法
	Login.repeat = function (){	
		Permission.bulidScript(Permission.scriptOnloadCallbackFunctionString);
    	Permission.setLogoutButton();
		//登陆成功后，重新执行一次方法
		if(Login.callbackFunctionString != null ){
			eval(Login.callbackFunctionString);
			Login.callbackFunctionString = null;
		}
		
    }
    
	Login.printResult = function (resultNode, message, backgroundColor){
		resultNode.innerHTML = message;
		resultNode.style.backgroundColor = backgroundColor;
	}

	Login.showUserName = function(){
		var userName = CookieUtil.getCookie("userName");
		if(userName != null){
			$("#welcomedUserName").html(userName).addClass("welcomedUserName");
		}		
	}

//----------------------------------logout.js------------------------

	var Logout = {};
	Logout.logoutSuccessContent = new String('\
		<div id="suggestionWindow" style="margin:20px;">\
			<fieldset>\
				<legend>系统提示：</legend>\
				<div style="text-align: center;margin-bottom:5px;margin: 30px, 0px;">\
					<p style="text-align: center;font-size: 16px;margin-bottom:5px;margin: 10px, 0px;">退出成功。</p>\
					<input class="bt" value="清理使用痕迹" name="clearSpoor" style="cursor: pointer;" type="button" onclick="Logout.clearSpoor();">\
					<input class="bt" value="保留使用痕迹" name="keepSpoor" style="cursor: pointer;" type="button" onclick="Logout.floatContainer.removeObj();">\
				</div>\
			</fieldset>\
		</div>\
	');
	Logout.logout = function(){
		var callbackObject = new Logout.logoutCallbackObject;
		new Net.ContentLoader(callbackObject, "/quickLogout.action", null, Net.type.ignore);
	}
	Logout.logoutCallbackObject = function(){
		top.location = '/login.jsp';
	}
	
	Logout.logoutCallbackObject.prototype = new Net.Listener();
	
	Logout.floatContainer = null;
	
	Logout.logoutCallbackObject.prototype.callBack = function(){
		Permission.bulidScript();
		Permission.setLoginButton();
		Logout.floatContainer = new FloatContainer("Logout.floatContainer", "退出成功", 400, 200, null, null, 15);
 		Logout.floatContainer.setHTML( Logout.logoutSuccessContent );	
	}
	Logout.clearSpoor = function(){
		CookieUtil.delAllCookie();
		window.location.reload();
	}
//--------------------------SelectModule.js------------------------------------
	function SelectModule(id, dataType, windowContent, treeJson, mode, selectedId, selectFunction, oldSelectName, container, isCancel){
		this.id = id;
		this.dataType = dataType;
		this.floatContainer = null;
		this.windowContent = windowContent;
		this.treeJson = treeJson;
		this.maxLevel = this.treeJson.level;
		this.currentMode = mode;
		this.selectFunction = selectFunction;
		this.selectedId = selectedId;
		this.oldSelectName = oldSelectName;
		this.container = container;
		this.selecteds = null; 
		this.isCancel = isCancel == true ? true : false;
	}
	
	SelectModule.needNotSelectLeaf = "needNotSelectLeaf";
	
	SelectModule.mustSelectLeaf = "mustSelectLeaf";
	
	SelectModule.prototype.initSelectModule = function(){
		this.selecteds = new Array();
		var cookieData = CookieUtil.getCookie(this.dataType);
		var parameter ={id:this.id, isCancel : this.isCancel, cookieData: cookieData == null ? cookieData : $.evalJSON(cookieData)};
		if(this.container == null){
			this.floatContainer = new FloatContainer(this.id + ".floatContainer", "请选择", 690, 480, null, null, 15);
			this.floatContainer.setHTML( this.windowContent.processUseCache(parameter));
		}else{
			var tempContainer = document.createElement("div");
			tempContainer.innerHTML = this.windowContent.processUseCache(parameter);
			this.container.appendChild(tempContainer);
		}
		var selector = "";
		for(var i = 0; i < this.maxLevel; i++){
			selector = selector + "<ul id='" + this.id + "level" + (i+1) + "' s></ul>"
		}
		$("#" + this.id + "Selector").html(selector);
		//创建第一层产品类型选择框
		this.buildSelectModule(this.treeJson.children, $("#" + this.id + "level1")[0]);
		var id = $("#" + this.selectedId).val();
		if(id != null){
			this.setSelectModule(id);
		}
		if(this.currentMode == SelectModule.needNotSelectLeaf){
			$("#" + this.id + "clearSelectedButton").attr("disabled", false);
		}
	}
	
	SelectModule.prototype.buildSelectModule = function( treeNodeArray, selectContent ){
		var tempLi = null;
		if(treeNodeArray == null){
			return; 
		}
		for(var i = 0; i < treeNodeArray.length; i++){
			tempLi = document.createElement("li");
			tempLi.id = this.id + "option" + treeNodeArray[i].id;
			tempLi.innerHTML = treeNodeArray[i].name;
			tempLi.onclick = new Function(this.id + ".selectorOnClickListener('" + treeNodeArray[i].id + "' , " + treeNodeArray[i].level + ")");
			if(treeNodeArray[i].children != null){
				tempLi.className = "isParent";
			}
			tempLi.style.cursor = "pointer";
			selectContent.appendChild(tempLi);
		}
	}
	
	SelectModule.prototype.selectorOnClickListener = function(id, level){
		if( this.selecteds[level] == null || this.selecteds[level].id != id ){
			this.reloadSelector( id, level );
			var currentTreeNode = this.getTreeNode(id, level);
			this.selecteds[level] = currentTreeNode;
			this.selecteds.length = level + 1;		
			if(currentTreeNode.children != null){			
				this.buildSelectModule(currentTreeNode.children, $("#" + this.id + "level" + (level + 1))[0]);
				this.reloadViewer(false, currentTreeNode.description);
			}else{		
				this.reloadViewer(true, currentTreeNode.description);
			}
			if(this.currentMode == SelectModule.mustSelectLeaf && currentTreeNode.children == null){
				$("#" + this.id + "submitButtonOfSelect").attr("disabled", false);
			}else if(this.currentMode == SelectModule.needNotSelectLeaf){
				$("#" + this.id + "submitButtonOfSelect").attr("disabled", false);
				$("#" + this.id + "clearSelectedButton").attr("disabled", false);
			}else{
				$("#" + this.id + "submitButtonOfSelect").attr("disabled", true);
			}
		}
	}
	
	SelectModule.prototype.reloadSelector = function(typeId, level){
		var tempList = null;
		if(level == 1){
			tempList = this.treeJson.children;
		}else{
			tempList = this.selecteds[level - 1].children;
		}
		for(var i = 0; i < tempList.length; i++){
			if(tempList[i].children != null){
				$("#" + this.id + "option" + tempList[i].id).addClass("isParent").removeClass("selected");
			}else{
				$("#" + this.id + "option" + tempList[i].id).removeClass("isParent").removeClass("selected");
			}
		}
		$("#" + this.id + "option" + typeId).addClass("selected");
		for(var i = level + 1; i <= this.maxLevel; i++){
			 $("#" + this.id + "level" + i).empty();
		}
	}
	
	SelectModule.prototype.getTreeNode = function(id, level){
		var tempList = null;
		var result = null;
		if(level == 1){
			tempList = this.treeJson.children;
		}else{
			tempList = this.selecteds[level - 1].children;
		}
		for(var i = 0; i < tempList.length; i++){
			if( tempList[i].id == id){
				result = tempList[i];
				break;
			}
		}
		return result;
	}
	
	
	SelectModule.prototype.reloadViewer = function(isLeaf, description){
		var result = "";
		for(var i = 1; i < this.selecteds.length-1; i++){
			result = result + this.selecteds[i].name + " - ";
		}
		if( !isLeaf ){
			result = result + this.selecteds[i].name + " - ...";
		}else{
			result = result + this.selecteds[i].name;
		}
		$("#" + this.id + "nowSelectedResult").html(result);
		if( description != null ){
			$("#" + this.id + "memo").show().html("说明：<span>" + description + "</span>");
		}else{
			$("#" + this.id + "memo").hide();
		}
	}
	
	SelectModule.prototype.select = function(){
		this.addCookie();
		this.close();
	}
	SelectModule.prototype.close = function(){
		if($("#" + this.selectedId).val() != this.selecteds[this.selecteds.length - 1].id){
			if($("#" + this.selectedId + "-name").size() > 0){
				$("#" + this.selectedId + "-name").html(this.selecteds[this.selecteds.length - 1].name);
			}
			if($("#" + this.selectedId).size() > 0){
				$("#" + this.selectedId).val( this.selecteds[this.selecteds.length - 1].id );
			}			
		}	
		if( this.selectFunction != null){
			this.selectFunction.call(this);
		}
		if(this.floatContainer != null){
			this.floatContainer.removeObj();
		}	
	}
	SelectModule.prototype.addCookie = function(){
		var cookieData = CookieUtil.getCookie(this.dataType);
		if(cookieData == null){
			cookieData = new Array();
		}else{
			cookieData =  $.evalJSON(cookieData);
		}
		var isHas = false;
		for(var i = 0; i < cookieData.length; i++ ){
			if(this.selecteds[this.selecteds.length - 1].id == cookieData[i].id){
				isHas = true;
				break;
			}
		}
		if(!isHas){
			cookieData[cookieData.length] = {id:this.selecteds[this.selecteds.length - 1].id, value: $("#" + this.id + "nowSelectedResult").html()};
			CookieUtil.addCookie(this.dataType, $.toJSON(cookieData), 30);
		}
	}
	SelectModule.prototype.commonUseOnchange = function(selectModle){
		var selectedId = selectModle.options[selectModle.selectedIndex].value;
		this.setSelectModule(selectedId);	
	}
	SelectModule.prototype.setSelectModule = function(id){
		var treeNodes = new Array();
		this.search(id, this.treeJson, treeNodes);
		for(var i = treeNodes.length - 1; i >= 0; i--){
			this.selectorOnClickListener(treeNodes[i].id, treeNodes[i].level);
		}
	}
	
	SelectModule.prototype.search = function(id, treeJson, treeNodes){
		var isSuccess = false;
		if(treeJson.id == id){		
			treeNodes[treeNodes.length] = treeJson;
			isSuccess = true;
			return isSuccess;
		}else{
			if(treeJson.children != null){
				for(var i = 0; i < treeJson.children.length; i++){
					isSuccess = this.search(id, treeJson.children[i], treeNodes);
					if(isSuccess == true){
						treeNodes[treeNodes.length] = treeJson.children[i];
						break;
					}
				}
			}
			return isSuccess;
		}
	}
	SelectModule.prototype.clearSelected = function(){
		if($("#" + this.selectedId + "-name").size() > 0){
			$("#" + this.selectedId + "-name").html(this.oldSelectName);
		}
		if($("#" + this.selectedId).size() > 0){
			$("#" + this.selectedId).val("");
		}
		if( this.selectFunction != null){
			this.selectFunction.call(this);
		}
		if(this.floatContainer != null){
			this.floatContainer.removeObj();
		}	
	}
	SelectModule.prototype.cancel = function(){
		if($("#" + this.selectedId + "-name").size() > 0){
			$("#" + this.selectedId + "-name").html(this.oldSelectName);
		}
		if($("#" + this.selectedId).size() > 0){
			$("#" + this.selectedId).val("");
		}
		if(this.floatContainer != null){
			this.floatContainer.removeObj();
		}	
	}
//-------------------------treeUtil.js-----------------------------
var TreeUtil = {};
TreeUtil.smooth = function(rootJson, isOnlyLeaf){
	var listJson = new Array();
	if(rootJson.children != null && rootJson.children.length > 0){
		if(!isOnlyLeaf){
			listJson = listJson.concat(rootJson);
		}
		for(var i = 0; i < rootJson.children.length; i++){
			listJson = listJson.concat(TreeUtil.smooth(rootJson.children[i], isOnlyLeaf));
		}
	}else{
		listJson = listJson.concat(rootJson);
	}
	return listJson;
}
//------------------------callback.js-------------------------
	var Callback = {};
	Callback.printCallbackForm = function(){
		return document.write("<input name=\"url\" id=\"url\" value=\"" + location.href + "\" type=\"hidden\">");
	}