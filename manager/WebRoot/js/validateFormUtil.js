String.prototype.trim=function() { return this.replace(/(^\s*) |(\s*$)/g,""); };

/** ********************************************************************* */
/* 验证表单的js */
/** ********************************************************************* */
function auto_check_form(input_arry){
	for(var num in input_arry){
		var isShowAlert = false;
		//alert(input_arry[num][2]);
		switch(input_arry[num][2]){
	 		// 验证是否有填入
		case "check":
			if(!isNotBlank(getFieldElement(input_arry[num][0])))
        	   isShowAlert = true;
           break;
		case "maxnum":// 最大字符数
			if(!maxNum(getFieldElement(input_arry[num][0]),input_arry[num][3]))
        	   isShowAlert = true;
           break;
		case "between":// 在二者之间的字符数
			if(!numBetween(getFieldElement(input_arry[num][0]),input_arry[num][3],input_arry[num][4]))
				isShowAlert = true;
			break;
		case "radio": // 验证radiobox
			if(!radio(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
            break;
		case "year":  // 验证四位年份
			if(!isYear(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "month":  // 验证月份
			if(!isMonth(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "email":  // 验证Email
			if(!isEmail(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "phone":  // 验证电话
			if(!isPhone(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "zip":  // 验证邮编
			if(!isZip(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "int":  // 验证开头不是0的整数
			if(!isIntExceptZero(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
	    case "into":  // 验证开头可以是0的整数
	    	if(!isInt(getFieldElement(input_arry[num][0])))
	    		isShowAlert = true;
	       break;
		case "float":  // 验证浮点数
			if(!isFloat(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "samedate": // 比较两个日期是否一致
			if(!isSameDate(getFieldElement(input_arry[num][0]),getFieldElement(input_arry[num][3])))
				isShowAlert = true;
			break;
		case "fulldate": // 验证日期
			if(!isFullDate(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "http": // 验证URL
			if(!isHttp(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "mobile": // 验证手机号
			if(!isMobile(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "pwd": // 验证二次密码
			if(!isSamePwd(getFieldElement(input_arry[num][0]),getFieldElement(input_arry[num][3])))
				isShowAlert = true;
			break;
		case "china": 
           if(isChinese(getFieldElement(input_arry[num][0])))
        	   isShowAlert = true;
	       break;
		case "matchPicFileName":// 是否符合图片文件名的后缀
           if(!matchPicFileName(getFieldElement(input_arry[num][0])))
		   		isShowAlert = true;
            break;
		case "matchMovieFileName":// 是否符合视频文件名的后缀
		   if(!matchMovieFileName(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "idcard": // 验证身份证号码
			if(!isIdCardNo(getFieldElement(input_arry[num][0])))
				isShowAlert = true;
			break;
		case "phoneOrMoblie": // 验证手机或固话
		  if(!isMobile(getFieldElement(input_arry[num][0])) && !isPhone(getFieldElement(input_arry[num][0]))) 
		   		isShowAlert=true;
	       	break;
		case "maxDate" :	//验证日期大小
			if(!maxDate(getFieldElement(input_arry[num][0]),getFieldElement(input_arry[num][3])))
				isShowAlert=true;
			break;
		case "isNum" :	//验证是否为数字
			if(!isNum(getFieldElement(input_arry[num][0])))
				isShowAlert=true;
			break;
		case "isActiveDate" :	//验证是否为正确的日期
			if(!isActiveDate(getFieldElement(input_arry[num][0])))
				isShowAlert=true;
			break;
        }
        if(isShowAlert){// 验证提示处理
        	alert(input_arry[num][1]);
        	// 如果是隐藏的就不要获得焦点
        	if(input_arry[num][3] == "hi" || getFieldElement(input_arry[num][3])=="hi"){ 
        		return false;
        	} else {
        		getFieldElement(input_arry[num][0]).focus();
        		return false;
        	}
        } 
	}
	return true;// 验证通过返回真；
}

//判断两个元素的日期是否一样,case "samedate"
function isSameDate(elementLeft, elementRight) {
	if(elementLeft.value.trim() == "" || elementRight.value.trim() == "")
		return true;
	var array1 = elementLeft.value.replace(/[\-\/\.]/gi,"-").split("-");
	var array2 = elementRight.value.replace(/[\-\/\.]/gi,"-").split("-");
    var year1=array1[0];
    var month1=array1[1];
    var day1=array1[2];
    var year2=array2[0];
    var month2=array2[1];
    var day2=array2[2];
    if(year1 == year2 && month1 == month2 && day1 == day2)
    	return true;
    return false;
}

//是否为空,case "check"
function isNotBlank(element){
	var pattern = new RegExp("[^\b|  ]","gi");
    if ( !pattern.test(element.value.trim())) return false;
    return true;
}

// 最大字符数,case "maxnum"
function maxNum(element, num){
	if(element.value.trim() == "") return true;
	if (parseInt(element.value.length) > parseInt(num)) return false;
	return true;
}

// 在二者之间，去除前后空字符, case "between"
function numBetween(element, left, right){
	var length = element.value.trim().length;
    if( length >= parseInt(left) && length <= parseInt(right))return true;
    return false;
}

//判断radio元素是否已经被选中, case "radio"
function radio(element){
	return element.checked;
}  

//验证是否正确的年份,case "year"
function isYear(element)  {  
	if(element.value.trim() == "") return true;
    var reg =/^([1-9]{1})\d{3}$/;
    if( reg.test(element.value.trim())) return true;
    return false;
}
	
//验证是否正确的月,case "month"
function isMonth(element){
	if(element.value.trim() == "") return true;
    var reg = /^(0?[1-9]|1?[0-2])$/;
    if( reg.test(element.value.trim())) return true;
    return false;
}

//验证是否正确的日,case "day"
function isDay(element){
	if(element.value.trim() == "") return true;
    var reg = /^(0?[1-9]|[1-2]?[0-9]|3?[0-1])$/;
    if( reg.test(element.value.trim())) return true;
    return false;
}

//验证是否符合日期格式,case "fulldate"
function isFullDate(element){  
	if(element.value.trim() == "") return true;
	var r = element.value.trim().match(/^([1-9]{1}\d{3})(-)(\d{1,2})\2(\d{1,2})$/);
    if(r == null) return false; 
	var d = new Date(r[1], r[3]-1, r[4]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}

//验证Email,case "email"
function isEmail(element){   
	if(element.value.trim() == "") return true;
	var reg =/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if( reg.test(element.value.trim())) return true;
	return false;
}

//验证电话,case "phone"
function isPhone(element){
	if(element.value.trim() == "") return true;
	//var reg =/^(\d{3,4}\-)*([1-9]{1})(\d{6,7})$/;
	var reg = /(\(\d{3,4}\)|\d{3,4}-)?(\d{7,8}|(\d{7,8}-)(\d{3,4}))$/;
	if( reg.test(element.value.trim())) return true;
	return false;
}

//验证邮编,case "zip"
function isZip(element){
	if(element.value.trim() == "") return true;
	var reg =/^([1-9]{1})(\d{5})$/;
	if( reg.test(element.value.trim())) return true;
	return false;
}

//验证不为0的整数,case "int"
function isIntExceptZero(element){
	if(element.value.trim() == "") return true;
	var reg =/^([1-9]{1})\d*$/;
	if( reg.test(element.value.trim())) return true;
	return false;
}

//验证整数,case "into"
function isInt(element){
	if(element.value.trim() == "") return true;
	var reg =/^([0-9]{1})\d*$/;
	if( reg.test(element.value.trim())) return true;
	return false;
}

//验证浮点数,case "float"
function isFloat(element){
	if(element.value.trim() == "") return true;
	var reg =/^[0-9]+.?[0-9]*$/;
	if( reg.test(element.value.trim())) return true;
    return false;
}

//验证手机号,case "mobile"
function isMobile(element){
	var value = element.value.trim();
	if(value == "") return true;
    var reg1 =/^0?(13[0-9]{1})\d{8}$/;
    var reg2 =/^0?(15[0-9]{1})\d{8}$/;
    if( reg1.test(value) || reg2.test(value)) return true;
    return false;
}

//验证URL,case "http"
function isHttp(element){
	if(element.value.trim() == "") return true;
	var reg = /^(http:\/\/)?[w]{3}\.[\w]+\.[\w]{2,3}$/;
	if( reg.test(element.value.trim())) return true;
    return false;
}

//验证二次密码,case "pwd"
function isSamePwd(leftElement,rightElement){
	if(leftElement.value.trim() == "" || rightElement.value.trim() == "") return true;
	return(leftElement.value.trim() == rightElement.value.trim());
}

//验证是否为汉字,case "china"
function isChinese(element){
	if(element.value.trim() == "") return true;
	var reg = /[^\x00-\xff]/;
	if( reg.test(element.value.trim())) return true;
    return false;
}

function keyIsNumber(KeyCode)  //
{
    // 如果输入的字符是在0-9之间，或者是backspace、DEL键,小数点
    if(((KeyCode>47)&&(KeyCode<58))||(KeyCode==8)||(KeyCode==46)||(KeyCode==190)||((KeyCode>95)&&(KeyCode<106))||(KeyCode==110)||(KeyCode==9))
    {
          return true;
    }
    else
    {
          return false;
     }
}

/**
 * 是否符合图片文件名的后缀
 */
function matchPicFileName(element){
	if(element.value.trim() == "") return true;
	var imgpostfix = new Array('.gif','.png','.jpg','.jpeg','.bmp');
	if( element.value.trim() != ''){
		for(var i = 0; i < imgpostfix.length; i++){
			if(element.value.trim().toLowerCase().lastIndexOf(imgpostfix[i])  > 0){
				return true;	
			}
		}
		return false;
	}
	return true;
}

/**
 * 是否符合视频文件的后缀
 */
function matchMovieFileName(element) {
	if(element.value.trim() == "") return true;
	var moviepostfix = new Array('.rm','.rmvb','.wma','.wmv','.mpg', '.mpeg', '.avi');
	var filename = element.value.trim();
	if( filename != ''){
		for(var i = 0; i < moviepostfix.length; i++){
			if(filename.toLowerCase().lastIndexOf(moviepostfix[i])  > 0){
				return true;	
			}
		}
	    return false;
	}
	return false;
}

// 验证身份证号码
function isIdCardNo(txt) {
	if(txt.value.trim() == "") return true;
    var factorArr = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
    var error;
    var varArray = new Array();
    var intValue;
    var lngProduct = 0;
    var intCheckDigit;
    var intStrLen = txt.value.length;
    var idNumber = txt.value;    
    if ((intStrLen != 15) && (intStrLen != 18)) {
        return false;
    }    
    // check and set value
    for(i=0;i<intStrLen;i++) {
        varArray[i] = idNumber.charAt(i);
        if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
            return false;
        } else if (i < 17) {
            varArray[i] = varArray[i]*factorArr[i];
        }
    }
    if (intStrLen == 18) {
        // check date
        var date8 = idNumber.substring(6,14);
        if (checkDate(date8) == false) {
            return false;
        }        
        for(i=0;i<17;i++) {
            lngProduct = lngProduct + varArray[i];
        }        
        intCheckDigit = 12 - lngProduct % 11;
        switch (intCheckDigit) {
            case 10:
                intCheckDigit = 'X';
                break;
            case 11:
                intCheckDigit = 0;
                break;
            case 12:
                intCheckDigit = 1;
                break;
        }        
        if (varArray[17].toUpperCase() != intCheckDigit) {
            return false;
        }
    } 
    else{        // length is 15
        var date6 = idNumber.substring(6,12);
        if (checkDate(date6) == false) {
            return false;
        }
    }
    return true;
}

//判断日期格式是不是符合
function checkDate(value){
	return true;
	var strDate=value;
	re=/\d{4}\d{2}\d{2}/g;
	// 判断日期格式符合YYYY/MM/DD标准
	if(re.test(strDate)){
		var DateArray = new Array();
		DateArray[0] = strDate.substring(0, 4);
		DateArray[1] = strDate.substring(4, 6);
		DateArray[2] = strDate.substring(6, 8);
		
		var dateElement=new Date(DateArray[0],parseInt(DateArray[1])-1,DateArray[2]);
		// 判断日期逻辑
		if(!((dateElement.getFullYear()==parseInt(DateArray[0]))&&((dateElement.getMonth()+1)==parseInt(DateArray[1]))&&(dateElement.getDate()==parseInt(DateArray[2])))){
			return false;
		} 
	} else{
		return false;
	}
	
	return true;

}

//数据两个日期大小
function maxDate(element, startDate) {
	if(element.value.trim() == "" && startDate.value.trim() == "") return true;
	var start = startDate.value.replace(/-/g,"/");
	var end = element.value.replace(/-/g,"/");
	if(Date.parse(end) - Date.parse(start) >= 0){   
		return true;   
	}
	return false;
}

//数据是否数字
function isNum(element) {
	if(element.value.trim() == "") return true;
	var reg = /^[0-9]+(.[0-9]{0,9})?$/;
	if( reg.test(element.value.trim())) return true;
	return false;
}

//判断是否正确的日期，并且时间在1900--2078之间
function isActiveDate(element) {
	if(element.value.trim() == "") return true;
	var reg = new RegExp("^(?:(?:([0-9]{4}(-|\/)(?:(?:0?[1,3-9]|1[0-2])(-|\/)(?:29|30)|((?:0?[13578]|1[02])(-|\/)31)))|([0-9]{4}(-|\/)(?:0?[1-9]|1[0-2])(-|\/)(?:0?[1-9]|1\\d|2[0-8]))|(((?:(\\d\\d(?:0[48]|[2468][048]|[13579][26]))|(?:0[48]00|[2468][048]00|[13579][26]00))(-|\/)0?2(-|\/)29))))$");
	if(element.value.trim().substr(0, 4) < 1900 || element.value.trim().substr(0, 4) > 2078) {
		return false;
	}
	return reg.test(element.value.trim());
}

function getFieldElement(elementId)
{
    return document.getElementById(elementId);
}