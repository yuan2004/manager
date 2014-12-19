
<!-- Hide me -->
var popWidth = 1000; //pop window width
var popHeight = 700; //pop window height

//鼠标移入
function showmouseover(object){ object.style.backgroundColor='#DBE2F0'}
//鼠标移出 
function showmouseout(object){ object.style.backgroundColor='#ffffff'}
//鼠标移入一般button
function showmouseover_button(object){
	if(object.className == "rep_btn_style") {
		object.className='rep_btn_on_style'
	} else {
  		object.className='btn_on_style'
	}
}
//鼠标移出一般button  
function showmouseout_button(object){
	if(object.className == "rep_btn_on_style") {
		object.className='rep_btn_style'
	} else {
  		object.className='btn_style'
	}	
}
//鼠标移入  
function showmouseover_back(object){ object.className='back1'}

//鼠标移出      
function showmouseout_back(object){ object.className='back'}
//鼠标移入    buttonauto
function showmouseover_buttonauto(object){object.className='btn_on_styleauto'}
//鼠标移出    buttonauto  
function showmouseout_buttonauto(object) {object.className='btn_styleauto'}
//返回专用的
function control() {	document.images["leftRightImg"].src=document.imageArray[1].src;}
function control1() {  document.images["leftRightImg"].src=document.imageArray[0].src;}
//preload image
function simplePreload(){ 
  var args = simplePreload.arguments;
  document.imageArray = new Array(args.length);
  for(var i=0; i<args.length; i++) {
	document.imageArray[i] = new Image;
	document.imageArray[i].src = args[i];
  }
}
function control2() {
    if (flag == 0) {
        parent.close();
		document.images["leftRightImg"].src=document.imageArray[1].src;
        flag = 1;
    } else {
        parent.open();
		document.images["leftRightImg"].src=document.imageArray[0].src;
        flag = 0;
    }
}
function showmouseovertxt(obj){ obj.style.color="#336699"}
function showmouseouttxt(obj){ obj.style.color="#000000"}
function document.onkeydown(){ 
	if((event.keyCode==122)||                 //屏蔽 F11 键
      (event.keyCode==116)||                 //屏蔽 F5 刷新键
      (event.keyCode==114)||                 //屏蔽 F3 搜索键
      (event.keyCode==115)||                 //屏蔽 F4 刷新键
      (event.keyCode==123)||                 //屏蔽 F11 刷新键
      (event.ctrlKey && event.keyCode==82)){ //Ctrl + R
		event.keyCode=0;
		event.returnValue=false;
     }
}
//屏蔽F1
function window.onhelp(){return false;}
function showOrHideDiv(e1) {                         //显示或隐藏一个div（由id定义其名称)
  if (e1.style.display == '') {
	e1.style.display = 'none';
  } else {
	e1.style.display = '';
  }
}
function showHideLayer(obj) {
    if (obj.style.visibility == "hidden") {
        obj.style.visibility = "visible";
    } else {
        obj.style.visibility = "hidden";
    }
}
//  把一个控件变为有效
function Enable(object){ if(object){ object.disabled=false; }}
//把一个控件变为无效
function Disable(object){if(object){ object.disabled=true; }}
//把一个控件的状态反转
function enaOrDis(obj) {obj.disabled = !obj.disabled;}
function enableExport(size){  
  if(size>0){
    Enable(parent.document.forms[0].excelExport);
    Enable(parent.document.forms[0].print);   
  }else{
    Disable(parent.document.forms[0].excelExport);
    Disable(parent.document.forms[0].print);
  }
 }


