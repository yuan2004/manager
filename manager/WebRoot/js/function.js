//*****************************************************************************************************
//*���ƣ�Trim(str)
//*���ܣ�ɾ���ַ���ǰ��Ŀ��ַ��������ո��TAB��
//*������
//*		str��Ҫ������ַ���
//*���أ��������ַ���
//*˵����
//*���ߣ�
//*****************************************************************************************************
function Trim(str) {
   var intLength        //
   var charSpace = " "  //�ո��ַ�
   var Achar            //
   
   str = str.toString()
       
   //ɾ����ߵĿո�
   do {
      if (str.length == 0) {
         return ""
      }
      Achar = str.charAt(0)
      if (Achar == charSpace) {
         if (str.length > 1) {
            str = str.substr(1)
         }
         else {
            return ""
         }
      }  
      else
      {
         break
      }
   } while(true)
   
   //ɾ���ұߵĿո�
   do {
      intLength = str.length
      if (intLength == 0) {
         return ""
      }
      Achar = str.charAt(intLength - 1)
      if (Achar == charSpace) {
         if( intLength > 1) {
            str = str.substr(0,intLength - 1)
         }
         else {
           return ""
         }
      }
      else
      {
         break
      }
   } while(true)  
   
   return str 
}

//------------------------------------------------------------
//����ֻ������������ֵ
//------------------------------------------------------------
function OnlyInteger()
{
	if(event.keyCode==45)	return;
	if(event.keyCode<48 || event.keyCode>57)	event.keyCode=0;
}
//------------------------------------------------------------
//����ֻ��������ֵ
//------------------------------------------------------------
function OnlyNumber()
{
	if(event.keyCode==45)	return;
	if((event.keyCode<48 || event.keyCode>57) && (event.keyCode!=46))	event.keyCode=0;
}

function isNotNull(newValue)
{
	if(newValue==null || newValue=="undefined") return false;
	
    var str = Trim(newValue);

    if ( newValue == '' )
    {
        return false;
    }

    for (var i = 0; i < str.length; i ++)
    {
       if ( str.substr(i,1) != " " )
       {
           return true;
       }
     }
    return false;
}

function checkName(description, object)
{
    if ( isNotNull(object.value) == false )
    {
    	alert('������ ' + description + '!' );
    	return false;
    }
    else
    	return true;
}

function checkSelect(description, object)
{
    if (object.options.length ==0 || object.options[object.options.selectedIndex].value == "0" || object.options[object.options.selectedIndex].value == "" )
    {
    	alert('��ѡ�� ' + description + '!' );
    	return false;
    }
    else
    	return true;

}

function truncate(rValue, rStr)
{
    var str = rValue;
    var tmpstr = str;

    if ( rValue == '' )
    {
        return rValue;
    }

    for (var i = 0; i < str.length; i ++)
    {
       if ( str.substr(i,1) != rStr )
       {
           return tmpstr;
       }
       tmpstr = str.substring(i+1);
    }

    return tmpstr;
}

function ltrim(rValue)
{
	var str = rValue;
    var tmpstr = str;

    if ( rValue == '' )
    {
        return rValue;
    }

    for (var i = 0; i < str.length; i ++)
    {
       if ( str.substr(i,1) != " " )
       {
           return tmpstr;
       }
       tmpstr = str.substring(i+1);
    }

    return tmpstr;
}

function rtrim(rValue)
{
	var str = rValue;
    var tmpstr = str;

    if ( rValue == '' )
    {
        return rValue;
    }

    for (var i = str.length-1; i >=0 ; i --)
    {

       if ( str.substr(i,1) != " " )
       {
           return tmpstr;
       }
       tmpstr = str.substring(0,i);
    }

    return tmpstr;
}

function lrtrim(rValue)
{
	return rtrim(ltrim(rValue));
}

function confirmDelete()
{
    if (!window.confirm('ȷʵҪɾ����?'))
    	return false;
    return true;
}

function ValidYearStr(rStr)
{
    var num;

    num = parseInt(rStr);

    if (rStr!=''+num){
    	 alert('�����Ϊ����!');
    	 return false;
    }

    if (num<1900 || 2999<num){
    	 alert('��ĸ�ʽ����!');
    	 return false;
    }

    return true;
}

