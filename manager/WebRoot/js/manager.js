	var EditServiceProtocol = {};
	EditServiceProtocol.windowContent = new String('\
		<div style="text-align:center;" id="divServiceProtocol">\
		<fieldset class="modifySet">\
			<legend>服务协议</legend>\
			<div class="modifyItem">\
				<label for="serviceProtocol_id">协议编号：</label>\
				<input size="20" id="serviceProtocol_id" name="serviceProtocol_id" type="text" readonly="readonly"/>\
				<div class="clear"></div>\
			</div>\
			<div class="modifyItem">\
				<label for="serviceProtocol_startDate">起始日期：</label>\
				<input size="20" id="serviceProtocol_startDate" name="serviceProtocol_startDate" type="text" class="imeDisabled"/>\
				<div class="clear"></div>\
			</div>\
			<div class="modifyItem">\
				<label for="serviceProtocol_endDate">结束日期：</label>\
				<input size="20" id="serviceProtocol_endDate" name="serviceProtocol_endDate" type="text" class="imeDisabled"/>\
				<div class="clear"></div>\
			</div>\
			<div class="modifyItem">\
				<label for="serviceProtocol_contractDate">签订日期：</label>\
				<input size="20" id="serviceProtocol_contractDate" name="serviceProtocol_contractDate" type="text" class="imeDisabled"/>\
				<div class="clear"></div>\
			</div>\
			<div class="modifyItem">\
				<label for="serviceProtocol_context">内容：</label>\
				<textarea name="serviceProtocol_context" id="serviceProtocol_context"></textarea>\
				<div class="clear"></div>\
			</div>\
			<div class="modifyItem">\
				<label for="serviceProtocol_markup">备注：</label>\
				<textarea name="serviceProtocol_markup" id="serviceProtocol_markup"></textarea>\
				<div class="clear"></div>\
			</div>\
		</fieldset>\
	');
	EditServiceProtocol.windowContentModify = new String('\
		<input class="bt" value="确  定" style="cursor: pointer;" type="button" onclick="appendServiceProtocol()"/>\
        <input class="bt" value="重  置" name="resetButton" style="cursor: pointer;" type="button" onclick="javascript:EditServiceProtocol.reset()" />\
		</div>\
	');
	EditServiceProtocol.reset = function(){
		$("#serviceProtocol_startDate").val("");
		$("#serviceProtocol_endDate").val("");
		$("#serviceProtocol_contractDate").val("");
		$("#serviceProtocol_context").val("");
		$("#serviceProtocol_markup").val("");
	}
	EditServiceProtocol.windowContentView = new String('</div>');
	EditServiceProtocol.buildWindow = function(protocolId){
		var title = "";
		var htmlContent = "";
		if(arguments.length < 2){
			//添加或修改服务协议
			htmlContent = this.windowContent + this.windowContentModify;
			title = "编辑服务协议";
		} else {
			//查看服务协议
			htmlContent = this.windowContent + this.windowContentView;
			title = "查看服务协议";
		}
		EditServiceProtocol.floatContainer = new FloatContainer("EditServiceProtocol.floatContainer", title, 600, 380, null, null, 15);
		EditServiceProtocol.floatContainer.setHTML(htmlContent );
		$('#serviceProtocol_startDate').mask('9999-99-99');
		$('#serviceProtocol_endDate').mask('9999-99-99');
		$('#serviceProtocol_contractDate').mask('9999-99-99');
		$("#serviceProtocol_startDate").focus();
		this.onBuildWindowComplete(protocolId);
	}
	
	EditServiceProtocol.onBuildWindowComplete = function(protocolId){}
		