/******************************************************************/
/******库文件名：	table_Extend.js				***/
/******库属性：		public					***/
/******库作用：	扩展table的功能					***/
/******作者：	KinLee						***/
/******更新日期：	2001/12/26				***/
/******程序入口：	1,public_table_Extend_click()		***/
/******			2,public_table_Extend_keyDown()		***/
/******返回结果说明：使table相应行变色，并执行函数		***/
/******使用本库必须引入其它库说明：无				***/
/******************************************************************/
var table_extend_bgr = "#E8FFFD";
var table_extend_clr = "#C0D6C8";
function table_extend_changeback(originalcolor){
	source=event.srcElement;
	while(source.tagName!="TABLE")source=source.parentElement;
	var AllTR = source.all.tags("TR");
	for(var i=0;i<AllTR.length;i++){
		if(AllTR[i].type!=0){
			AllTR[i].style.backgroundColor=originalcolor;
			AllTR[i].ifFocus=0;
		}
	}
	return;
}
function public_table_Extend_click(f_code){
	try{
		table_extend_changeback(table_extend_bgr);
		source=event.srcElement;
		if (source.tagName=="TABLE")return;
		while(source.tagName!="TR")	source=source.parentElement;
		source.style.backgroundColor=table_extend_clr;
		source.ifFocus=1;
		var PS=table_extend_GetSelectPosition();
		eval(f_code+"("+PS+")");
	  }catch (err){return;}
}
function public_table_Extend_Dbclick(f_code){
	try{
		table_extend_changeback(table_extend_bgr);
		source=event.srcElement;
		if (source.tagName=="TABLE")return;
		while(source.tagName!="TR")	source=source.parentElement;
		source.style.backgroundColor=table_extend_clr;
		source.ifFocus=1;
		var PS=table_extend_GetSelectPosition();
		eval(f_code+"("+PS+")");
	  } catch (err) {return;}
}
function table_extend_GetSelectPosition(){
	source=event.srcElement;
	while(source.tagName!="TABLE") source=source.parentElement;
	var AllTR = source.all.tags("TR");
	for(var i=0;i<AllTR.length;i++)	{
		if(AllTR[i].ifFocus==1)	return i;
	}
}
function table_extend_ChangeSelect(PS){
	source=event.srcElement;
	while(source.tagName!="TABLE") source=source.parentElement;
	var AllTR = source.all.tags("TR");
	if(PS==-1)  PS = PS + 1;
	else if(PS==AllTR.length) PS = PS - 1;
	table_extend_changeback(table_extend_bgr);
	AllTR[PS].style.backgroundColor=table_extend_clr;
	AllTR[PS].ifFocus=1;
	return PS;
}

function  public_table_Extend_keyDown(f_code,f_code13){
	try{
		var PS = table_extend_GetSelectPosition();
		var KeyCode = event.keyCode;
		var newPS = PS;
		switch (KeyCode){
			case 38:
				newPS = table_extend_ChangeSelect(PS-1);
				eval(f_code+"("+newPS+")");
				break;
			case 40:
				newPS = table_extend_ChangeSelect(PS+1);
				eval(f_code+"("+newPS+")");
				break;
			case 13:
				eval(f_code13+"("+newPS+")");
				break;
			default:
				break;
		}
	}catch(err){return;}
}
function table_extend_MTF(TableID,PS){
	try{
		var AllTr = eval(TableID).all.tags('TR');
		AllTr[PS].click();
		//eval(TableID).focus();
	}catch(err){}
	return;
}
function public_Event_Attemper_keepTrack(){
	//等待主文档的全部下载
	if (document.readyState == "complete") {return;}
	else {setTimeout("public_Event_Attemper_keepTrack()",1);  }
}


var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height, windowName)
{
    if (windowName == null) {
        windowName = "win";
    }
	if(width == null || width=="") width = 640;
	
	if(height == null || height=="") height = 400;

    if(popUpWin) {
	    if(!popUpWin.closed) popUpWin.close();
	}
	if(top == null || top == "") {
		top = (screen.height-height)/2-10;
	}
	if(left == null || left == "") {
		left = (screen.width-width)/2 ;
	}	
	var feature = 'toolbar=no,location=no,directories=no,status=no,menub ar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top;
	popUpWin = open(URLStr, windowName,feature);

}