function ValidMonthStr(rStr)
{
    var num;

    if (rStr.substring(0,1) == '0')	rStr= rStr.substring(1,2);
    num = parseInt(rStr);

    if (rStr!=''+num){
    	 alert('�·ݱ���Ϊ����!');
    	 return false;
    }

    if (num<1 || 12<num){
    	 alert('�·ݵĸ�ʽ����!');
    	 return false;
    }

    return true;
}

function ValidNumeric(rStr, rMsg)
{
    var num;

    num = parseInt(rStr);

    if ((rStr!=''+num) && (rStr!='0'+num)){
    	 alert(rMsg + ' ����Ϊ����!');
    	 return false;
    }

    return true;
}

var days = new Array (12);
days[0] = days[2] = days[4] = days[6] = days[7] = days[9] = days[11] = 31;
days[3] = days[5] = days[8] = days[10] = 30;
days[1] = 28;

function ValidDateStr(rStr, rName)
{
    var year,date,month;
    var numyear, numdate, nummonth;

    if (rName==''){
      msgdate = "���ڷǷ�!";
    }
    else{
      msgdate = "���� '" + rName + "' �Ƿ�!";
    }

    if ((rStr.substring(4,5) != '-') || (rStr.substring(7,8) != '-')){
    	alert(msgdate);
    	return false;
    }

    date  = rStr.substring(8, 10);
    month = rStr.substring(5, 7);
    year  = rStr.substring(0, 4);

    if (date.substring(0,1) == '0')	date= date.substring(1,2);
    if (month.substring(0,1) == '0')	month=month.substring(1,2);

    numdate  = parseInt(date);
    nummonth = parseInt(month);
    numyear  = parseInt(year);

    if (date != ''+numdate){
    	alert(msgdate);
    	return false;
    }
    if (month != ''+nummonth){
    	alert(msgdate);
    	return false;
    }
    if (year != ''+numyear){
    	alert(msgdate);
    	return false;
    }

    if (numyear<1900 || 2999<numyear){
    	 alert(msgdate);
    	 return false;
    }
    if (nummonth<1 || 12<nummonth){
    	 alert(msgdate);
    	 return false;
    }

    if ((nummonth == 2) && ((((numyear % 4) == 0) && ((numyear % 100) != 0)) || ((numyear % 400) == 0)) ){
    	if (numdate > 29 || numdate <= 0) {
            alert(msgdate);
            return false;
        }
    }
    else{
    	if (numdate > days[nummonth-1] || numdate <= 0){
     		alert(msgdate);
     		return false;
     	}
    }

    return true;
}

function isAfterDate(rDate1, rDate2)
{
    var DateStr1, DateStr2;

    DateStr1 = rDate1.substring(0,4) + rDate1.substring(5, 7) + rDate1.substring(8,10);
    DateStr2 = rDate2.substring(0,4) + rDate2.substring(5, 7) + rDate2.substring(8,10);

    if ( DateStr1 > DateStr2 )
    	{
     		return true;
    	}
    else
    	{
    		return false;
	}
}

function isBeforeDate(rDate1, rDate2)
{
    var DateStr1, DateStr2;

    DateStr1 = rDate1.substring(0,4) + rDate1.substring(5, 7) + rDate1.substring(8,10);
    DateStr2 = rDate2.substring(0,4) + rDate2.substring(5, 7) + rDate2.substring(8,10);

    if ( DateStr1 < DateStr2 )
    	{
     		return true;
    	}
    else
    	{
    		return false;
	}
}


function isNumeric(description,numStr)
{
	var pos=0;
	var tmpStr="";
	var msg="�Ƿ�������!";

	if ( isNotNull(description) )
    	msg = description + " ����Ϊ����!";

	if ( isNotNull(numStr) == false ){
		iconMsg("��ʾ",msg,"i"); 
		return false;
    }

	for (var i = 0; i < numStr.length; i ++){
       tmpStr = numStr.substring(i, i+1);

       //igore positive or not
       if ( tmpStr == "-" )
       {
           continue;
       }

       if ( (tmpStr > "9" || tmpStr < "0") && tmpStr != "." )

       {
       	  iconMsg("��ʾ",msg,"i"); 
           return false;
       }
       if ( tmpStr == "." )
       {
           pos = pos + 1;
       }
    }


	//make sure there is one "." in the numStr
	if ( pos > 1 ){
    	iconMsg("��ʾ",msg,"i"); 
    	return false;
    }
	else{
        return true;
    }
}