//start contract
	var EditLaborContract = {};
	EditLaborContract.windowContent = new String('\
			<div style="text-align:center;">\
			<fieldset class="modifySet">\
				<legend>编辑劳动合同</legend>\
				<div class="modifyItem">\
					<label for="serviceProtocol.id">合同编号：</label>\
					<input size="20" name="laborContract_id" id="laborContract_id" type="text" readonly="readonly"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.contactInfo">起始日期：</label>\
					<input size="20" name="laborContract_startDate" id="laborContract_startDate" type="text" value="" class="imeDisabled"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.email">结束日期：</label>\
					<input size="20" name="laborContract_endDate" id="laborContract_endDate" type="text" value="" class="imeDisabled"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.contactAddr">签订日期：</label>\
					<input size="20" name="laborContract_contractDate" id="laborContract_contractDate" type="text" value="" class="imeDisabled"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.contactAddr">试用期起日：</label>\
					<input size="20" name="laborContract_probationStartDate" id="laborContract_probationStartDate" type="text" value="" class="imeDisabled"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.contactAddr">试用期止日：</label>\
					<input size="20" name="laborContract_probationEndDate" id="laborContract_probationEndDate" type="text" value="" class="imeDisabled"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.contactAddr">工作岗位：</label>\
					<input size="20" name="laborContract_workQuarters" id="laborContract_workQuarters" type="text" value=""/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.contactAddr">试用期工资：</label>\
					<input size="20" name="laborContract_probationSalary" id="laborContract_probationSalary" type="text" value="" class="imeDisabled"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="company.contactAddr">正式工资：</label>\
					<input size="20" name="laborContract_salary" id="laborContract_salary" type="text" value="" class="imeDisabled"/>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="serviceProtocol_markup">内容：</label>\
					<textarea name="laborContract_context" id="laborContract_context"></textarea>\
					<div class="clear"></div>\
				</div>\
				<div class="modifyItem">\
					<label for="serviceProtocol_markup">备注：</label>\
					<textarea name="laborContract_markup" id="laborContract_markup"></textarea>\
					<div class="clear"></div>\
				</div>\
			</fieldset>\
		');
	
	EditLaborContract.windowContentModifyContract = new String('\
		<input class="bt" value="确  定" style="cursor: pointer;" type="button" onclick="appendLaborContract();" />\
		<input class="bt" value="重  置" name="resetButton" style="cursor: pointer;" type="reset" />\
		</div>\
	');
	EditLaborContract.windowContentView = new String('</div>');
		
	EditLaborContract.buildWindow = function(contractId){
		var title = "";
		var htmlContent = "";
		if(arguments.length < 2){
			//添加或修改服务协议
			htmlContent = this.windowContent + this.windowContentModifyContract;
			title = "编辑劳动合同";
		} else {
			//查看服务协议
			htmlContent = this.windowContent + this.windowContentView;
			title = "查看劳动合同";
		}
		EditLaborContract.floatContainer = new FloatContainer('EditLaborContract.floatContainer', title, 600, 450, null, null, 15);
		EditLaborContract.floatContainer.setHTML( htmlContent);
		$('#laborContract_startDate').mask('9999-99-99');
		$('#laborContract_endDate').mask('9999-99-99');
		$('#laborContract_contractDate').mask('9999-99-99');
		$('#laborContract_probationStartDate').mask('9999-99-99');
		$('#laborContract_probationEndDate').mask('9999-99-99');
		$("#laborContract_startDate").focus();
		EditLaborContract.onBuildWindowComplete(contractId);
	};
	
	//EditLaborContract.onBuildWindowComplete = function(contractId){alert(1);}