function popUpWindow2(URLStr, left, top, width, height, windowName)
{
    if (windowName == null) {
        windowName = "win";
    }
	if(width == null || width=="") width = screen.width-20;
	
	if(height == null || height=="") height = screen.height - 100;

    if(popUpWin) {
	    if(!popUpWin.closed) popUpWin.close();
	}
	if(top == null || top == "") {
		top = (screen.height-height)/2-40;
	}
	if(left == null || left == "") {
		left = (screen.width-width)/2-10 ;
	}	
	feature = 'toolbar=yes,location=yes,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top;
	popUpWin = open(URLStr, windowName,feature);

}


function popUpFullWin(url,windowName) {
	var width = (screen.width-30);
	var height = (screen.height-100);
	popUpWindow(url, null, null, width, height, windowName);
}


function AutomateExcel(table) 
{
 if(!table){
  alert('导出表格未定义！');
  return false;
 }
// Start Excel and get Application object.
var oXL = new ActiveXObject("Excel.Application"); 
// Get a new workbook.
var oWB = oXL.Workbooks.Add();
var oSheet = oWB.ActiveSheet;

 
var hang = table.rows.length;

var lie = table.rows(0).cells.length; 

// Add table headers going cell by cell.
for (i=0;i<hang;i++){
	for (j=0;j<lie;j++){
		oSheet.Cells(i+1,j+1).Value = table.rows(i).cells(j).innerText;
	}
}
oXL.Visible = true;
oXL.UserControl = true;
}

function ShowOrHideDiv(e1)                          //显示或隐藏一个div（由id定义其名称)
{
  if (e1.style.display == '') {
	e1.style.display = 'none';
  } else {
	e1.style.display = '';
  }
}


function printTable(paraform,paraDocument, tableId){
  var strTable = "";
  var oldTarget;
  var oldAction;
  var tableObj;
  var title;

  if (tableId == null || tableId == "") {
    tableId = "data";
  }

  if(!paraDocument){
       alert('打印页document错误');
       return false;
  }else{

    if (typeof paraDocument.all.printTitle != "undefined") {
        title = paraDocument.all.printTitle.value;
   
    } else {
        title = "系统";
    }

    tableObj = eval("paraDocument.all." + tableId);    
    //strTable =  "<CAPTION>" + paraDocument.title + "</CAPTION>"+ tableObj.outerHTML;
	strTable =  "<CAPTION>" + title + "</CAPTION>"+ tableObj.outerHTML;
  }
  
  if(!paraform){
  	alert('打印页form错误');
  	return false;
  }else{
      if(!paraform.STR_TABLE){
      	alert('未定义hidden 变量 STR_TABLE');
      	return false;
          
       }else{
            oldTarget = paraform.target;
            oldAction = paraform.action;

          paraform.STR_TABLE.value = strTable;
	  paraform.action = "/print.do";
	  paraform.target="_blank" ;
	  paraform.submit();

	        paraform.target = oldTarget;
	        paraform.action = oldAction;
       }
   }
   return true;
}

function validateTwoDate( startDate, endDate){
  if(parseDate(startDate)>parseDate(endDate)){
    alert('开始日期不能大于结束日期！');
    return false;
  }
  return true;
  
}