function CalDate(lFrDate,lFrTime, lToDate, lToTime )
{
    if ( (isNotNull(lFrDate) == false ) || ( isNotNull(lToDate) == false ) )
		return 0;

	rFrTmpDate=lFrDate;
	rToTmpDate=lToDate;

	rFrDate= rFrTmpDate.substring(0, 2);
	rFrMonth=rFrTmpDate.substring(3, 5);
	rFrMonth=parseInt(rFrMonth) -1;
	rFrYear=rFrTmpDate.substring(6, 10);

	rToDate=rToTmpDate.substring(0, 2);
	rToMonth=rToTmpDate.substring(3, 5);
	rToMonth=parseInt(rToMonth) -1;
	rToYear=rToTmpDate.substring(6, 10);

	// transfer the "leave from date" and "leave to date" to Date type
	dateStart = new Date(rFrYear,rFrMonth,rFrDate);
	dateEnd = new Date(rToYear,rToMonth,rToDate);

	f = dateStart.getTime();
	t = dateEnd.getTime();

	// calculate the absolute date number.
	value = (t-f)/(24*60*60*1000) + 1;

	// if have half date value , amend the date number
	// if "leave from Time" value equals "PM", that means leave from date just take half date leave, else take it as all date leave
	// if "leave to Time" value equals "AM", that means leave to date just take half date leave, else take it as all date leave
	if (lFrTime=="PM")
		value = value - 0.5;

	if (lToTime=="AM")
		value=value - 0.5;

	if (value<0 )
		value=0;

	return parseFloat(value);
}

function checkEmailAdress(rStr)
{
      	var email=rStr;
		var email2 = email.substr(email.indexOf("@") + 1);

      	if (!isNotNull(email))
      	{
      		alert("�����������ַ!");
      		return false;
      	}

      	if ((email.indexOf("@") == -1) ||
      		(email.indexOf("@") == 0)  ||
      		(email.indexOf("@") != email.lastIndexOf("@")) ||
      		(email2.indexOf(".") == -1)  ||
      		(email2.indexOf(".") == 0) ||
      		((email.indexOf(".") + 1) == email.length))
   		{
      		alert("������Ϸ��������ַ!");
      		return false;
      	}
      	else
      	{
      		return true;
      	}

}

function checkContact(rStr)
{
	rStr = lrtrim(rStr);

//	if (!isNumeric("Contact No.", rStr))
//		return false;
/*
	if (rStr.length < 8)
	{
		alert("Contact No. length must >= 8 !");
		return false;
	}
*/
    return true;
}

function isInteger(rStr, rMsg)
{
	if (!ValidNumeric(rStr, rMsg))
		return false;

	if (parseInt(rStr) <= 0){
		alert(rMsg + " ����Ϊ������!");
		return false;
	}
    return true;
}

function isPositive(rStr, rMsg)
{
	if (ValidFloat(rStr,2,rMsg) == -1)
		return false;

	if (parseFloat(rStr) < 0){
		alert(rMsg + " ����Ϊ����!");
		return false;
	}
    return true;
}

function checkAll(rObj,rSize,rCheck){
  	if (rSize ==1){
  		rObj.checked=rCheck;
  	}else{
		for (var i=0;i<rObj.length;i++){
	    	rObj[i].checked=rCheck;
	    }

	}
	return true;
}

//myform:checkbox���ڵ�form    srcName:����checkbox    targetName:Ŀ��checkbox    
function checkAll(myform, srcName, targetName) {
  //var o = document.getElementById(list);
  src = myform.item(srcName);
  var c = src.checked;  
  var a = myform.item(targetName);
  	if (typeof(a.length) == "undefined") {
  		a.checked = c;    
  	} else {
		  for (var i = 0; i < a.length; i++)
		  {
			 a[i].checked = c;
		  }
	}
}


/*useage : check 'text' or 'textarea' input length.
*argments: obj      : be checked object name (do NOT need add '.value')
*          intlength: permit max length
*          msg      : obj detail message
*return  boolean    : true pass the checking
*                     false  not pass the checking (and show a alert)
*/
function checkLength(rStrDescription,rObj,rIntLength){

	if (rObj.value.length > rIntLength){
		alert (rStrDescription + " �ĳ����� " + rObj.value.length + " �ַ�, ���ܶ��� "+ rIntLength + " ���ַ� !");
		return false;
	}

	return true;
}