//end contract	
			
	var InsEmplListWindow = {};
	InsEmplListWindow.show = function(id){
		InsEmplListWindow.floatContainer = new FloatContainer('InsEmplListWindow.floatContainer', '参保人名单', 600, 450, null, null, 15);
		InsEmplListWindow.floatContainer.setHTML( '<iframe id="insEmplListWindowFrame" name="insEmplListWindowFrame" src="listInsEmpl.html?insuranceId=' + id + '" frameborder="0" width="100%" height="430" ></iframe>' );
	};
	
	var ServiceLogWindow = {};
	ServiceLogWindow.show = function(id){
		ServiceLogWindow.floatContainer = new FloatContainer('ServiceLogWindow.floatContainer', '服务类型修改历史', 600, 450, null, null, 15);
		ServiceLogWindow.floatContainer.setHTML( '<iframe id="serviceLogWindowFrame" name="serviceLogWindowFrame" src="/employ/viewServiceChangeList.html?id=' + id + '" frameborder="0" width="100%" height="430" ></iframe>' );
	};

	var PensionHistoryListWindow = {};
	PensionHistoryListWindow.show = function(id){
		if(id == '' || id == undefined)
			return;
		PensionHistoryListWindow.floatContainer = new FloatContainer('PensionHistoryListWindow.floatContainer', '社保基数修改历史', 600, 450, null, null, 15);
		PensionHistoryListWindow.floatContainer.setHTML( '<iframe id="pensionHistoryListWindowFrame" name="pensionHistoryListWindowFrame" src="/employ/viewPensionHistoryList.html?id=' + id + '" frameborder="0" width="100%" height="430" ></iframe>' );
	};
	
	var FundHistoryListWindow = {};
	FundHistoryListWindow.show = function(id){
		if(id == '' || id == undefined)
			return;
		FundHistoryListWindow.floatContainer = new FloatContainer('FundHistoryListWindow.floatContainer', '公积金基数修改历史', 600, 450, null, null, 15);
		FundHistoryListWindow.floatContainer.setHTML( '<iframe id="fundHistoryListWindowFrame" name="fundHistoryListWindowFrame" src="/employ/viewFundHistoryList.html?id=' + id + '" frameborder="0" width="100%" height="430" ></iframe>' );
	};
	
	var ProcessInsEmploy = {};
	ProcessInsEmploy.windowContent = new String('\
			<div style="text-align:center;">\
				<fieldset class="modifySet">\
					<legend>搜索就业人员</legend>\
					<div class="modifyItem">\
						<label for="identityId">身份证号码：</label>\
						<input size="18" name="identityId" id="identityId" type="text" value="" />\
						<div class="clear"></div>\
					</div>\
				</fieldset>\
		        <input class="bt" value="搜索" style="cursor: pointer;" type="submit" onclick="ProcessInsEmploy.searchEmploy();" />\
		        <div id="searchEmployError" style="display:none;text-align:center; padding: 10px; margin-top:10px;background-color:#F00">找不到对应的就业人员，请确认身份证是否有误。</div>\
			</div>\
		');
	
	ProcessInsEmploy.buildWindow = function(isAdd){
		ProcessInsEmploy.isAdd = isAdd;
		ProcessInsEmploy.floatContainer = new FloatContainer('ProcessInsEmploy.floatContainer', '搜索就业人员', 300, 250, null, null, 15);
		ProcessInsEmploy.floatContainer.setHTML( ProcessInsEmploy.windowContent );
		$('#identityId').focus();
	};
	
	ProcessInsEmploy.searchEmploy = function(){		
		var callbackObject = new ProcessInsEmploy.SearchEmployCallbackObject();		
		new Net.ContentLoader(callbackObject ,'searchEmploy.html?identityId=' + $('#identityId').val() + '&isAdd='+ProcessInsEmploy.isAdd+'&batchId=' + $('#batchId').val(), null, Net.type.json);
	};
	
	ProcessInsEmploy.SearchEmployCallbackObject = function(){}
	
	ProcessInsEmploy.SearchEmployCallbackObject.prototype = new Net.Listener();
	
	ProcessInsEmploy.SearchEmployCallbackObject.prototype.callBack = function(json){
		var employ = json;
		if(employ != null){			
			if(ProcessInsEmploy.isAdd){
				if($('#addEmplList').val() != ''){
					$('#addEmplList').val($('#addEmplList').val() + ',' + employ.id);
				}else{
					$('#addEmplList').val(employ.id);
				}
				if($('#addEmplName').html() != ''){
					$('#addEmplName').html($('#addEmplName').html() + ',' + employ.name);
				}else{
					$('#addEmplName').html(employ.name);
				}
			}else{
				if($('#subEmplList').val() != ''){
					$('#subEmplList').val($('#subEmplList').val() + ',' + employ.id);
				}else{
					$('#subEmplList').val(employ.id);
				}	
				if($('#subEmplName').html() != ''){
					$('#subEmplName').html($('#subEmplName').html() + ',' + employ.name);
				}else{
					$('#subEmplName').html(employ.name);
				}
			}			
			ProcessInsEmploy.floatContainer.removeObj();
		}else{
			$('#searchEmployError').show();
		}
	};
	
	var changeRole = function(userName, role){
		var callbackObject = new Net.Listener();
		new Net.ContentLoader(callbackObject, "changeRole.html?userName=" + userName + "&role=" + role, null, Net.type.ignore);
	};
	
	var changePasswordContent = new String('\
		<div id="userCenterMain" >\
			<div class="modifyUserItem" style="width:100%;">\
				<label for="newPassword">　　　　　　新密码：</label><input size="20" name="newPassword" id="newPassword" type="password"><span  style="color:red">*</span><span  style="padding-left:20px;color:red">密码6-12位</span>\
			</div>\
			<div class="modifyUserItem" style="width:100%;">\
				<label for="reNewPassword">　请再次输入新密码：</label><input size="20" name="reNewPassword" id="reNewPassword" type="password"><span  style="color:red">*</span>\
			</div>\
			<div id="changePasswordButtonDiv" style="text-align:center;">\
				<input class="bt" value="提交" id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="changePassword();">\
			</div>\
		</div>\
	');
	var showChangePasswordContainer = function(loginName){
		showChangePasswordContainer.loginName = loginName;
		showChangePasswordContainer.floatContainer = new FloatContainer("showChangePasswordContainer.floatContainer", "修改用户密码", 350, 200);
		showChangePasswordContainer.floatContainer.setHTML( changePasswordContent );
	}
	var changePassword = function(){
		if(!Check.auto_check_form(
	                 [
						['newPassword','新密码不能为空','check'],
						['reNewPassword','请再次输入新密码','check'],
						['newPassword','密码由6-12个字符组成','between','6','12'],
						['newPassword','二次密码不相符','userPass','reNewPassword']
					  ])){
			return false;
		}else{
			var callbackObject = new changePassword.CallbackObject();
			new Net.ContentLoader(callbackObject, "/user/changePassword.action?userId=" + showChangePasswordContainer.loginName + "&password=" + $("#newPassword").val(), null, Net.type.ignore);
		}
	}
	changePassword.CallbackObject = function(){}
	
	changePassword.CallbackObject.prototype = new Net.Listener();
	
	changePassword.CallbackObject.prototype.callBack = function(){
	showChangePasswordContainer.floatContainer.setHTML( "<p>密码修改成功</p>" );
	}
	
	var abateUser = function(loginName){
		var callbackObject = new Net.Listener();
		new Net.ContentLoader(callbackObject, "abateUser.action?loginName=" + loginName, null, Net.type.ignore);
	}
	var showAddUserContent = new String('\
			<div id="userCenterMain" >\
				<div class="modifyUserItem" style="width:100%;">\
					<label for="register_userName">　用户名：</label><input size="20" name="register_userName" id="register_userName" type="text" onchange="Register.checkAccount();"><span  style="color:red">*</span>\
				</div>\
				<div style="text-align: center;margin-bottom:5px;display:none;" id="register_checkAccountResultDiv"></div>\
				<div class="modifyUserItem" style="width:100%;">\
					<label for="register_userPass">　　密码：</label><input size="20" name="register_userPass" id="register_userPass" type="password"><span  style="color:red">*</span><span  style="padding-left:20px;color:red">密码6-12位</span>\
				</div>\
				<div class="modifyUserItem" style="width:100%;">\
					<label for="register_role">　角色权限：</label><input size="20" name="register_role" id="register_role" type="text" onchange=""><span  style="color:red">*</span>\
				</div>\
				<div id="changePasswordButtonDiv" style="text-align:center;">\
					<input class="bt" value="提交" id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="addUser();">\
				</div>\
			</div>\
		');
	var showAddUserContainer = function(object){
		showAddUserContainer.object = object;
		showAddUserContainer.floatContainer = new FloatContainer("showAddUserContainer.floatContainer", "创建用户", 350, 200);
		showAddUserContainer.floatContainer.setHTML( showAddUserContent );
	}
	var addUser = function(){
		if(!Check.auto_check_form(
	                 [
						['register_userName','用户名不能为空','check'],
						['register_userPass','密码不能为空','between','6','12']
					  ])){
			return false;
		}else{
			var callbackObject = new addUser.CallbackObject();
			new Net.ContentLoader(callbackObject, "addUser.html?userName=" + $("#register_userName").val() + "&newPassword=" + $("#register_userPass").val(), null, Net.type.ignore);
		}
	}
	addUser.CallbackObject = function(){}
	
	addUser.CallbackObject.prototype = new Net.Listener();
	
	addUser.CallbackObject.prototype.callBack = function(){
		if(showAddUserContainer.object != null){
			$(showAddUserContainer.object.parentNode.parentNode).children().eq(0).text($("#register_userName").val());
			showAddUserContainer.object.onclick = function(event){
				showChangePasswordContainer($("#register_userName").val());
			};
			$(showAddUserContainer.object).text('修改帐号密码');
		}
		showAddUserContainer.floatContainer.setHTML( "<p>用户创建成功</p>" );
	}
	
	//start viewCompany
	var ViewCompany = {};
	ViewCompany.buildWindow = function(companyId){
		var htmlContent = '<iframe width="940" height="100%" frameborder="0" scrolling="auto" src="viewCompany.html?id=' + companyId + '"></iframe>';
		ViewCompany.floatContainer = new FloatContainer("ViewCompany.floatContainer", "查看企业", 942, 460, null, null, 15);
		ViewCompany.floatContainer.setHTML(htmlContent);
		
		this.onBuildWindowComplete(companyId);
	}
	
	ViewCompany.onBuildWindowComplete = function(companyId){}
	//end viewCompany
	
	//start viewEmploy
	var ViewEmployee = {};
	ViewEmployee.buildWindow = function(employeeId){
		var htmlContent = '<iframe width="940" height="100%" frameborder="0" scrolling="auto" src="viewEmploy.html?id=' + employeeId + '"></iframe>';
		ViewEmployee.floatContainer = new FloatContainer("ViewEmployee.floatContainer", "查看就业人员", 942, 460, null, null, 15);
		ViewEmployee.floatContainer.setHTML(htmlContent);
		
		this.onBuildWindowComplete(employeeId);
	}
	
	ViewEmployee.onBuildWindowComplete = function(employeeId){}
	//end viesEmploy

	/**start exchangeGift*/
	var exchangeGiftContent = new String('\
		<div id="userCenterMain" >\
			<div class="modifyUserItem" style="width:100%;">\
				<label for="newPassword">　兑换数量：</label><input size="20" name="giftCount" id="giftCount" type="text" onchange="changeSpanScore();"><span  style="color:red">*</span><span  style="padding-left:20px;color:red">必须为数字</span>\
			</div>\
			<div class="modifyUserItem" style="width:100%;">\
				<label for="reNewPassword">　花费积分：</label><span  style="color:red" id="spanScore"></span>\
			</div>\
			<div id="exchangeGiftButtonDiv" style="text-align:center;">\
				<input class="bt" value="提交" id="submitButton" name="submitButton" style="cursor: pointer;" type="button" onclick="this.disabled=true;exchangeGift();">\
			</div>\
		</div>\
	');
	var showexchangeGiftContainer = function(giftId, memberScore, score, reserve){
		showexchangeGiftContainer.id = giftId;
		showexchangeGiftContainer.totalScore = memberScore;
		showexchangeGiftContainer.score = score;
		showexchangeGiftContainer.reserve = reserve;
		showexchangeGiftContainer.floatContainer = new FloatContainer("showexchangeGiftContainer.floatContainer", "兑换礼品", 350, 200);
		showexchangeGiftContainer.floatContainer.setHTML( exchangeGiftContent );
	}
	var exchangeGift = function(){
		if(!Check.auto_check_form(
	                 [
						['giftCount','兑换数量不能为空','check'],
						['giftCount','兑换数量必须为数字','isNUm'],
					  ])){
			$("#submitButton").attr("disabled", "");
			return false;
		}else{
			if(!vaildateGiftCount()) {
				$("#submitButton").attr("disabled", "");
				return false;
			}
			var callbackObject = new exchangeGift.CallbackObject();
			showexchangeGiftContainer.giftCount = $("#giftCount").val();
			new Net.ContentLoader(callbackObject, "/member/exchangeGift.action?id=" + showexchangeGiftContainer.id + "&giftCount=" + $("#giftCount").val(), null, Net.type.ignore);
		}
	}
	var vaildateGiftCount = function() {
		var total = $("#giftCount").val();
		if($.trim(total) == "") {
			alert("兑换数量不能为空");
			return false;
		}
		var reg = /^[1-9]+(.[0-9]{0,9})?$/;
		if(!reg.test($.trim(total))) {
			alert("兑换数量必须为数字并且要大于0");
			return false;
		}
		//alert(showexchangeGiftContainer.reserve);
		if(total*1 > showexchangeGiftContainer.reserve) {
			alert("兑换数量必须小于库存量:" + showexchangeGiftContainer.reserve);
			return false;
		}
		if(showexchangeGiftContainer.totalScore - showexchangeGiftContainer.score * total < 0) {
			alert("超出用户积分");
			return false;
		}
		return true;
	}
	
	var changeSpanScore = function() {
		var total = $("#giftCount").val();
		if(!vaildateGiftCount()) {
			return false;
		}
		var spanCount = total * showexchangeGiftContainer.score;
		$("#spanScore").text(spanCount);
	}
	exchangeGift.CallbackObject = function(){}
	
	exchangeGift.CallbackObject.prototype = new Net.Listener();
	
	exchangeGift.CallbackObject.prototype.callBack = function(){
		showexchangeGiftContainer.floatContainer.setHTML( "<p style='margin-left:100px;margin-top:70px;color:#FF0000;font-size:20px;vertical-align:middle;'>积分兑换成功</p>" );
		window.location = '/member/exchangeGiftSuccess.action?giftCount='+showexchangeGiftContainer.giftCount + '&spanScore=' + (showexchangeGiftContainer.giftCount * showexchangeGiftContainer.score)+"&balanceScore="+(showexchangeGiftContainer.totalScore - showexchangeGiftContainer.score * showexchangeGiftContainer.giftCount);
	}
	/**end exchangeGift*/