function parseDate( date){
  if(!date ){
    return 0;
  }
  var sDate = date.substring(0,4)+date.substring(5,7)+date.substring(8,10);
  return parseInt(sDate);
  
}
//   返回strInput的字符串长度,支持中文,把汉字算作两个字符
function StringLength(strInput){return strInput.replace(/[^\x00-\xff]/g,"**").length;}
//判断输入字符是否过长,object为输入控件, message为显示消息, maxlength为最大长度
function CheckInputLength(object, message, maxlength) {
	if (message == null) message = "";
	if (StringLength(trim(object.value)) > maxlength) {
		alert(message + "！ 不能超过" + maxlength + "个字符或" + maxlength/2 + "个汉字");
		object.focus();
		return false;  
	}
	object.value = trim(object.value);
	return true;
}
//  选中所有的checkbox,obj为checkbox的name,checkall 为控制checkbox
function CheckAll(checkall, obj){     
	if (typeof(obj) == "undefined") return;
	if (checkall.checked == true) {
		obj.checked = true;
		for(i=0; i<obj.length; i++){
			if(obj[i].disabled==false){
				obj[i].checked = true;
			}
		}
	} else {
		obj.checked = false;
		for(i=0; i<obj.length; i++)
			obj[i].checked = false;
	}
}
//选中所有的checkbox,obj为checkbox的name,checkall 为控制checkbox
function CheckAllByName(checkall, obj){      
	var objs = setArrayByName(obj,"all");
	CheckAll(checkall,objs);
}

/*
	传入一个集合对象，把此集合对象放入到一个数组中，
	解决当此集合对象只有一个时，不会把此对象认成数组的问题
	added by Zhubin on 2005/10/23
	obj:需要处理的对象
	flag：check(只需要check了的对象）；uncheck（只需要未check的对象）；all
	
*/
function setArray(obj,flag) {
	var array = new Array();
	if (typeof(obj.length)=="undefined"){
		if (flag=="check" && obj.checked)
			array.push(obj);
		else if (flag=="uncheck" && !obj.checked)
			array.push(obj);
		else if (flag=="all" || flag==null)
			array.push(obj);
	} else {
		for(i=0;i<obj.length;i++) {
			if (flag=="check" && obj[i].checked)
				array.push(obj[i]);
			else if (flag=="uncheck" && !obj[i].checked)
				array.push(obj[i]);
			else if (flag=="all" || flag==null)
				array.push(obj[i]);					
		}
	}
	return array;
}

function setArrayByName(objName,flag) {
	var obj = eval("document.all." + objName);
	return setArray(obj,flag);
}
var oPopup = window.createPopup();
var tipEventSrc;
var tipXPosition = 20;
var tipYPosition = 20;
var tipWidth     = 200;
var tipHeight    =50;

function myShowTip(content, x, y, w, h, alwaysSearchDB) {
    oPopup.document.body.bgColor = "#AFE6A8";
	oPopup.document.body.style.fontSize = "10pt";
	oPopup.document.body.style.padding = "3";
	oPopup.document.body.innerHTML = content;
	if (oPopup.isOpen)  oPopup.hide();
    oPopup.show(x, y, w, h,document.body);
    if (content == '') {
        var ww = oPopup.document.all.xTipTab.offsetWidth;
        var hh = oPopup.document.all.xTipTab.offsetHeight;
        oPopup.hide();
       // oPopup.show(x, y, ww, hh, tipEventSrc);
      //  if (typeof(alwaysSearchDB) == 'boolean' && alwaysSearchDB) return;
        //initTip(id, ww, hh, context);
    }
}
function onlyShowTip(content,evn) {
	var x,y;
	if (evn != null) {
		x = evn.x + 15;
		y = evn.y;
	} else {
		x = tipXPosition;
		y = tipYPosition;
	}

	var re = /&quote;/g;
	content.replace(re,'"');
    if (oPopup.isOpen) oPopup.hide();
    tipEventSrc = window.event.srcElement;
    if (content != '') {
        myShowTip(content,x ,y , tipWidth, tipHeight);
        return;
    }
}

function hand(){
	window.event.srcElement.style.cursor="hand";
}

/*
	text:提示内容
	args:设定提示窗得参数数组
*/
function showtip2(text,args){
		document.all.tooltip2.innerHTML='<font style="font-size:9pt">'+text+'</font>';
		//document.all.tooltip2.style.pixelLeft=event.clientX+15
		document.all.tooltip2.style.pixelTop=document.body.scrollTop+event.clientY;
		if (event.clientX<document.body.clientWidth-2)
			document.all.tooltip2.style.pixelLeft=document.body.scrollLeft+event.clientX+15;
		else
			document.all.tooltip2.style.pixelLeft=document.body.clientWidth+15;

		document.all.tooltip2.style.visibility="visible"
}   
function hidetip2(){
	document.all.tooltip2.style.visibility="hidden"
}