function checkBrowser(){
  	var app=navigator.appName;

  	if (app.indexOf('Netscape') != -1) {
    	return 1;	// netscape browser
  	}
  	else if (app.indexOf('Microsoft') != -1) {
    	return 2;	// IE browser
  	}
  	else{
  		return 0;   // other browser
  	}
}


/*useage : check a number is float and the length of Decimal
*argments: rNum     : be checked number
*          rDecimail: permit max decimal length
*          msg      : obj detail message
*return  int        : -1  -  is not a float format
*                     >=0   -  the number length of decimal is 0
*        (if decimal length more than permit length then alert a
* message.
*/
function ValidFloat(rStr, rDecimal, rMsg)
{
	var num;
	num = parseFloat(rStr);

	if ((rStr!=''+num) && num != 0 && (rStr != num + ".0"))
	{
		alert(rMsg + ' ����Ϊ����!');
		return -1;
	}

	if(rDecimal ==0)
		return 0;

	for(i=0;i<rStr.length;i++)
	{

		if(rStr.substring(rStr.length - i -1, rStr.length - i) == ".")
		{
			if(i>rDecimal)
		    {
		    	alert(rMsg + ' С��λ���ܶ��� '+rDecimal+' λ!');
		    	return -1;
			}
		   	return 0;
		}
	}

	return 0;
}


/*useage : check a number is between other two number and show standard alert.
*argments: rNum     : checked number
*          rMin     : permit min number
*          rMax     : permit max number
*          msg      : obj detail message
*return  boolean    : true - is match format
*                     false - not match (and show a alert)
*/
function isBetween(rNum,rMin,rMax,rMsg)
{
	if((parseInt(rNum)>parseInt(rMax)) || (parseInt(rNum)<parseInt(rMin)))
	{
		alert(rMsg+' ������ '+rMin+' �� '+rMax + "֮��!");
		return false;
	}
			return true;
}


/*useage :  trim all the text and textarea field that in the form.
*argments: objForm  : form name
*return:   void
*/
function trimAllText(objForm)
 {
 	for(i=0;i<objForm.elements.length;i++)
 	{
 		if(objForm.elements.type=="text" || objForm.elements.type=="textarea")
 		{
 			objForm.elements[i].value = lrtrim(objForm.elements[i].value);
 		}
 	}
 }


/*useage :  check if the string is only consist of numbers and letters
*argments: rStr  : string to be checked
*return:   boolean
*/
function isNumAndLetter(description, object)
 {
 	req = /[^A-Za-z0-9]/g
    if (object.value.match(req)) {
    	alert(description + ' ֻ�ܰ�����ĸ(A-Z/a-z) ������(0-9)!' );
		return false;
	} else {
		return true;
	}
 }

/*useage :  check if the string is only consist of letters
*argments: rStr  : string to be checked
*return:   boolean
*/
function isLetter(description, object)
 {
 	req = /[^A-Za-z]/g
    if (object.value.match(req)) {
    	alert(description + ' can only contain letters(A-Z/a-z)!' );
		return false;
	} else {
		return true;
	}
 }
 
  //���ָ���Ķ����Ƿ���ѡ������һ��
 function checkSelect2(obj) {
	var selected = 0;
	if (obj != null) {
		if (typeof(obj.length) != "undefined") {
			for (i=0;i<obj.length;i++) {
				if (obj[i].checked) {
					selected++;
				}
			}
		} else {
			if (obj.checked) {
				selected = 1;
			}
		}
	} 
	return selected;
}


function getCheckObj(obj) {
	if (obj != null) {
		if (typeof(obj.length) != "undefined") {
			for (i=0;i<obj.length;i++) {
				if (obj[i].checked) {
					return obj[i];
				}
			}
		} else {
			if (obj.checked) {
				return obj;
			}
		}
	} 
}

//check press key is integer number
function intNumKey()
{
	if((window.event.keyCode!=13)&& (window.event.keyCode!=45) && ((window.event.keyCode<48)||(window.event.keyCode>57))){
	   window.event.returnValue = false;
	   alert("����������һ�����֣�");
	   return false;
  	 }
	 return true;
}

//check press key is float number
function floatNumKey()
{

if((window.event.keyCode!=13)&& (window.event.keyCode!=45) && ((window.event.keyCode<46)||(window.event.keyCode==47)||(window.event.keyCode>57))){
   window.event.returnValue = false;
   alert("��������������!");
   return false;
   }
   return true;
}