function popModelWindow(URLStr, width, height, windowName,params){
    if (windowName == null) {
        windowName = "win";
    }
	var reg = /&/g;
	var popRand = Math.random();
	if(URLStr.indexOf("?")>=0) {
		URLStr += "&popRand=" + popRand;	
	} else {
		URLStr += "?popRand=" + popRand;		
	}
	URLStr = URLStr.replace(reg,"@_@");
	
	var url = _rootPath + "/util/popPage.jsp?arg=" + URLStr;
	var feature = "dialogHeight:" + height + ";dialogWidth:" + width + ";status:no;scroll:auto;resizable:1";
	var ret = window.showModalDialog(url,params,feature);	
	return ret; 

}

function setDateSql(date1, date2, colName) {
	var sql = "";
	var dateFm = "yyyy-MM-dd";
	if (date1 != "" && date2 != "") {
		sql = colName + " between to_date('" + date1 + "','" + dateFm + "') and to_date('" + date2 + "','" + dateFm + "')";
	} else if (date1 != "") {
		sql = colName + " >= to_date('" + date1 + "','" + dateFm + "')";
	} else if (date2 != "") {
		sql = colName + " <= to_date('" + date2 + "','" + dateFm + "')";
	}
	return sql;
}

function popModelessWindow(URLStr, width, height, windowName,params)
{
    if (windowName == null) {
        windowName = "win";
    }
	var reg = /&/g;
	var popRand = Math.random();
	if(URLStr.indexOf("?")>=0) {
		URLStr += "&popRand=" + popRand;	
	} else {
		URLStr += "?popRand=" + popRand;		
	}
	URLStr = URLStr.replace(reg,"@_@");
	var url =  _rootPath + "/util/popPage.jsp?arg=" + URLStr;
	var feature = "dialogHeight:" + height + ";dialogWidth:" + width + ";status:no;scroll:auto";
	var ret = window.showModelessDialog(url,params,feature);	
	return ret;

}

function arrayContains(arr,val) {
	for(var myi=0;myi<arr.length;myi++) {
		if(arr[myi] == val) {
			return true;	
		}	
	}	
	return false;
}

function testElement(obj) {
	var str = "";
	for(nn in obj) {
		str += nn + "; ";
	}		
	return str;
}

//返回机构员工树选中的id
//返回Array：retList[0]=机构id数组；retList[1]=员工id数组
function getAllChecked(_tree) {
	var list=_tree.getAllChecked();	
	var orgList = new Array();
	var staffList = new Array();
	var retList = new Array();
	var array = new Array();
	var staffFlag = TAG_TREE_PRE_STAFF;
	if(list != null && list != "") {
		array = list.split(",");
	}
	for(i = 0;i<array.length;i++) {
		if(array[i].indexOf(staffFlag) == 0) {
			staffList.push(array[i].replace(staffFlag,""));
		} else {
			orgList.push(array[i]);
		}
	}
	retList.push(orgList);
	retList.push(staffList);
	return retList;
}

//返回所有选中的叶子节点数组
function getAllChildChecked(_tree) {
	var list=_tree.getAllChildless();
	var retList = new Array();
	if(list != null && list != "") {
		var array = list.split(",");
		for(var i=0;i<array.length;i++) {
			if(_tree.isItemChecked(array[i])) {
				retList.push(array[i]);
			}
		}
	}
	return retList;
}

//激活控件
function writeContral(content) {
	document.write(content);
}

function addFileFunc(objName,divName) {
	var obj = setArrayByName(objName,"all");
	var fileDiv = document.getElementById(divName);
	var insetEl = '<input type="file" id="' + obj[0].id + '" name="' 
		+ obj[0].id + obj.length + '"  size="' + obj[0].size + '"  class="' + obj[0].className  + '">';
	//fileDiv.outerHTML = fileDiv.outerHTML + "<br>" + insetEl ;
	var newFile = document.createElement("input");
	newFile.id= obj[0].id;
	newFile.name= obj[0].id + obj.length;
	newFile.size=obj[0].size;
	newFile.className= obj[0].className;
	//newFile.type = "file";
	newFile.type = "file";
	newBr = document.createElement("br");
	fileDiv.appendChild(newBr);
	fileDiv.appendChild(newFile);
}



/*=====================================对select的操作 begin===========================================*/
//1.判断select选项中 是否存在Value="paraValue"的Item
function jsSelectIsExitItem(objSelect,objItemValue)
{
    var isExit = false;
    for(var i=0;i<objSelect.options.length;i++)
    {
        if(objSelect.options[i].value == objItemValue)
        {
            isExit = true;
            break;
        }
    }      
    return isExit;
}

//2.向select选项中 加入一个Item
function jsAddItemToSelect(objSelect,objItemText,objItemValue)
{
    //判断是否存在
    if(jsSelectIsExitItem(objSelect,objItemValue))
    {
        alert("该Item的Value值已经存在");
    }
    else
    {
        var varItem = new Option(objItemText,objItemValue);
//      objSelect.options[objSelect.options.length] = varItem;
        objSelect.options.add(varItem);
        alert("成功加入");
    }    
}

//3.从select选项中 删除一个Item
function jsRemoveItemFromSelect(objSelect,objItemValue)
{
    //判断是否存在
    if(jsSelectIsExitItem(objSelect,objItemValue))
    {
        for(var i=0;i<objSelect.options.length;i++)
        {
            if(objSelect.options[i].value == objItemValue)
            {
                objSelect.options.remove(i);
                break;
            }
        }        
        alert("成功删除");            
    }
    else
    {
        alert("该select中 不存在该项");
    }    
}

//4.修改select选项中 value="paraValue"的text为"paraText"
function jsUpdateItemToSelect(objSelect,objItemText,objItemValue)
{
    //判断是否存在
    if(jsSelectIsExitItem(objSelect,objItemValue))
    {
        for(var i=0;i<objSelect.options.length;i++)
        {
            if(objSelect.options[i].value == objItemValue)
            {
                objSelect.options[i].text = objItemText;
                break;
            }
        }        
        alert("成功修改");            
    }
    else
    {
        alert("该select中 不存在该项");
    }    
}
        
//5.设置select中text="paraText"的第一个Item为选中
function jsSelectItemByValue(objSelect,objItemText)
{    
    //判断是否存在
    var isExit = false;
    for(var i=0;i<objSelect.options.length;i++)
    {
        if(objSelect.options[i].text == objItemText)
        {
            objSelect.options[i].selected = true;
            isExit = true;
            break;
        }
    }      
    //Show出结果
    if(isExit)
    { 
        alert("成功选中");            
    }
    else
    {
        alert("该select中 不存在该项");
    }    
}

//6.设置select中value="paraValue"的Item为选中
//document.all.objSelect.value = objItemValue;

//7.得到select的当前选中项的value
//var currSelectValue = document.all.objSelect.value;

//8.得到select的当前选中项的text
function jsGetSelectText(obj) {
	var currSelectText = obj.options[obj.selectedIndex].text;
	return currSelectText;
}
//var currSelectText = document.all.objSelect.options[document.all.objSelect.selectedIndex].text;

//9.得到select的当前选中项的Index
//var currSelectIndex = document.all.objSelect.selectedIndex;

//10.清空select的项
// document.all.objSelect.options.length = 0;
/*=====================================对select的操作 end===========================================*/



/*=====================================检测密码强度 begin===========================================*/
//CharMode函数
//测试某个字符是属于哪一类
function CharMode(iN) {
   if (iN>=48 && iN <=57) //数字
    return 1;
   if (iN>=65 && iN <=90) //大写字母
    return 2;
   if (iN>=97 && iN <=122) //小写
    return 4;
   else
    return 8; //特殊字符
}

//bitTotal函数
//计算出当前密码当中一共有多少种模式
function bitTotal(num) {
   modes=0;
   for (i=0;i<4;i++) {
    if (num & 1) modes++;
     num>>>=1;
    }
   return modes;
}

//checkStrong函数
//返回密码的强度级别
function checkStrong(sPW) {
   if (sPW.length<=7)
    return 0; //密码太短
    Modes=0;
    for (i=0;i<sPW.length;i++) {
     //测试每一个字符的类别并统计一共有多少种模式
     Modes|=CharMode(sPW.charCodeAt(i));
   }
   return bitTotal(Modes);
}


//pwStrength函数
//当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色

function pwStrength(pwd) {
   O_color="#eeeeee";
   L_color="#FF0000";
   M_color="#FF9900";
   H_color="#33CC00";
   if (pwd==null||pwd==''){
    Lcolor=Mcolor=Hcolor=O_color;
   }
   else {
    S_level=checkStrong(pwd);
    switch(S_level) {
    case 0:
     Lcolor=Mcolor=Hcolor=O_color;
    case 1:
     Lcolor=L_color;
     Mcolor=Hcolor=O_color;
    break;
    case 2:
     Lcolor=Mcolor=M_color;
     Hcolor=O_color;
    break;
    default:
     Lcolor=Mcolor=Hcolor=H_color;
    }
   }
   document.getElementById("strength_L").style.background=Lcolor;
   document.getElementById("strength_M").style.background=Mcolor;
   document.getElementById("strength_H").style.background=Hcolor;
return;
}
/*=====================================检测密码强度 end===========================================*/
function goBack(){
	history.back(-1);
}


var trOverClass = ""; //鼠标over前原来tr的class
var trClickClass = ""; //鼠标点击前tr的class

function overTr(obj) {
	trOverClass = obj.className;
	if(obj.className != "clickTd")
		obj.className = "overTd";
}

function outTr(obj) {
	if(obj.className != "clickTd")
		obj.className = trOverClass;
}

function clickTr(obj) {
	obj.className = "clickTd";
}

//检查必须输入的内容是否有录入，mustInput是Array对象，里面存放需要检测的控件的id
function checkMustInput(mustInput) {

	for(i=0;i< mustInput.length;i++) {
		var ck = document.getElementById(mustInput[i]);
		if(Trim(ck.value) == "") {
			iconMsg2("<span class='textinfo-1'>*</span>为必填内容！","e");
			//ck.focus();
			return false;
		}
	}
	
	return true;
}

/*
 * 把一个数组转化为字符串
 * array:需要转换的数组
 * splitStr：分割符
 * 返回值：按照分隔符分割的字符串
 */

function array2Str(array,splitStr) {
	var str = "";
	for(var i=0;i<array.length;i++) {
		if(i == 0) {
			str = array[i];
		} else {
			str += splitStr + array[i];
		}
	}
	return str;
}

/*
 * 初始化父窗口中的iframe的大小和子窗口的大小一致
 */
function initParentIframe(ifrName) {
	try {
			var bHeight = document.body.scrollHeight;
			var dHeight = document.documentElement.scrollHeight;
			var height = Math.max(bHeight, dHeight);
			parent.$(ifrName).height =  height;	
	}catch(e) {}
}
function initParentIframes(obj) {
	 var win=obj;
        if (document.getElementById)
        {
            if (win && !window.opera)
            {
                if (win.contentDocument && win.contentDocument.body.offsetHeight) 
                    win.style.height = win.contentDocument.body.offsetHeight;
                else if(win.Document && win.Document.body.scrollHeight)
                    win.style.height = win.Document.body.scrollHeight;
            }

        }
}
/*
 * 使iframe的高度和其包含的页面的一样。
 */


function SetWinHeight(obj)
{
 var win=obj;
 if (document.getElementById)
 {
  if (win && !window.opera)
  {
   if (win.contentDocument && win.contentDocument.body.offsetHeight) 
    win.height = win.contentDocument.body.offsetHeight; 
   else if(win.Document && win.Document.body.scrollHeight)
    win.height = win.Document.body.scrollHeight;
  }
 }
}

//屏蔽鼠标右键
function   killErrors()   {     
  return   true;     
} 

//window.onerror   =   killErrors;  

//定位光标到输入框指定位置
/**
 * input:输入框对象, position：要把光标放到什么位置
 */
function changeCursor(input, position) {   
      var range = input.createTextRange();   
      range.collapse(true);   
      range.moveStart('character', position);   
      range.select();   
}  



/*
	expireHours:过期天数，0关闭浏览器即过期
*/

function setCookie(name,value,expireHours ){
     var cookieString=name+"="+escape(value);
     //判断是否设置过期时间
	 var d = new Number();
	 d = expireHours*3600*1000;
     if(expireHours>0){
           var date=new Date();
           date.setTime(date.getTime() +d);
           cookieString=cookieString+"; expires="+date.toGMTString() ;
     }
     document.cookie=cookieString;
}
function setCookie2(name,value,expireHours,domain,path,secure){
     var cookieString=name+"="+escape(value);
     //判断是否设置过期时间
	 var d = new Number();
	 d = expireHours*3600*1000;
     if(expireHours>0){
           var date=new Date();
           date.setTime(date.getTime() +d);
           cookieString=cookieString+"; expires="+date.toGMTString() 
		   		+ "; domain=" + domain + "; path=" + path + "; secure=" + secure;
     }
     document.cookie=cookieString;
}
function getCookie(sName){
 var aCookie = document.cookie.split("; ");
 for (var i=0; i < aCookie.length; i++) {
  var aCrumb = aCookie[i].split("=");
  if (sName == aCrumb[0])
  return unescape(aCrumb[1]);
 }
}

//得到每月 最后一天
function   getLastDay(year,month){   
  var   theDay   =   new   Date(year,month,0);   
  theDay   =   new   Date(theDay.getFullYear(),theDay.getMonth(),theDay.getDate());  
  return theDay;
}

//测试浏览器类型和版本
	function testIE() {
       
        var ua = navigator.userAgent.toLowerCase();
        if (window.ActiveXObject)
            Sys.ie = ua.match(/msie ([\d.]+)/)[1]
        else if (document.getBoxObjectFor)
            Sys.firefox = ua.match(/firefox\/([\d.]+)/)[1]
        else if (window.MessageEvent && !document.getBoxObjectFor)
            Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1]
        else if (window.opera)
            Sys.opera = ua.match(/opera.([\d.]+)/)[1]
        else if (window.openDatabase)
            Sys.safari = ua.match(/version\/([\d.]+)/)[1];
        
        //以下进行测试
       /* if(Sys.ie) document.write('IE: '+Sys.ie);
        if(Sys.firefox) document.write('Firefox: '+Sys.firefox);
        if(Sys.chrome) document.write('Chrome: '+Sys.chrome);
        if(Sys.opera) document.write('Opera: '+Sys.opera);
        if(Sys.safari) document.write('Safari: '+Sys.safari);		*/
	}
	
var limit = 2000;
function checkSize(filePicker)
{
   var fso = new ActiveXObject("Scripting.FileSystemObject");        
   size = Math.round(fso.GetFile(filePicker.value).size/1024*100)/100 ; 
  return size;
}

function isLimit(filePicker) {
	var size = checkSize(filePicker);
	if(size>limit) {
		iconMsg("提示","您上传的文件大小为：" + size + " kb，上传文件不能大于" + limit + " kb！请重新上传。","i");
		return false;
	} else {
		return true;
	}
}	
