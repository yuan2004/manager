//-----------------���ں���
//---------------------------------------------------   
// �ж�����   
//---------------------------------------------------   
Date.prototype.isLeapYear = function(){    
	return (0==this.getYear()%4&&((this.getYear()%100!=0)||(this.getYear()%400==0)));    
}    
   
//---------------------------------------------------   
// ���ڸ�ʽ��   
// ��ʽ YYYY/yyyy/YY/yy ��ʾ���   
// MM/M �·�   
// W/w ����   
// dd/DD/d/D ����   
// hh/HH/h/H ʱ��   
// mm/m ����   
// ss/SS/s/S ��   
//---------------------------------------------------   
Date.prototype.Format = function(formatStr){    
    var str = formatStr;    
    var Week = ['��','һ','��','��','��','��','��'];   
   
     str=str.replace(/yyyy|YYYY/,this.getFullYear());    
     str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));    
   
   	 var month = this.getMonth() + 1;
     str=str.replace(/MM/,month > 9 ? month.toString() : '0' + month);    
     str=str.replace(/M/g, month);    
   
     str=str.replace(/w|W/g,Week[this.getDay()]);    
   
     str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());    
     str=str.replace(/d|D/g,this.getDate());    
   
     str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());    
     str=str.replace(/h|H/g,this.getHours());    
     str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());    
     str=str.replace(/m/g,this.getMinutes());    
   
     str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());    
     str=str.replace(/s|S/g,this.getSeconds());    
   
    return str;    
}    
   
//+---------------------------------------------------   
//| ������ʱ��������� ���ڸ�ʽΪ YYYY-MM-dd    
//+---------------------------------------------------   
Date.prototype.daysBetween = function(date){
	var date1 = this;
	var date2 = date;
	return Math.round((date1.getTime() - date2.getTime())/(24*60*60*1000));
}   
   
   
//+---------------------------------------------------   
//| ���ڼ���   
//+---------------------------------------------------   
Date.prototype.DateAdd = function(strInterval, Number) {   
    var dtTmp = this;   
    switch (strInterval) {    
        case 's' :return new Date(dtTmp.getTime() + (1000 * Number));   
        case 'n' :return new Date(dtTmp.getTime() + (60000 * Number));   
        case 'h' :return new Date(dtTmp.getTime() + (3600000 * Number));   
        case 'd' :return new Date(dtTmp.getTime() + (86400000 * Number));   
        case 'w' :return new Date(dtTmp.getTime() + ((86400000 * 7) * Number));   
        case 'q' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number*3, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());   
        case 'm' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());   
        case 'y' :return new Date((dtTmp.getFullYear() + Number), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());   
     }   
}   
   
//+---------------------------------------------------   
//| �Ƚ����ڲ� dtEnd ��ʽΪ�����ͻ��� ��Ч���ڸ�ʽ�ַ���   
//+---------------------------------------------------   
Date.prototype.DateDiff = function(strInterval, dtEnd) {    
    var dtStart = this;   
    if (typeof dtEnd == 'string' )//������ַ���ת��Ϊ������   
     {    
         dtEnd = StringToDate(dtEnd);   
     }   
    switch (strInterval) {    
        case 's' :return parseInt((dtEnd - dtStart) / 1000);   
        case 'n' :return parseInt((dtEnd - dtStart) / 60000);   
        case 'h' :return parseInt((dtEnd - dtStart) / 3600000);   
        case 'd' :return parseInt((dtEnd - dtStart) / 86400000);   
        case 'w' :return parseInt((dtEnd - dtStart) / (86400000 * 7));   
        case 'm' :return (dtEnd.getMonth()+1)+((dtEnd.getFullYear()-dtStart.getFullYear())*12) - (dtStart.getMonth()+1);   
        case 'y' :return dtEnd.getFullYear() - dtStart.getFullYear();   
     }   
}   
   
//+---------------------------------------------------   
//| ��������ַ�����������ϵͳ��toString����   
//+---------------------------------------------------   
Date.prototype.toString = function(showWeek){    
    var myDate= this;   
    var str = myDate.toLocaleDateString();   
    if (showWeek)   
     {    
        var Week = ['��','һ','��','��','��','��','��'];   
         str += ' ����' + Week[myDate.getDay()];   
     }   
    return str;   
}   
   
/*
******************************************
                        �ַ�����������                                 
******************************************
*/

/*
===========================================
//ȥ����ߵĿո�
===========================================
*/
String.prototype.LTrim = function(){
	return this.replace(/(^\s*)/g, "");
}

/*
===========================================
//ȥ���ұߵĿո�
===========================================
*/
String.prototype.Rtrim = function(){
	return this.replace(/(\s*$)/g, "");
}
/*
===========================================
//ȥ��ǰ��ո�
===========================================
*/
String.prototype.Trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
/*
===========================================
//�ж��ַ����Ƿ��
===========================================
*/
String.prototype.IsBlank = function(){
	if(this == null){
		return true;
	}else{
		if(this.replace(/(^\s*)|(\s*$)/g, "").length == 0 ){
			return true;
		}else{
			return false;
		}
	}
}
/*
===========================================
//�õ���ߵ��ַ���
===========================================
*/
String.prototype.Left = function(len){

	if(isNaN(len)||len==null){
		len = this.length;
	}else{
		if(parseInt(len)<0||parseInt(len)>this.length){
			len = this.length;
		}
	}
	return this.substr(0,len);
}
/*
===========================================
//�õ��ұߵ��ַ���
===========================================
*/
String.prototype.Right = function(len){

	if(isNaN(len)||len==null){
		len = this.length;
	}else{
		if(parseInt(len)<0||parseInt(len)>this.length){
			len = this.length;
		}
	}
	return this.substring(this.length-len,this.length);
}
/*
===========================================
//�õ��м���ַ���,ע���0��ʼ
===========================================
*/
String.prototype.Mid = function(start,len){
	return this.substr(start,len);
}
/*
===========================================
//���ַ����������һ�ַ���:λ�ô�0��ʼ
===========================================
*/
String.prototype.InStr = function(str){

	if(str==null){
		str = "";
	}
	return this.indexOf(str);
}
/*
===========================================
//���ַ����ﷴ�������һ�ַ���:λ��0��ʼ
===========================================
*/
String.prototype.InStrRev = function(str){

	if(str==null){
		str = "";
	}
	return this.lastIndexOf(str);
}
/*
===========================================
//�����ַ�����ӡ����
===========================================
*/
String.prototype.LengthW = function(){
	return this.replace(/[^\x00-\xff]/g,"**").length;
}
/*
===========================================
//�Ƿ�����ȷ��IP��ַ
===========================================
*/
String.prototype.isIP = function(){

	var reSpaceCheck = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;

	if (reSpaceCheck.test(this)){
		this.match(reSpaceCheck);
		if (RegExp.$1 <= 255 && RegExp.$1 >= 0 
			&& RegExp.$2 <= 255 && RegExp.$2 >= 0 
			&& RegExp.$3 <= 255 && RegExp.$3 >= 0 
			&& RegExp.$4 <= 255 && RegExp.$4 >= 0) {
				return true;     
		}else{
			return false;
		}
	}else{
		return false;
	}   
}
/*
===========================================
//�Ƿ�����ȷ�ĳ�����
===========================================
*/
String.prototype.isLongDate = function(){
	var r = this.replace(/(^\s*)|(\s*$)/g, "").match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/); 
	if(r==null){
		return false; 
	}
	var d = new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);
}
/*
===========================================
//�Ƿ�����ȷ�Ķ�����
===========================================
*/
String.prototype.isShortDate = function(){
	var r = this.replace(/(^\s*)|(\s*$)/g, "").match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
	if(r==null){
		return false; 
	}
	var d = new Date(r[1], r[3]-1, r[4]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}
/*
===========================================
//�Ƿ�����ȷ������
===========================================
*/
String.prototype.isDate = function(){
	return this.isLongDate()||this.isShortDate();
}
/*
===========================================
//�Ƿ����ֻ�
===========================================
*/
String.prototype.isMobile = function(){
	return /^0{0,1}13[0-9]{9}$/.test(this);
}
/*
===========================================
//�Ƿ����ʼ�
===========================================
*/
String.prototype.isEmail = function(){
	return /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(this);
}

/*
===========================================
//�Ƿ����ʱ�(�й�)
===========================================
*/
String.prototype.isZipCode = function(){
	return /^[\\d]{6}$/.test(this);
}
/*
===========================================
//�Ƿ����к���
===========================================
*/
String.prototype.existChinese = function(){
	//[\u4E00-\u9FA5]��h�֩o[\uFE30-\uFFA0]��ȫ�Ƿ�̖
	return /^[\x00-\xff]*$/.test(this);
}
/*
===========================================
//�Ƿ��ǺϷ����ļ���/Ŀ¼��
===========================================
*/
String.prototype.isFileName = function(){
	return !/[\\\/\*\?\|:"<>]/g.test(this);
}
/*
===========================================
//�Ƿ�����Ч����
===========================================
*/
String.prototype.isUrl = function(){
	return '/^http[s]?:\/\/([\w-]+\.)+[\w-]+([\w-./?%&=]*)?$/i'.test(this);
}
/*
===========================================
//�Ƿ�����Ч�����֤(�й�)
===========================================
*/
String.prototype.isIDCard = function(){
	var iSum=0;
	var info="";
	var sId = this;

	var aCity={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"};

	if(!/^\d{17}(\d|x)$/i.test(sId)){
		return false;
	}
	sId=sId.replace(/x$/i,"a");
	//�Ƿ�����
	if(aCity[parseInt(sId.substr(0,2))]==null){
		return false;
	}
	var sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
	var d=new Date(sBirthday.replace(/-/g,"/"))
	//�Ƿ�����
	if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate())){
		return false;
	}
	for(var i = 17;i>=0;i--) {
		iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11);
	}
	if(iSum%11!=1){
		return false;
	}
	return true;
}

/*
===========================================
//�Ƿ�����Ч�ĵ绰����(�й�)
===========================================
*/
String.prototype.isPhoneCall = function(){
	return /(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/.test(this);
}
/*
===========================================
//�Ƿ�������
===========================================
*/
String.prototype.isNumeric = function(flag){
	//��֤�Ƿ�������
	if(isNaN(this)){
		return false;
	}

	switch(flag){
		case null:        //����
		case "":
				return true;
		case "+":        //����
		        return                /(^\+?|^\d?)\d*\.?\d+$/.test(this);
		case "-":        //����
		        return                /^-\d*\.?\d+$/.test(this);
		case "i":        //����
		        return                /(^-?|^\+?|\d)\d+$/.test(this);
		case "+i":        //������
		        return                /(^\d+$)|(^\+?\d+$)/.test(this);                        
		case "-i":        //������
		        return                /^[-]\d+$/.test(this);
		case "f":        //������
		        return                /(^-?|^\+?|^\d?)\d*\.\d+$/.test(this);
		case "+f":        //��������
		        return                /(^\+?|^\d?)\d*\.\d+$/.test(this);                        
		case "-f":        //��������
		        return                /^[-]\d*\.\d$/.test(this);                
		default:        //ȱʡ
		        return true;                        
        }
}
/*
===========================================
//�Ƿ�����ɫ(#FFFFFF��ʽ)
===========================================
*/
String.prototype.IsColor = function(){
	var temp        = this;
	if (temp=="") return true;
	if (temp.length!=7) return false;
	return (temp.search(/\#[a-fA-F0-9]{6}/) != -1);
}
/*
===========================================
//ת����ȫ��
===========================================
*/
String.prototype.toCase = function(){
	var tmp = "";
	for(var i=0;i<this.length;i++){
		if(this.charCodeAt(i)>0&&this.charCodeAt(i)<255){
			tmp += String.fromCharCode(this.charCodeAt(i)+65248);
		}
		else{
			tmp += String.fromCharCode(this.charCodeAt(i));
		}
	}
	return tmp
}
/*
===========================================
//���ַ�������Html����
===========================================
*/
String.prototype.toHtmlEncode = function(){
	var str = this;
	str=str.replace(/&/g,"&amp;");
	str=str.replace(/</g,"&lt;");
	str=str.replace(/>/g,"&gt;");
	str=str.replace(/\'/g,"&apos;");
	str=str.replace(/\"/g,"&quot;");
	str=str.replace(/\n/g,"<br>");
	str=str.replace(/\ /g,"&nbsp;");
	str=str.replace(/\t/g,"&nbsp;&nbsp;&nbsp;&nbsp;");
	return str;
}
/*
===========================================
//ת��������
===========================================
*/
String.prototype.toDate = function(){
	try{
		return new Date(this.replace(/-/g, "\/"));
	}catch(e){
		return null;
	}
}

//-------------------- CookieUtil.js

var CookieUtil = new Object();
CookieUtil.addCookie = function(objName, objValue, objDays, path, domain, secure){//���cookie
	var str = objName + "=" + encodeURI(escape(objValue));
	if(objDays > 0){//Ϊ0ʱ���趨����ʱ�䣬������ر�ʱcookie�Զ���ʧ
		var date = new Date();
		var ms = objDays*3600*1000*24;
		date.setTime(date.getTime() + ms);
		str += "; expires=" + date.toGMTString();
	}
	str = str + ((path == null) ? "; path=/" : ("; path=" + path)) + ((domain == null) ? "" : ("; domain=" + domain)) + ((secure == true) ? "; secure" : ""); 
	document.cookie = str;
}

CookieUtil.getCookie = function(objName){//��ȡָ�����Ƶ�cookie��ֵ
	var result = null;
	var tmp,reg = new RegExp("(^| )" + objName + "=\"*([^;|^\"]*)(|;|$)","gi");
	if(tmp = reg.exec(document.cookie)){
		result = unescape(decodeURIComponent(tmp[2]));
	}
	return result;
}

CookieUtil.delCookie = function(name){//Ϊ��ɾ��ָ�����Ƶ�cookie�����Խ������ʱ���趨Ϊһ����ȥ��ʱ��
	var date = new Date();
	date.setTime(date.getTime() - 10000);
	document.cookie = name + "=a; expires=" + date.toGMTString();
}
CookieUtil.delAllCookie = function(){  
	var arrStr = document.cookie.split("; ");
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		CookieUtil.delCookie(temp[0]);
	}
}   
CookieUtil.allCookie = function(){//��ȡ���б����cookie�ַ���
	var str = document.cookie;
	if(str == ""){
		str = "û�б����κ�cookie";
	}
}


//-------------------- XSLTHelper.js


function XSLTHelper( xmlURL, xslURL  ) {
	this.xmlURL = xmlURL;  //ȡxml�ļ���url
	this.xslURL = xslURL;  //ȡ����xsl�ļ���url
}
//�жϵ�ǰ������Ƿ�֧��xslt
XSLTHelper.isXSLTSupported = function() {
	return (window.XMLHttpRequest && window.XSLTProcessor ) ||
		XSLTHelper.isIEXmlSupported();
}
//�жϵ�ǰ������Ƿ�֧��xml��xslt����
XSLTHelper.isIEXmlSupported = function() {
	if ( ! window.ActiveXObject ){
		return false;
	}		
	try { 
		new ActiveXObject("Microsoft.XMLDOM");  return true; 
	}catch(err) {
		return false; 
	}
}

XSLTHelper.prototype = {
	
	//��ȡxml��xsl�ļ����������Ͻ������ָ�������
	loadView: function( container) {
		if ( ! XSLTHelper.isXSLTSupported() ){
			return;
		}		
		this.xmlDocument   = null; //xml�ļ�
		this.xslStyleSheet = null; //xsl�ļ�

		this.container = $(container);
		new Ajax.Request( this.xmlURL,
                        {onComplete: this.setXMLDocument.bind(this)} );
		new Ajax.Request( this.xslURL,
                        {method: "GET",
                        onComplete: this.setXSLDocument.bind(this)} );
	},

	setXMLDocument: function(request) {
		this.xmlDocument = request.responseXML;
		this.updateViewIfDocumentsLoaded();
	},

	setXSLDocument: function(request) {
		this.xslStyleSheet = request.responseXML;
		this.updateViewIfDocumentsLoaded();
	},

	updateViewIfDocumentsLoaded: function() {
		if ( this.xmlDocument == null || this.xslStyleSheet == null ){
			return;
		}
		this.updateView();
	},

	updateView: function () {
		if ( ! XSLTHelper.isXSLTSupported() ){
			return;
		}
		if ( window.XMLHttpRequest && window.XSLTProcessor ){
			this.updateViewMozilla();
		}else if ( window.ActiveXObject ){
			this.updateViewIE();
		}
			
	},

	updateViewMozilla: function() {
		var xsltProcessor = new XSLTProcessor();
		xsltProcessor.importStylesheet(this.xslStyleSheet);
		var fragment = xsltProcessor.transformToFragment(this.xmlDocument, document);

		this.container.innerHTML = "";
		this.container.appendChild(fragment);
	},

	updateViewIE: function() {
		this.container.innerHTML = this.xmlDocument.transformNode(this.xslStyleSheet);
	}
	
}

//-------------------- ModuleLoader.js

function ModuleLoader( xmlURL, xsltURL, container, loadingImage) {
	this.xmlURL = xmlURL; 	//ȡxml�ļ���url
	this.xsltURL = xsltURL;	//ȡxsl�ļ���url
	this.container = container;	//��ʾxml��xsl�������ݵ�������id
	this.loadingImage = loadingImage;	//����ʱ��ʾ�ļ���ͼƬ��url
	var oThis = this;
	this.initialize();
}

ModuleLoader.prototype = {
	//ִ�м���
	load: function() {
		if ( XSLTHelper.isXSLTSupported() ){
			this.doAjaxLoad();		
		}	
		else {
			this.submitTheForm();
		}		
	},
	//��ʼ��
	initialize: function() {
		this.load();
	},
	
	//ͨ��ajax����
	doAjaxLoad: function() {
		this.showLoadingImage();
		new XSLTHelper( this.xmlURL, this.xsltURL ).loadView( this.container );
	},
	
	//��ʾ����ͼƬ
	showLoadingImage: function() {
		var newImg = document.createElement('img');
		newImg.setAttribute('src', this.loadingImage );
		$(this.container).appendChild(newImg);
	}
}

//-----------------------------floatContainer.js
//�������������ֲ��DIV��titleName--������,titleHeight--�������߶�,width--��Ϣ����,height--��Ϣ��߶�,bgOpacity--����͸����,x,y Ϊ��λ���ڵ�ƫ����
function FloatContainer(id, titleName, width, height, x, y, titleHeight, bgOpacity){
	this.id = id;
	this.bgObj = null;
	this.msgObj = null;
	this.container = null;
	this.x = (x == null? "50%" : x);;
	this.y = (y == null? "50%" : y);
	this.width = width;
	this.height = height;
	this.titleName = (titleName == null? "��ܰ��ʾ" : titleName);
	this.titleHeight = (titleHeight == null? 18 : titleHeight);
	this.bgOpacity = (bgOpacity == null? 75 : bgOpacity);//��ʾ���ڵı���͸����
	this.bordercolor = "#0057a1";//��ʾ���ڵı߿���ɫ
	this.titlecolor = "#0057a1";//��ʾ���ڵı�����ɫ
	this.draw();
}
FloatContainer.drawBackground = function(id, color, bgOpacity){
	var bgObj = document.createElement("div");
	bgObj.id = id;
	//������ʽ
	bgObj.style.opacity = (bgOpacity / 100) ;
	bgObj.style.filter = "Alpha(opacity=" + bgOpacity + ");";
	bgObj.style.backgroundColor = color;
	bgObj.style.height = "100%";
	bgObj.style.width = "100%";
	bgObj.style.marginTop = "0px";
	bgObj.style.marginLeft = "0px";
	bgObj.style.position = "absolute";
	bgObj.style.top = "0px";
	bgObj.style.left = "0px";
	bgObj.style.zIndex = 1000;
	document.body.appendChild(bgObj);//��body����Ӹ�div����
	return bgObj;
}
FloatContainer.prototype.setHTML = function(html){
	this.container.innerHTML = html;
}
FloatContainer.prototype.drawBackground = function(){
	this.bgObj = FloatContainer.drawBackground(this.id + "bgDiv", "#777", this.bgOpacity);
}
FloatContainer.prototype.drawMsg = function(){
	this.msgObj = document.createElement("div");
	this.msgObj.id = this.id + "msgDiv";
	this.msgObj.style.cssText = "position:absolute; left: " + this.x + "; top: " + this.y 
		+ "; text-algin: center; font: 12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif; background-color:#FFF; margin-left: " + this.width/(-2) + "px; margin-top:" + (this.height/(-2) + document.documentElement.scrollTop)
		+ "px; width: " + this.width + "px; height:" + this.height + "px; line-height: 25px; z-index:10001;";
	document.body.appendChild(this.msgObj);
}
FloatContainer.prototype.drawHideFrame = function(){
	var hideIframe = document.createElement("iframe");
	hideIframe.style.cssText = "position:absolute; z-index:-1;width: " + (this.width - 1) + "px; height:" + (this.height - 1) + "px; frameborder: 0;";
	this.msgObj.appendChild(hideIframe);
}
FloatContainer.prototype.drawTitle = function(){
	var msgTitleObj = document.createElement("div");
	msgTitleObj.style.cssText = "margin: 0px; padding: 3px; width:100%; background-color:" + this.bordercolor + "; border:1px solid " 
			+ this.bordercolor + "; width: " + (this.width - 8) + "px; height:" + this.titleHeight + "px; font:" + (this.titleHeight - 3) + "px Verdana, Geneva, Arial, Helvetica, sans-serif; color: #FFF;";
	msgTitleObj.innerHTML = "<div style='display:inline;float:left;width:80%;text-align:left;'>" + this.titleName 
		+ "</div><div style='display:inline;float:right;width:20%;text-align:right;cursor:pointer;' onclick='" + this.id + ".removeObj();'>�ر�</div><div class='clear'></div>";
	this.msgObj.appendChild(msgTitleObj);
}
FloatContainer.prototype.drawFloatContainer = function(){
	this.container = document.createElement("div");
	this.container.id = this.id + "floatContainer";
	this.container.style.cssText = "margin: 0px; padding: 0px; background-color:#FFF; border:1px solid " + this.bordercolor + "; width: " + (this.width - 2) + "px; height:" + (this.height - this.titleHeight - 2) + "px;overflow:auto;";
	this.msgObj.appendChild(this.container);
}
FloatContainer.prototype.draw = function(){
	this.removeObj();
	//this.drawBackground();
	this.drawMsg();
	if(Browser.isIE6()){
		this.drawHideFrame();
	}
	this.drawTitle();
	this.drawFloatContainer();
}

//�����Ϣ����
FloatContainer.prototype.removeObj = function(){//����������������¼�
	//ɾ������div
	if(this.bgObj != null){
		$(this.bgObj).remove();
	}
	//ɾ������
	if(this.msgObj != null){
		$(this.msgObj).remove();	
	}
	//location.reload();
}	
	
//------------------net.js

var Net = {};
Net.type = {};
Net.type.xml = "xml";
Net.type.json = "json";
Net.type.script ="script";
Net.type.ignore = "ignore";

Net.Listener = function(){}
Net.Listener.prototype.callBack = function(){}

Net.ContentLoader = function(listener, url, params ,type){
	var background = this.showLoadingImage();
	this.listener = listener;
	this.url = url;
	this.onerror = (listener.onerror) ? listener.onerror : this.defaultError;
	if (!type){
		type = Net.type.xml;
	}
	params = this.encode(params);
	$(background).bind("ajaxComplete", this.removeLoadingImage).bind("ajaxError", this.onerror);
	if ( type == "ignore"){
		$.post(url, params, listener.callBack);
	}else{
		$.post(url, params, listener.callBack, type);
	}
}

Net.ContentLoader.prototype.defaultError = function(){
	//alert("XMLHttpRequest��֧�ֿ�����ʵ�,����url��");
}

Net.ContentLoader.prototype.encode = function(arg){
	arg = encodeURI(arg);
	return encodeURI(arg);//���Σ��ܹؼ�
}
Net.ContentLoader.prototype.showLoadingImage = function(){
	return FloatContainer.drawBackground("ajaxLoadingBgDiv", "#FFF", 0);
}
Net.ContentLoader.prototype.removeLoadingImage = function(info){
	$(info.target).remove();
}
//--------------------------------------------------trimPath.js
var TrimPath;
(function(){
	//alert("����ִ��TrimPath"+TrimPath)
if(TrimPath==null)
	TrimPath=new Object();
if(TrimPath.evalEx==null)
	TrimPath.evalEx=function(src){return eval(src);};
var UNDEFINED;
if(Array.prototype.pop==null)
	Array.prototype.pop=function(){
		if(this.length===0){
			return UNDEFINED;
		}
		return this[--this.length];
	};
if(Array.prototype.push==null)
	Array.prototype.push=function(){
		for(var i=0;i<arguments.length;++i){this[this.length]=arguments[i];}
		return this.length;
	};
TrimPath.parseTemplate=function(tmplContent,optTmplName,optEtc){
	//alert("ִ�ж�");
	if(optEtc==null)
	optEtc=TrimPath.parseTemplate_etc;
	var funcSrc=parse(tmplContent,optTmplName,optEtc);
	var func=TrimPath.evalEx(funcSrc,optTmplName,1);
	if(func!=null)
	return new optEtc.Template(optTmplName,tmplContent,funcSrc,func,optEtc);
	return null;
}
try{
	String.prototype.process=function(context,optFlags){
	var template=TrimPath.parseTemplate(this,null);
	if(template!=null)
		return template.process(context,optFlags);
	return this;
}
}catch(e){
	
}
TrimPath.parseTemplate_etc={};
TrimPath.parseTemplate_etc.statementTag="forelse|for|if|elseif|else|var|macro";
//������������� if else for �� ������
TrimPath.parseTemplate_etc.statementDef={
	"if":{delta:1,prefix:"if (",suffix:") {",paramMin:1},
	"else":{delta:0,prefix:"} else {"},
	"elseif":{delta:0,prefix:"} else if (",suffix:") {",paramDefault:"true"},
	"/if":{delta:-1,prefix:"}"},
	"for":{delta:1,paramMin:3,
	prefixFunc:function(stmtParts,state,tmplName,etc){
	if(stmtParts[2]!="in")
	throw new etc.ParseError(tmplName,state.line,"bad for loop statement: "+stmtParts.join(' '));
	var iterVar=stmtParts[1];
	var listVar="__LIST__"+iterVar;
	return["var ",listVar," = ",stmtParts[3],";",
	"var __LENGTH_STACK__;",
	"if (typeof(__LENGTH_STACK__) == 'undefined' || !__LENGTH_STACK__.length) __LENGTH_STACK__ = new Array();",
	"__LENGTH_STACK__[__LENGTH_STACK__.length] = 0;",
	"if ((",listVar,") != null) { ",
	"var ",iterVar,"_ct = 0;",
	"for (var ",iterVar,"_index in ",listVar,") { ",
	iterVar,"_ct++;",
	"if (typeof(",listVar,"[",iterVar,"_index]) == 'function') {continue;}",
	"__LENGTH_STACK__[__LENGTH_STACK__.length - 1]++;",
	"var ",iterVar," = ",listVar,"[",iterVar,"_index];"].join("");
	}},
	"forelse":{delta:0,prefix:"} } if (__LENGTH_STACK__[__LENGTH_STACK__.length - 1] == 0) { if (",suffix:") {",paramDefault:"true"},
	"/for":{delta:-1,prefix:"} }; delete __LENGTH_STACK__[__LENGTH_STACK__.length - 1];"},
	"var":{delta:0,prefix:"var ",suffix:";"},
	"macro":{delta:1,
	prefixFunc:function(stmtParts,state,tmplName,etc){
	var macroName=stmtParts[1].split('(')[0];
	return["var ",macroName," = function",
	stmtParts.slice(1).join(' ').substring(macroName.length),
	"{ var _OUT_arr = []; var _OUT = { write: function(m) { if (m) _OUT_arr.push(m); } }; "].join('');
	}},
	"/macro":{delta:-1,prefix:" return _OUT_arr.join(''); };"}
}
//����������������������eat escape capitalize default
TrimPath.parseTemplate_etc.modifierDef={
	"eat":function(v){return"";},
	"escape":function(s){return String(s).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;");},
	"capitalize":function(s){return String(s).toUpperCase();},
	"default":function(s,d){return s!=null?s:d;}
}
TrimPath.parseTemplate_etc.modifierDef.h=TrimPath.parseTemplate_etc.modifierDef.escape;
TrimPath.parseTemplate_etc.Template=function(tmplName,tmplContent,funcSrc,func,etc){
	this.process=function(context,flags){
		if(context==null)
		context={};
		
		if(context._MODIFIERS==null || context._MODIFIERS==undefined) {		
			context._MODIFIERS={};
		}
		if(context.defined==null)
		context.defined=function(str){return(context[str]!=undefined);};
		
		for(var k in etc.modifierDef){
			if(context._MODIFIERS[k]==null)
			context._MODIFIERS[k]=etc.modifierDef[k];
		}
		if(flags==null)
		flags={};
		var resultArr=[];
		//�������
		var resultOut={write:function(m){resultArr.push(m);}};
		try{
			func(resultOut,context,flags);
		}catch(e){
			if(flags.throwExceptions==true)
			throw e;
			var result=new String(resultArr.join("")+"[ERROR: "+e.toString()+(e.message?'; '+e.message:'')+"]");
			result["exception"]=e;
			return result;
		}
		return resultArr.join("");
	}
	this.name=tmplName;
	this.source=tmplContent;
	this.sourceFunc=funcSrc;
	this.toString=function(){return"TrimPath.Template ["+tmplName+"]";}
}
//���﷨�Ϸ�������
TrimPath.parseTemplate_etc.ParseError=function(name,line,message){
	this.name=name;
	this.line=line;
	this.message=message;
}
//��ϴ�����Ϣ �����ַ���
TrimPath.parseTemplate_etc.ParseError.prototype.toString=function(){
	return("TrimPath template ParseError in "+this.name+": line "+this.line+", "+this.message);
}
//���﷨�Ϸ���
var parse=function(body,tmplName,etc){
	//alert("ִ����"+body.length);
	body=cleanWhiteSpace(body);
	var funcText=["var TrimPath_Template_TEMP = function(_OUT, _CONTEXT, _FLAGS) { with (_CONTEXT) {"];
	var state={stack:[],line:1};
	var endStmtPrev=-1;
	while(endStmtPrev+1<body.length){
		var begStmt=endStmtPrev;
		begStmt=body.indexOf("{",begStmt+1);
			while(begStmt>=0){
			var endStmt=body.indexOf('}',begStmt+1);
			var stmt=body.substring(begStmt,endStmt);
			//alert(begStmt+"��"+endStmt+"����Ϊ��"+stmt);
			var blockrx=stmt.match(/^\{(cdata|minify|eval)/);
				//alert(blockrx)
			if(blockrx){
				var blockType=blockrx[1];
				var blockMarkerBeg=begStmt+blockType.length+1;
				var blockMarkerEnd=body.indexOf('}',blockMarkerBeg);
				if(blockMarkerEnd>=0){
				var blockMarker;
				if(blockMarkerEnd-blockMarkerBeg<=0){
				blockMarker="{/"+blockType+"}";
				}else{
				blockMarker=body.substring(blockMarkerBeg+1,blockMarkerEnd);
				}
				var blockEnd=body.indexOf(blockMarker,blockMarkerEnd+1);
				if(blockEnd>=0){
				emitSectionText(body.substring(endStmtPrev+1,begStmt),funcText);
				var blockText=body.substring(blockMarkerEnd+1,blockEnd);
				if(blockType=='cdata'){
				emitText(blockText,funcText);
				}else if(blockType=='minify'){
				emitText(scrubWhiteSpace(blockText),funcText);
				}else if(blockType=='eval'){
				if(blockText!=null&&blockText.length>0)
				funcText.push('_OUT.write( (function() { '+blockText+' })() );');
				}
				begStmt=endStmtPrev=blockEnd+blockMarker.length-1;
				}
				}
			}else if(body.charAt(begStmt-1)!='$'&& body.charAt(begStmt-1)!='\\'){
				var offset=(body.charAt(begStmt+1)=='/'?2:1);
				if(body.substring(begStmt+offset,begStmt+10+offset).search(TrimPath.parseTemplate_etc.statementTag)==0)
					break;
			}
			begStmt=body.indexOf("{",begStmt+1);
			}
			if(begStmt<0)
			break;
			var endStmt=body.indexOf("}",begStmt+1);
			if(endStmt<0)
			break;
			emitSectionText(body.substring(endStmtPrev+1,begStmt),funcText);
			emitStatement(body.substring(begStmt,endStmt+1),state,funcText,tmplName,etc);
			endStmtPrev=endStmt;
			}
		emitSectionText(body.substring(endStmtPrev+1),funcText);
		if(state.stack.length!=0)
		throw new etc.ParseError(tmplName,state.line,"unclosed, unmatched statement(s): "+state.stack.join(","));
		funcText.push("}}; TrimPath_Template_TEMP");
		return funcText.join("");
		}
	
	var emitStatement=function(stmtStr,state,funcText,tmplName,etc){
	var parts=stmtStr.slice(1,-1).split(' ');
	var stmt=etc.statementDef[parts[0]];
	//alert(stmt+"����")
	if(stmt==null){
	emitSectionText(stmtStr,funcText);
	return;
	}
	if(stmt.delta<0){
	if(state.stack.length<=0)
	throw new etc.ParseError(tmplName,state.line,"close tag does not match any previous statement: "+stmtStr);
	state.stack.pop();
	}
	if(stmt.delta>0)
	state.stack.push(stmtStr);
	if(stmt.paramMin!=null&& stmt.paramMin>=parts.length)
		throw new etc.ParseError(tmplName,state.line,"statement needs more parameters: "+stmtStr);
	if(stmt.prefixFunc!=null)
		funcText.push(stmt.prefixFunc(parts,state,tmplName,etc));
	else
		funcText.push(stmt.prefix);
	if(stmt.suffix!=null){
		if(parts.length<=1){
			if(stmt.paramDefault!=null)
				funcText.push(stmt.paramDefault);
		}else{
			for(var i=1;i<parts.length;i++){
			if(i>1)
				funcText.push(' ');
				funcText.push(parts[i]);
			}
		}
		funcText.push(stmt.suffix);
	}
	}
	var emitSectionText=function(text,funcText){
		if(text.length<=0)
			return;
		var nlPrefix=0;
		var nlSuffix=text.length-1;
		while(nlPrefix<text.length&&(text.charAt(nlPrefix)=='\n'))
			nlPrefix++;
		while(nlSuffix>=0&&(text.charAt(nlSuffix)==' '||text.charAt(nlSuffix)=='\t'))
			nlSuffix--;
		if(nlSuffix<nlPrefix)
			nlSuffix=nlPrefix;
		if(nlPrefix>0){
			funcText.push('if (_FLAGS.keepWhitespace == true) _OUT.write("');
			var s=text.substring(0,nlPrefix).replace('\n','\\n');
			if(s.charAt(s.length-1)=='\n')
				s=s.substring(0,s.length-1);
			funcText.push(s);
			funcText.push('");');
		}
		var lines=text.substring(nlPrefix,nlSuffix+1).split('\n');
		for(var i=0;i<lines.length;i++){
			emitSectionTextLine(lines[i],funcText);
			if(i<lines.length-1)
				funcText.push('_OUT.write("\\n");\n');
		}
		if(nlSuffix+1<text.length){
			funcText.push('if (_FLAGS.keepWhitespace == true) _OUT.write("');
			var s=text.substring(nlSuffix+1).replace('\n','\\n');
			if(s.charAt(s.length-1)=='\n')
				s=s.substring(0,s.length-1);
			funcText.push(s);
			funcText.push('");');
		}
	}
	var emitSectionTextLine=function(line,funcText){
		var endMarkPrev='}';
		var endExprPrev=-1;
		while(endExprPrev+endMarkPrev.length<line.length){
		var begMark="${",endMark="}";
		var begExpr=line.indexOf(begMark,endExprPrev+endMarkPrev.length);
		if(begExpr<0)
		break;
		if(line.charAt(begExpr+2)=='%'){
		begMark="${%";
		endMark="%}";
		}
		var endExpr=line.indexOf(endMark,begExpr+begMark.length);
		if(endExpr<0)
		break;
		emitText(line.substring(endExprPrev+endMarkPrev.length,begExpr),funcText);
		var exprArr=line.substring(begExpr+begMark.length,endExpr).replace(/\|\|/g,"#@@#").split('|');
		for(var k in exprArr){
		if(exprArr[k].replace)
		exprArr[k]=exprArr[k].replace(/#@@#/g,'||');
		}
		funcText.push('_OUT.write(');
		emitExpression(exprArr,exprArr.length-1,funcText);
		funcText.push(');');
		endExprPrev=endExpr;
		endMarkPrev=endMark;
		}
		emitText(line.substring(endExprPrev+endMarkPrev.length),funcText);
	}
	var emitText=function(text,funcText){
		if(text==null|| text.length<=0)
			return;
		text=text.replace(/\\/g,'\\\\');
		text=text.replace(/\n/g,'\\n');
		text=text.replace(/"/g,'\\"');
		funcText.push('_OUT.write("');
		funcText.push(text);
		funcText.push('");');
	}
	var emitExpression=function(exprArr,index,funcText){
		var expr=exprArr[index];
		if(index<=0){
			funcText.push(expr);
			return;
		}
		var parts=expr.split(':');
		funcText.push('_MODIFIERS["');
		funcText.push(parts[0]);
		funcText.push('"](');
		emitExpression(exprArr,index-1,funcText);
		if(parts.length>1){
			funcText.push(',');
			funcText.push(parts[1]);
		}
		funcText.push(')');
	}
	var cleanWhiteSpace=function(result){
		result=result.replace(/\t/g,"    ");
		result=result.replace(/\r\n/g,"\n");
		result=result.replace(/\r/g,"\n");
		result=result.replace(/^(\s*\S*(\s+\S+)*)\s*$/,'$1');
		return result;
	}
	var scrubWhiteSpace=function(result){
		result=result.replace(/^\s+/g,"");
		result=result.replace(/\s+$/g,"");
		result=result.replace(/\s+/g," ");
		result=result.replace(/^(\s*\S*(\s+\S+)*)\s*$/,'$1');
		return result;
	}
	TrimPath.parseDOMTemplate=function(elementId,optDocument,optEtc){
		if(optDocument==null)
			optDocument=document;
		var element=optDocument.getElementById(elementId);
		var content=element.value;
		if(content==null)
			content=element.innerHTML;
		content=content.replace(/&lt;/g,"<").replace(/&gt;/g,">");
		return TrimPath.parseTemplate(content,elementId,optEtc);
	}
	TrimPath.processDOMTemplate=function(elementId,context,optFlags,optDocument,optEtc){
		return TrimPath.parseDOMTemplate(elementId,optDocument,optEtc).process(context,optFlags);
	}
}
)();
//------------------------------------------------------------------------------------------------------------------
TrimPath.parseTemplate_etc.modifierDef.escape=function(s){
	return String(s).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;");
}
TrimPath.parseTemplate_etc.modifierDef.escapeButAmp=function(s){
	return String(s).replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;");
}
TrimPath.parseTemplate_etc.modifierDef.js_string=function(s){
	return String(s).replace(/\\/g,"\\\\").replace(/'/g,"\\&#39;").replace(/"/g,"\\&#34;");
}
TrimPath.parseTemplate_etc.modifierDef.substring=function(s,s1,s2){
	return String(s).substr(s1,s2);
}
TrimPath.parseTemplate_etc.modifierDef.replace=function(s,s1,s2){
	return String(s).replace(s1,s2)
}
TrimPath.parseTemplate_etc.modifierDef.parentDomain=function(s){
	return DomainMap.getParentDomain(s);
}
TrimPath.parseTemplate_etc.modifierDef.to_url=function(s){
	if(s==null)
	return"#";
	var url=/^(.+):\/\/(.*)$/;
	if(!url.test(s))
	s="http://"+s;
	return s;
}
TrimPath.parseTemplate_etc.modifierDef.showBr=function(s){
	return String(s).replace(/\n/g,"<br>");
}
TrimPath.parseTemplate_etc.modifierDef.erase=function(s,i){
	s=s+'';
	if(s.length<=i)
	return s;
	return s.substr(0,i)+'...';
}
TrimPath.parseTemplate_etc.modifierDef.getIPNames=function(s,ip){
	if(s!=null&&s!="")
	return s;
	if(ip!=null&&ip!=""&&ip!=undefined){
	var i=ip.lastIndexOf(".");
	return"IP: "+ip.substring(0,i)+".*";
	}else{
	return"δ֪�����û�";
	}
}
TrimPath.parseTemplate_etc.modifierDef.toTimeLength=function(str){
	var t=parseInt(str);
	var s=t%60+'';if(s.length==1)s='0'+s;
	var m=Math.floor(t/60)+'';if(m.length==1)m='0'+m;
	return m+':'+s;
}
TrimPath.parseTemplate_etc.modifierDef.to_img=function(s,url){
	if(s==null||s.indexOf('.jpg')<0)
	return url;
	return s;
}
TrimPath.parseTemplate_etc.modifierDef.profile_img=function(s){
	return TrimPath.parseTemplate_etc.modifierDef.to_img(s,"http://st.blog.163.com/style/common/user_default_small.gif");
}
String.prototype.processUseCache=function(context,optFlags){
	//alert("ִ��һ");
	if(this.__template__==null)
	this.__template__=TrimPath.parseTemplate(this,null);
	if(this.__template__!=null)
	return this.__template__.process(context,optFlags);
	return this;
}


String.prototype.parseQuery = String.prototype.toQueryParams;
var $break=new Object();
var $continue=new Object();
//------------------------------------------------------------------------------------------------------------

///--------------------------------------------------------------------��������ж�--------------
var Browser = {};
Browser.isIE = function(){
	return(document.all&&window.ActiveXObject)?true:false;
};
Browser.isIE5Up = function(){
	return(Browser.isIE()&&document.getElementById)?true:false;
};
Browser.isIE6 = function(){
	return Browser.isIE()&&(!Browser.isIE7());
}
Browser.isIE7 = function(){
	var ua = navigator.userAgent;
	var msieOffset = ua.indexOf("MSIE ");
	if(msieOffset<0){
		return 0;
	}
	var num = parseFloat(ua.substring(msieOffset+5,ua.indexOf(";",msieOffset)));
	return num == 7;
}
Browser.isFirefox = function(){
	return(document.implementation&&document.implementation.createDocument&&!window.opera)?true:false;
};
Browser.isFirefox1_5 = function(){
	return window.navigator.userAgent.indexOf('Firefox/1.5')!=-1;
};
Browser.isFirefox2Up = function(){
	return window.navigator.userAgent.indexOf('Firefox/2')!=-1;
};
Browser.isOpera = function(){
	return(window.opera)?true:false;
};
Browser.fixEvent = function(e){
  var evt = (typeof e == "undefined") ? window.event : e;
  return evt;
}

Browser.srcElement = function(e){
  if (typeof e == "undefined") e = window.event;
  var src = document.all ? e.srcElement : e.target;

  return src;
}
Browser.getPosition = function(o){
    var t = o.offsetTop;
    var l = o.offsetLeft;
    while(o = o.offsetParent)
    {
        t += o.offsetTop;
        l += o.offsetLeft;
    }
    var pos = {top:t,left:l};
    return pos;
}
///---------------------------------------------------------------����-----��������ж�--------------

//------------------------------------------------check.js-------------------------
var Check = {};
Check.auto_check_form = function(input_arry, errorInputObject){
	for(var num in input_arry){
		var alert_flag = false;
		var currentElement = $("#" + input_arry[num][0]);
		switch(input_arry[num][2]){
			case "checkBox":
			if(!Check.checkBox(input_arry[num][0]))
				alert_flag=true;
			break;
			case "check":
				if(!Check.check(currentElement.val()))
					alert_flag=true;
				break;
			case "choose":
				if(!Check.choose($("#" + input_arry[num][0].val())))
					alert_flag=true;
				break;	
			case "maxnum"://����ַ���
				if(!Check.checkNum(currentElement.val(), input_arry[num][3]))
					alert_flag=true;
				break;
			case "between"://�ڶ���֮����ַ���
				if(!Check.checkNumBetween(currentElement.val(), input_arry[num][3], input_arry[num][4]))
					alert_flag=true;
				break;
			case "radio": //��֤radiobox
				if(!Check.radio(currentElement.val()))
					alert_flag=true;
				break;
			case "test": //��֤�����Ƿ��ظ�
				if(!Check.IsSameName(currentElement.val(), $("#" + input_arry[num][3]).val()))
					alert_flag=true;
				break;
			case "year":  //��֤��λ���
				if(!Check.isYear(currentElement.val()))
					alert_flag=true;
				break;
			case "year2":  //��֤��λ���
				if(!Check.isYear2(currentElement.val()))
					alert_flag=true;
				break;
			case "month":  //��֤�·�
				if(!Check.isMonth(currentElement.val()))
					alert_flag=true;
				break;
			case "partdate":  //��֤����
				if(!Check.isYMonth(currentElement.val()))
					alert_flag=true;
				break;
			case "email":  //��֤Email
				if(!Check.isEmail(currentElement.val()))
					alert_flag=true;
				break;
			case "phone":  //��֤�绰
				if(!Check.isPhone(currentElement.val()))
					alert_flag=true;
				break;
			case "zip":  //��֤�ʱ�
				if(!Check.isZip(currentElement.val()))
					alert_flag=true;
				break;
			case "num":  //��֤����
				if(!Check.isNum(currentElement.val()))
					alert_flag=true;
				break;
			case "float":  //��֤������
				if(!Check.isFloat(currentElement.val()))
					alert_flag=true;
				break;
			case "diff": //��֤У����
				if(!Check.diffdate(currentElement.val(), $("#" + input_arry[num][3]).val()))
					alert_flag=true;
				break;
			case "d_f": //�Ƚ�����
				if(!Check.date_f(currentElement.val(), $("#" + input_arry[num][3]).val()))
					alert_flag=true;
				break;
			case "fulldate": //��֤����
				if(!Check.isDate(currentElement.val()))
					alert_flag=true;
				break;
			case "http": //��֤URL
				if(!Check.isHttp(currentElement.val()))
					alert_flag=true;
				break;
			case "mobile": //��֤�ֻ���
				if(!Check.isMobile(currentElement.val()))
					alert_flag=true;
				break;
			case "userPass": //��֤��������
				if(!Check.isSamePwd(currentElement.val(), $("#" + input_arry[num][3]).val()))
					alert_flag=true;
				break;
			case "cday": //
				if(!Check.check_date(currentElement.val(), $("#" + input_arry[num][3]).val(), $("#" + input_arry[num][4]).val()))
					alert_flag=true;
				break;
			case "cdate": //
				if(!Check.isDate(currentElement.val(), $("#" + input_arry[num][3]).val()))
					alert_flag=true;
				break;
			case "reg": 
				if(!Check.RegExption(currentElement.val(), $("#" + input_arry[num][3]).val()))
					alert_flag=true;
				break;
			case "china": 
				if(Check.isChinese(currentElement.val()))
					alert_flag=true;
			break;   
		}
		if( alert_flag){//��֤��ʾ����
			if(errorInputObject == null){
				alert(input_arry[num][1]);
			}else{
				errorInputObject.style.display = "";
				errorInputObject.innerHTML = "<img src='/images/error.gif'/>" + input_arry[num][1];
			}
			
			if(currentElement.attr("type") != "hidden"){
				currentElement.focus();
			}
			return false;
		}else{
			if(errorInputObject != null){
				errorInputObject.style.display = "";
				errorInputObject.innerHTML = "<img src='/images/correct.gif'/>";
			}
		}
	}
	return true;//��֤ͨ�������棻
}
Check.checkBox = function(checkBoxName){
	var size = $("[name=" + checkBoxName + "]:checked").size();
	if(size == 0){
		return false;
	}else{
		return true;
	}
}
Check.RegExption = function(txt,reg) {
	var pattern = new RegExp(reg,"gi")
	if(pattern.test(txt.Trim())) return true;
	return false;
}

Check.check_date = function(txt1,txt2,txt3) {//��֤��
	var array1=txt2.replace(/[\-\/\.]/gi,"-").split("-");
	var month1=array1[1];
	var day1=array1[2];
	var month2=txt1;
	var day2=txt3;
	if((parseInt(month1)+ parseInt(day1))!=(parseInt(month2) +parseInt(day2))) return false;
	return true;
}

Check.date_f = function(txt1,txt2) {//�Ƚ�����
	var array1=txt1.replace(/[\-\/\.]/gi,"-").split("-");
	var array2=txt2.replace(/[\-\/\.]/gi,"-").split("-");
	var year1=array1[0];
	var month1=array1[1];
	var day1=array1[2];
	var year2=array2[0];
	var month2=array2[1];
	var day2=array2[2];
	if((parseInt(year1)+parseInt(month1)+ parseInt(day1))>=(parseInt(year2)+parseInt(month2)+parseInt(day2))) return false;
	return true;
}

Check.check = function(txt){
	var pattern = new RegExp("[^\b|  ]","gi");
	if ( txt == null || !pattern.test(txt.Trim())) return false;
	return true;
}
//����ַ���
Check.checkNum = function(txt1,txt2){//maxnum
	if ( parseInt(txt1.length) > parseInt(txt2)) return false;
	return true;
}

//�ڶ���֮��
Check.checkNumBetween = function(txt1,txt2,txt3){//between
	if ( parseInt(txt1.length)>=parseInt(txt2)&&parseInt(txt1.length)<=parseInt(txt3))  return true;
	return false;
}

Check.choose = function(txt){
	if ( parseInt(txt)==0) return false;
	return true;
}

Check.radio = function(txt){
	if(!txt.checked==false) return false;
	return true;
}

Check.IsSameName = function(txt,test){
	var array=test.split(",");
	for(var i=0;i<array.length;i++){
		if (array[i]==txt){ 
			return false;
		break;
		}
	}
	return true;
}

Check.testdelete = function(){
	if (confirm("��ȷ��Ҫɾ��!")) return true;    
	return false;
}
	
	//------------------------- By danaus 10-21
Check.isYear = function(txt){  //��֤���,case "year" 
	var str = txt.Trim()
	var reg =/^([1-9]{1})\d{3}$/;
	if( reg.test(str))
		return true;
	return false;
}
	
Check.isYear2 = function(txt){  //��֤��λ���,case "year2" 
	var str = txt.Trim()
	var reg =/^\d{2}$/;
	if( reg.test(str)) return true;
	return false;
}
	
Check.isYMonth = function(txt){//��֤����,case "partdate"
	var str = txt.Trim()
	var reg = /^([1-9]{1}\d{3})([\-\/\.])(0?[1-9]|1?[0-2])$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isMonth = function(txt){//��֤��,case "month"
	var str = txt.Trim()
	var reg = /^(0?[1-9]|1?[0-2])$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isDay = function(txt){//��֤��,case "day"
	var str = txt.Trim()
	var reg = /^(0?[1-9]|[1-2]?[0-9]|3?[0-1])$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isMDay = function(txt){//��֤����,case "m_day"
	var str = txt.Trim()
	var reg = /^(0?[1-9]|1?[0-2])[\.\-\/](0?[1-9]|[1-2]?[0-9]|3?[0-1])$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isDate = function(txt){//��֤����,case "fulldate"
	var str = txt.Trim()
	var r = str.match(/^([1-9]{1}\d{3})(-)(\d{1,2})\2(\d{1,2})$/);
	if(r == null)return false; 
	var d = new Date(r[1], r[3]-1, r[4]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}

Check.isEmail = function(txt){//��֤Email,case "email"
	var str = txt.Trim()
	var reg =/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if( reg.test(str)) return true;
	return false;
}

Check.isPhone = function(txt){//��֤�绰,case "phone"
	var str = txt.Trim()
	var reg =/^(\d{3,4}\-)*([1-9]{1})(\d{6,7})$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isZip = function(txt){//��֤�ʱ�,case "zip"
	var str = txt.Trim()
	var reg =/^([1-9]{1})(\d{5})$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isInt = function(txt){//��֤��Ϊ0������,case "int"
	var str = txt.Trim()
	var reg =/^([1-9]{1})\d|.*$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isInto = function(txt){//��֤����,case "into"/^\d+$/
	var str = txt.Trim()
	var reg =/^([0-9]{1})\d*$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isNum = function(txt){//��֤����,case "num"
	var str = txt.Trim()
	var reg =/^\d+$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isFloat = function(txt){//��֤������,case "float"
	var str = txt.Trim()
    var reg =/^\d{1,10}\.*/;
	if( reg.test(str)) return true;
	return false;
}

Check.MyTrim = function(Str){//ȥǰ��ո�
	re = /^\s+/gi;
	newStr = Str.replace(re,"");
	return newStr;
}

Check.isMobile = function(txt){//��֤�ֻ���,case "mobile"
	var str = txt.Trim()
	var reg =/^0?(13[0-9]{1})\d{8}$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isHttp = function(txt){//��֤URL,case "http"
	var str = txt.Trim()
	var reg=/^(http:\/\/)?[w]{3}\.[\w]+\.[\w]{2,3}$/;
	if( reg.test(str)) return true;
	return false;
}

Check.isSamePwd = function(txt1,txt2){//��֤��������,case "pwd"
	var str1 = txt1.Trim()
	var str2 = txt2.Trim()
	return(str1==str2);
}
Check.isChinese = function(txt){//��֤�Ƿ�Ϊ����,case "china"
	var str = txt.Trim()
	var reg=/[^\x00-\xff]/;
	if( reg.test(str)) return false;
	return true;
}
Check.KeyIsNumber = function(KeyCode){  //
	//���������ַ�����0-9֮�䣬������backspace��DEL��,С����
	if(((KeyCode > 47) && (KeyCode < 58)) || (KeyCode == 8) || (KeyCode == 46) || (KeyCode == 190)||((KeyCode > 95) && (KeyCode < 106)) || (KeyCode == 110) || (KeyCode == 9)){
		return true;
	}
	else{
		return false;
	}
}
Check.isEmpty = function( val ){
	switch (typeof(val)){
		case 'string':
			return val.Trim().length == 0 ? true : false;
			break;
		case 'number':
			return val == 0;
			break;
		case 'object':
			return val == null;
			break;
		case 'array':
			return val.length == 0;
			break;
		default:
			return true;
	}
}
//-------------------------highLight.js----------------------
var HighLight = {};
HighLight.repace = function(key) {
	if(key.Trim().length == 0){
		return;
	}
    var key = key.split(" ");
    for (var i = 0; i < key.length; i++) {
    	var range = null;
		if(document.createRange){
			range = document.createRange();
		}else{
			range = document.body.createTextRange(); 
		}
		if(range.findText){
			while(key[i] != "" && range.findText(key[i])){
				range.pasteHTML(range.text.fontcolor("#ff5500"));
				range.collapse(true);
			}
		}else{ 
			var s,n;
			s = window.getSelection();
			while(key[i] != "" && window.find(key[i])){
				var n = document.createElement("span");
				n.style.color="#ff5500";
			    try{
			    	s.getRangeAt(0).surroundContents(n);
			    }catch (e){}	
			}
		}
    } 
}
//-------------------------------iframe.js--------------
var FrameTool = {};
FrameTool.tuneHeight = function(frameName) {   
	var frm = $("#" + frameName);   
	var subWeb = document.frames ? document.frames[frameName].document : frm.contentDocument;   
	if(frm != null && subWeb != null) {
		frm.height = subWeb.body.scrollHeight;
	}   
}
//------------------------------RadioUtil.js-----------
var RadioUtil = {};
RadioUtil.GetRadioValue = function(RadioName){
	var obj;    
	obj = document.getElementsByName(RadioName);
	if(obj != null){
		var i;
		for(i = 0;i < obj.length; i++){
			if(obj[i].checked){
				return obj[i].value;            
			}
		}
	}
    return null;
}

/* $Id: ListTable.js 14216 2008-03-10 02:27:21Z testyang $ */

var ListTable = {};

ListTable.query = "query";
ListTable.filter = new Object;
ListTable.url = location.href.lastIndexOf("?") == -1 ? location.href.substring((location.href.lastIndexOf("/")) + 1) : location.href.substring((location.href.lastIndexOf("/")) + 1, location.href.lastIndexOf("?"));
ListTable.url += "?is_ajax=1";

/**
 * ����һ���ɱ༭��
 */
ListTable.edit = function(obj, onblurListener, id){
	var tag = obj.firstChild.tagName;

	if (typeof(tag) != "undefined" && tag.toLowerCase() == "input"){
		return;
	}

	/* ����ԭʼ������ */
	var org = obj.innerHTML;

	/* ����һ������� */
	var txt = document.createElement("input");
	txt.value = (org == 'N/A') ? '' : org;
	txt.style.width = (obj.offsetWidth + 12) + "px" ;

	/* ���ض����е����ݣ������������뵽������ */
	obj.innerHTML = "";
	obj.appendChild(txt);
	txt.focus();

	/* �༭�������¼������� */
	txt.onkeypress = function(e){
		var evt = Browser.fixEvent(e);
		var obj = Browser.srcElement(e);

		if (evt.keyCode == 13){
			obj.blur();
			return false;
		}

		if (evt.keyCode == 27){
			obj.parentNode.innerHTML = org;
		}
	}

	/* �༭��ʧȥ����Ĵ����� */
	txt.onblur = function(e){
		var value = txt.value.Trim();
		if (value.length > 0 && value != org){
			onblurListener.apply(this, [id, value, obj]);
		}else{
			obj.innerHTML = org;
		}		
	}
	
	txt.callBack = function(){
		obj.innerHTML = txt.value.Trim();
	}
}

/**
 * �л�״̬
 */
ListTable.toggle = function(obj, toggleListener, id){
	obj.callBack = function(){
		obj.src =  (value == "false") ? '../../admin/images/yes.gif' : '../../admin/images/no.gif';
		obj.isVaild = value;
	}
	var org = obj.isVaild;
	var value = (org == "false")?"true":"false";
	toggleListener.apply(obj, [id, value]);

}

/**
 * ɾ���б��е�һ����¼
 */
ListTable.remove = function(obj, id, cfm, removeListener){
	if (confirm(cfm)){
		removeListener.apply(obj, [id]);
	}
}
/**
 * �����Ƿ���ͬ���ļ�¼
 */
ListTable.check = function(cellNum, level, name, object){
	var previousObject = object.previousSibling;
	var nextObject = object.nextSibling;
	while(previousObject != null){
		var tempLevel = previousObject.level;
		if(tempLevel == level){
			var tempSpan = previousObject.cells[cellNum].getElementsByTagName("span");
			tempSpan = tempSpan[0];
			if(tempSpan.innerHTML == name){
				return  false;
			}
			previousObject = previousObject.previousSibling;
		}else if(tempLevel > level){
			previousObject = previousObject.previousSibling;
		}else{
			break;
		}
	}
	while(nextObject != null){
		var tempLevel = nextObject.level;
		if(tempLevel == level){
			var tempSpan = nextObject.cells[cellNum].getElementsByTagName("span");
			tempSpan = tempSpan[0];
			if(tempSpan.innerHTML == name){
				return  false;
			}
			nextObject = nextObject.nextSibling;
		}else if(tempLevel > level){
			nextObject = nextObject.nextSibling;
		}else{
			break;
		}
	}
	return true;
}
/**
 * �л�����ʽ
 */
ListTable.sort = function(sort_by, sort_order){
  var args = "act="+this.query+"&sort_by="+sort_by+"&sort_order=";

  if (this.filter.sort_by == sort_by){
    args += this.filter.sort_order == "DESC" ? "ASC" : "DESC";
  }
  else{
    args += "DESC";
  }

  for (var i in this.filter){
    if (typeof(this.filter[i]) != "function" &&
      i != "sort_order" && i != "sort_by" && !Check.isEmpty(this.filter[i])){
      args += "&" + i + "=" + this.filter[i];
    }
  }

  this.filter['page_size'] = this.getPageSize();

  Ajax.call(this.url, args, this.listCallback, "POST", "JSON");
}

/**
 * ��ҳ
 */
ListTable.gotoPage = function(page){
  if (page != null) this.filter['page'] = page;

  if (this.filter['page'] > this.pageCount) this.filter['page'] = 1;

  this.filter['page_size'] = this.getPageSize();

  this.loadList();
}

/**
 * �����б�
 */
ListTable.loadList = function(){
  var args = "act="+this.query+"" + this.compileFilter();

  Ajax.call(this.url, args, this.listCallback, "POST", "JSON");
}



ListTable.gotoPageFirst = function(){
  if (this.filter.page > 1)
  {
    ListTable.gotoPage(1);
  }
}

ListTable.gotoPagePrev = function(){
  if (this.filter.page > 1){
    ListTable.gotoPage(this.filter.page - 1);
  }
}

ListTable.gotoPageNext = function(){
  if (this.filter.page < ListTable.pageCount){
    ListTable.gotoPage(parseInt(this.filter.page) + 1);
  }
}

ListTable.gotoPageLast = function(){
  if (this.filter.page < ListTable.pageCount){
    ListTable.gotoPage(ListTable.pageCount);
  }
}

ListTable.changePageSize = function(e){
    var evt = Browser.fixEvent(e);
    if (evt.keyCode == 13){
        ListTable.gotoPage();
        return false;
    };
}

ListTable.listCallback = function(result, txt){
  if (result.error > 0){
    alert(result.message);
  }
  else{
    try{
      document.getElementById('listDiv').innerHTML = result.content;

      if (typeof result.filter == "object"){
        ListTable.filter = result.filter;
      }

      ListTable.pageCount = result.page_count;
    }
    catch (e){
      alert(e.message);
    }
  }
}

ListTable.selectAll = function(obj, chk){
  if (chk == null){
    chk = 'checkboxes';
  }

  var elems = obj.form.getElementsByTagName("INPUT");

  for (var i=0; i < elems.length; i++){
    if (elems[i].name == chk || elems[i].name == chk + "[]"){
      elems[i].checked = obj.checked;
    }
  }
}

ListTable.compileFilter = function(){
  var args = '';
  for (var i in this.filter){
    if (typeof(this.filter[i]) != "function" && typeof(this.filter[i]) != "undefined"){
      args += "&" + i + "=" + encodeURIComponent(this.filter[i]);
    }
  }

  return args;
}

ListTable.getPageSize = function(){
  var ps = 15;

  pageSize = document.getElementById("pageSize");

  if (pageSize){
    ps = Check.isInt(pageSize.value) ? pageSize.value : 15;
    document.cookie = "ECSCP[page_size]=" + ps + ";";
  }
}
  
ListTable.addRow = function(checkFunc){
  cleanWhitespace(document.getElementById("listDiv"));
  var table = document.getElementById("listDiv").childNodes[0];
  var firstRow = table.rows[0];
  var newRow = table.insertRow(-1);
  newRow.align = "center";
  var items = new Object();
  for(var i=0; i < firstRow.cells.length;i++) {
    var cel = firstRow.cells[i]; 
    var celName = cel.getAttribute("name");
    var newCel = newRow.insertCell(-1);
    if (!cel.getAttribute("ReadOnly") && cel.getAttribute("Type")=="TextBox"){
      items[celName] = document.createElement("input");
      items[celName].type  = "text";
      items[celName].style.width = "50px";
      items[celName].onkeypress = function(e){
        var evt = Browser.fixEvent(e);
        var obj = Browser.srcElement(e);

        if (evt.keyCode == 13){
          ListTable.saveFunc();
        }
      }
      newCel.appendChild(items[celName]);
    }
    if (cel.getAttribute("Type") == "Button"){
      var saveBtn   = document.createElement("input");
      saveBtn.type  = "image";
      saveBtn.src = "./images/icon_add.gif";
      saveBtn.value = save;
      newCel.appendChild(saveBtn);
      this.saveFunc = function(){
        if (checkFunc){
          if (!checkFunc(items)){
            return false;
          }
        }
        var str = "act=add";
        for(var key in items){
          if (typeof(items[key]) != "function")
          {
            str += "&" + key + "=" + items[key].value;
          }
        }
        res = Ajax.call(ListTable.url, str, null, "POST", "JSON", false);
        if (res.error){
          alert(res.message);
          table.deleteRow(table.rows.length-1);
          items = null;
        }
        else{
          document.getElementById("listDiv").innerHTML = res.content;
          if (document.getElementById("listDiv").childNodes[0].rows.length < 6){
             ListTable.addRow(checkFunc);
          }
          items = null;
        }
      }
      saveBtn.onclick = this.saveFunc;

      //var delBtn   = document.createElement("input");
      //delBtn.type  = "image";
      //delBtn.src = "./images/no.gif";
      //delBtn.value = cancel;
      //newCel.appendChild(delBtn);
    }
  }
  
}

ListTable.trMouseOver = function(tr) {
	for(var i=0; i < tr.cells.length;i++) {
		tr.cells[i].style.backgroundColor = "#BFF0F9"
	}
}
	
ListTable.trMouseOut = function(tr) {
	for(var i=0; i < tr.cells.length;i++) {
		tr.cells[i].style.backgroundColor = "#FFFFFF"
	}
}
ListTable.goDown = function(node){
	if(node.nextSibling != null){
		node.swapNode(node.nextSibling);
	}
}
ListTable.goUp = function(node){
	if(node.previousSibling  != null){
		node.swapNode(node.previousSibling );
	}
}

var imgPlus = new Image();
imgPlus.src = "../../admin/images/menu_plus.gif";

/**
 * �۵������б�
 */
ListTable.rowClicked = function(obj){
	obj = obj.parentNode.parentNode;

	var tbl = document.getElementById("list-table");
	var lvl = parseInt(obj.className);
	var fnd = false;
	
	for (i = 0; i < tbl.rows.length; i++){
		var row = tbl.rows[i];

		if (tbl.rows[i] == obj){
			fnd = true;
		}else{
			if (fnd == true){
				var cur = parseInt(row.className);
				if (cur > lvl){
					$("row" + row.value).src = imgPlus.src;
				}
				if (cur == lvl +1){
					row.style.display = (row.style.display != 'none') ? 'none' : (Browser.isIE) ? 'block' : 'table-row';
				}else if(cur > lvl +1){
					row.style.display = "none";
				}else{
					fnd = false;
					break;
				}
			}
		}
	}
	var imgObj = $("row" + obj.value);
	imgObj.src = (imgObj.src == imgPlus.src) ? '../../admin/images/menu_minus.gif' : imgPlus.src;
}
//--------------json

jQuery.extend({
	/**
	* @see   ��json�ַ���ת��Ϊ����
	* @param   json�ַ���
	* @return ����object,array,string�ȶ���
	*/
	evalJSON : function (strJson){
		return eval( "(" + strJson + ")");
	}
});
jQuery.extend({
	/**
	* @see   ��javascript��������ת��Ϊjson�ַ���
	* @param ��ת������,֧��object,array,string,function,number,boolean,regexp
	* @return ����json�ַ���
	*/
	toJSON : function (object){
		var type = typeof object;
		if ('object' == type){
			if (Array == object.constructor)
				type = 'array';
			else if (RegExp == object.constructor)
				type = 'regexp';
			else
				type = 'object';
			}
			switch(type){
				case 'undefined':
				case 'unknown': 
					return;
					break;
				case 'function':
				case 'boolean':
				case 'regexp':
					return object.toString();
					break;
				case 'number':
					return isFinite(object) ? object.toString() : 'null';
					break;
				case 'string':
					return '"' + object.replace(/(\\|\")/g,"\\$1").replace(/\n|\r|\t/g,
						function(){   
							var a = arguments[0];                   
							return (a == '\n') ? '\\n':   
		                       (a == '\r') ? '\\r':   
		                       (a == '\t') ? '\\t': "" 
						}) + '"';
					break;
				case 'object':
					if (object === null) return 'null';
					var results = [];
					for (var property in object) {
						var value = jQuery.toJSON(object[property]);
						if (value !== undefined)
							results.push(jQuery.toJSON(property) + ':' + value);
					}
					return '{' + results.join(',') + '}';
					break;
				case 'array':
					var results = [];
					for(var i = 0; i < object.length; i++){
						var value = jQuery.toJSON(object[i]);
						if (value !== undefined) results.push(value);
					}
					return '[' + results.join(',') + ']';
					break;
			}
		}
	});
//------------------------------jPrintArea
var jPrintArea = function(printElement, header, footer, portrait, leftMargin, rightMargin, bottomMargin){
	var iframe = document.getElementById('printedIframe');
	var doc = null;
	if(iframe == null){
		iframe = document.createElement("iframe");
		document.body.appendChild(iframe);
		$(iframe).attr('id', 'printedIframe').attr('style','position:absolute;width:0px;height:0px;left:-500px;top:-500px;');
		doc = iframe.contentWindow.document;
		doc.open();
		var links = window.document.getElementsByTagName('link');
		var linkString = '';
		for(var i = 0;i < links.length;i++){
			if(links[i].rel.toLowerCase()=='stylesheet'){
				linkString += '<link type="text/css" rel="stylesheet" href="'+links[i].href+'"></link>';
			}
		}
		doc.write('<head>' + linkString + '<object id="factory" viewastext style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="/js/scriptx/smsx.cab#Version=6,5,439,30"></object></head><body></body>');
		doc.close();
	}
	doc = iframe.contentWindow.document;
	$(document.getElementById('printedIframe').contentWindow.document.body).html(printElement.clone());

	var factory = doc.getElementById('factory');
	if (!factory.printing) {
		alert('��ӡ�ؼ�û����ȷ��װ!');
		return;
	} else {
		factory.printing.header = header;
		factory.printing.footer = footer;
		factory.printing.portrait = portrait == null ? true : portrait;
		factory.printing.leftMargin = leftMargin == null ? 0 : leftMargin;
		factory.printing.rightMargin = rightMargin == null ? 0 : rightMargin;
		factory.printing.bottomMargin = bottomMargin == null ? 0 : bottomMargin;
		factory.printing.Preview();
	}
}
//--------------------------------treeview.js
;(function($) {

	$.extend($.fn, {
		swapClass: function(c1, c2) {
			var c1Elements = this.filter('.' + c1);
			this.filter('.' + c2).removeClass(c2).addClass(c1);
			c1Elements.removeClass(c1).addClass(c2);
			return this;
		},
		replaceClass: function(c1, c2) {
			return this.filter('.' + c1).removeClass(c1).addClass(c2).end();
		},
		hoverClass: function(className) {
			className = className || "hover";
			return this.hover(function() {
				$(this).addClass(className);
			}, function() {
				$(this).removeClass(className);
			});
		},
		heightToggle: function(animated, callback) {
			animated ?
				this.animate({ height: "toggle" }, animated, callback) :
				this.each(function(){
					jQuery(this)[ jQuery(this).is(":hidden") ? "show" : "hide" ]();
					if(callback)
						callback.apply(this, arguments);
				});
		},
		heightHide: function(animated, callback) {
			if (animated) {
				this.animate({ height: "hide" }, animated, callback);
			} else {
				this.hide();
				if (callback)
					this.each(callback);				
			}
		},
		prepareBranches: function(settings) {
			if (!settings.prerendered) {
				// mark last tree items
				this.filter(":last-child:not(ul)").addClass(CLASSES.last);
				// collapse whole tree, or only those marked as closed, anyway except those marked as open
				this.filter((settings.collapsed ? "" : "." + CLASSES.closed) + ":not(." + CLASSES.open + ")").find(">ul").hide();
			}
			// return all items with sublists
			return this.filter(":has(>ul)");
		},
		applyClasses: function(settings, toggler) {
			this.filter(":has(>ul):not(:has(>a))").find(">span").click(function(event) {
				toggler.apply($(this).next());
			}).add( $("a", this) ).hoverClass();
			
			if (!settings.prerendered) {
				// handle closed ones first
				this.filter(":has(>ul:hidden)")
						.addClass(CLASSES.expandable)
						.replaceClass(CLASSES.last, CLASSES.lastExpandable);
						
				// handle open ones
				this.not(":has(>ul:hidden)")
						.addClass(CLASSES.collapsable)
						.replaceClass(CLASSES.last, CLASSES.lastCollapsable);
						
	            // create hitarea
				this.prepend("<div class=\"" + CLASSES.hitarea + "\"/>").find("div." + CLASSES.hitarea).each(function() {
					var classes = "";
					$.each($(this).parent().attr("class").split(" "), function() {
						classes += this + "-hitarea ";
					});
					$(this).addClass( classes );
				});
			}
			
			// apply event to hitarea
			this.find("div." + CLASSES.hitarea).click( toggler );
		},
		treeview: function(settings) {
			
			settings = $.extend({
				cookieId: "treeview"
			}, settings);
			
			if (settings.add) {
				return this.trigger("add", [settings.add]);
			}
			
			if ( settings.toggle ) {
				var callback = settings.toggle;
				settings.toggle = function() {
					return callback.apply($(this).parent()[0], arguments);
				};
			}
		
			// factory for treecontroller
			function treeController(tree, control) {
				// factory for click handlers
				function handler(filter) {
					return function() {
						// reuse toggle event handler, applying the elements to toggle
						// start searching for all hitareas
						toggler.apply( $("div." + CLASSES.hitarea, tree).filter(function() {
							// for plain toggle, no filter is provided, otherwise we need to check the parent element
							return filter ? $(this).parent("." + filter).length : true;
						}) );
						return false;
					};
				}
				// click on first element to collapse tree
				$("a:eq(0)", control).click( handler(CLASSES.collapsable) );
				// click on second to expand tree
				$("a:eq(1)", control).click( handler(CLASSES.expandable) );
				// click on third to toggle tree
				$("a:eq(2)", control).click( handler() ); 
			}
		
			// handle toggle event
			function toggler() {
				$(this)
					.parent()
					// swap classes for hitarea
					.find(">.hitarea")
						.swapClass( CLASSES.collapsableHitarea, CLASSES.expandableHitarea )
						.swapClass( CLASSES.lastCollapsableHitarea, CLASSES.lastExpandableHitarea )
					.end()
					// swap classes for parent li
					.swapClass( CLASSES.collapsable, CLASSES.expandable )
					.swapClass( CLASSES.lastCollapsable, CLASSES.lastExpandable )
					// find child lists
					.find( ">ul" )
					// toggle them
					.heightToggle( settings.animated, settings.toggle );
				if ( settings.unique ) {
					$(this).parent()
						.siblings()
						// swap classes for hitarea
						.find(">.hitarea")
							.replaceClass( CLASSES.collapsableHitarea, CLASSES.expandableHitarea )
							.replaceClass( CLASSES.lastCollapsableHitarea, CLASSES.lastExpandableHitarea )
						.end()
						.replaceClass( CLASSES.collapsable, CLASSES.expandable )
						.replaceClass( CLASSES.lastCollapsable, CLASSES.lastExpandable )
						.find( ">ul" )
						.heightHide( settings.animated, settings.toggle );
				}
			}
			
			function serialize() {
				function binary(arg) {
					return arg ? 1 : 0;
				}
				var data = [];
				branches.each(function(i, e) {
					data[i] = $(e).is(":has(>ul:visible)") ? 1 : 0;
				});
				$.cookie(settings.cookieId, data.join("") );
			}
			
			function deserialize() {
				var stored = $.cookie(settings.cookieId);
				if ( stored ) {
					var data = stored.split("");
					branches.each(function(i, e) {
						$(e).find(">ul")[ parseInt(data[i]) ? "show" : "hide" ]();
					});
				}
			}
			
			// add treeview class to activate styles
			this.addClass("treeview");
			
			// prepare branches and find all tree items with child lists
			var branches = this.find("li").prepareBranches(settings);
			
			switch(settings.persist) {
			case "cookie":
				var toggleCallback = settings.toggle;
				settings.toggle = function() {
					serialize();
					if (toggleCallback) {
						toggleCallback.apply(this, arguments);
					}
				};
				deserialize();
				break;
			case "location":
				var current = this.find("a").filter(function() { return this.href.toLowerCase() == location.href.toLowerCase(); });
				if ( current.length ) {
					current.addClass("selected").parents("ul, li").add( current.next() ).show();
				}
				break;
			}
			
			branches.applyClasses(settings, toggler);
				
			// if control option is set, create the treecontroller and show it
			if ( settings.control ) {
				treeController(this, settings.control);
				$(settings.control).show();
			}
			
			return this.bind("add", function(event, branches) {
				$(branches).prev()
					.removeClass(CLASSES.last)
					.removeClass(CLASSES.lastCollapsable)
					.removeClass(CLASSES.lastExpandable)
				.find(">.hitarea")
					.removeClass(CLASSES.lastCollapsableHitarea)
					.removeClass(CLASSES.lastExpandableHitarea);
				$(branches).find("li").andSelf().prepareBranches(settings).applyClasses(settings, toggler);
			});
		}
	});
	
	// classes used by the plugin
	// need to be styled via external stylesheet, see first example
	var CLASSES = $.fn.treeview.classes = {
		open: "open",
		closed: "closed",
		expandable: "expandable",
		expandableHitarea: "expandable-hitarea",
		lastExpandableHitarea: "lastExpandable-hitarea",
		collapsable: "collapsable",
		collapsableHitarea: "collapsable-hitarea",
		lastCollapsableHitarea: "lastCollapsable-hitarea",
		lastCollapsable: "lastCollapsable",
		lastExpandable: "lastExpandable",
		last: "last",
		hitarea: "hitarea"
	};
	
	// provide backwards compability
	$.fn.Treeview = $.fn.treeview;
	
})(jQuery);
//----------------------------MaskInput.js-------------------------
(function($) {
	var pasteEventName = ($.browser.msie ? 'paste' : 'input') + ".mask";
	var iPhone = (window.orientation!=undefined); 

	$.mask = {
		//Predefined character definitions
		definitions: {
			'9': "[0-9]",
			'a': "[A-Za-z]",
			'*': "[A-Za-z0-9]"
		}
	};

	$.fn.extend({
		//Helper Function for Caret positioning
		caret: function(begin, end) {
			if (this.length == 0) return;
			this.css('ime-mode', 'disabled');
			if (typeof begin == 'number') {
				end = (typeof end == 'number') ? end : begin;
				return this.each(function() {
					if (this.setSelectionRange) {
						this.focus();
						this.setSelectionRange(begin, end);
					} else if (this.createTextRange) {
						var range = this.createTextRange();
						range.collapse(true);
						range.moveEnd('character', end);
						range.moveStart('character', begin);
						range.select();
					}
				});
			} else {
				if (this[0].setSelectionRange) {
					begin = this[0].selectionStart;
					end = this[0].selectionEnd;
				} else if (document.selection && document.selection.createRange) {
					var range = document.selection.createRange();
					begin = 0 - range.duplicate().moveStart('character', -100000);
					end = begin + range.text.length;
				}
				return { begin: begin, end: end };
			}
		},
		unmask: function() { return this.trigger("unmask"); },
		mask: function(mask, settings) {
			if (!mask && this.length > 0) {
				var input = $(this[0]);
				var tests = input.data("tests");
				return $.map(input.data("buffer"), function(c, i) {
					return tests[i] ? c : null;
				}).join('');
			}
			settings = $.extend({
				placeholder: "_",
				completed: null
			}, settings);

			var defs = $.mask.definitions;
			var tests = [];
			var partialPosition = mask.length;
			var firstNonMaskPos = null;
			var len = mask.length;

			$.each(mask.split(""), function(i, c) {
				if (c == '?') {
					len--;
					partialPosition = i;
				} else {
					tests.push(defs[c] ? new RegExp(defs[c]) : null);
					if (tests[tests.length - 1] && firstNonMaskPos == null)
						firstNonMaskPos = tests.length - 1;
				}
			});

			return this.each(function() {
				var input = $(this);
				var buffer = $.map(mask.split(""), function(c, i) { if (c != '?') return defs[c] ? settings.placeholder : c });
				var ignore = false;  			//Variable for ignoring control keys
				var focusText = input.val();

				input.data("buffer", buffer).data("tests", tests);

				function seekNext(pos) {
					while (++pos < len) {
						if (tests[pos])
							return pos;
					}
					return len;
				};

				function shiftL(pos) {
					while (!tests[pos] && pos >= 0) pos--;
					for (var i = pos; i < len; i++) {
						if (tests[i]) {
							buffer[i] = settings.placeholder;
							var j = seekNext(i);
							if (j < len && tests[i].test(buffer[j])) {
								buffer[i] = buffer[j];
							} else
								break;
						}
					}
					writeBuffer();
					input.caret(Math.max(firstNonMaskPos, pos));
				};

				function shiftR(pos) {
					for (var i = pos, c = settings.placeholder; i < len; i++) {
						if (tests[i]) {
							var j = seekNext(i);
							var t = buffer[i];
							buffer[i] = c;
							if (j < len && tests[j].test(t)) 
								c = t;
							else
								break;
						}
					}
				};

				function keydownEvent(e) {
					var pos = $(this).caret();
					var k = e.keyCode;
					ignore = (k < 16 || (k > 16 && k < 32) || (k > 32 && k < 41));

					//delete selection before proceeding
					if ((pos.begin - pos.end) != 0 && (!ignore || k == 8 || k == 46)) 
						clearBuffer(pos.begin, pos.end);
					
					//backspace, delete, and escape get special treatment
					if (k == 8 || k == 46 || (iPhone && k==127)) {//backspace/delete
						shiftL(pos.begin + (k == 46 ? 0 : -1));
						return false;
					} else if (k == 27) {//escape
						clearBuffer(0, len);
						writeBuffer();
						$(this).caret(firstNonMaskPos);
						return false;
					}
				};

				function keypressEvent(e) {
					if (ignore) {
						ignore = false;
						//Fixes Mac FF bug on backspace
						return (e.keyCode == 8) ? false : null;
					}
					e = e || window.event;
					var k = e.charCode || e.keyCode || e.which;
					var pos = $(this).caret();

					if (e.ctrlKey || e.altKey) {//Ignore
						return true;
					} else if ((k >= 41 && k <= 122) || k == 32 || k > 186) {//typeable characters
						var p = seekNext(pos.begin - 1);
						if (p < len) {
							var c = String.fromCharCode(k);
							if (tests[p].test(c)) {
								shiftR(p);
								buffer[p] = c;
								writeBuffer();
								var next = seekNext(p);
								$(this).caret(next);
								if (settings.completed && next == len)
									settings.completed.call(input);
							}
						}
					}
					return false;
				};

				function clearBuffer(start, end) {
					for (var i = start; i < end && i < len; i++) {
						if (tests[i])
							buffer[i] = settings.placeholder;
					}
				};

				function writeBuffer() { return input.val(buffer.join('')).val(); };

				function checkVal(allow) {
					//try to place characters where they belong
					var test = input.val();					
					var lastMatch = -1;
					for (var i = 0,pos=0; i < len; i++) {
						if (tests[i]) {
							buffer[i] = settings.placeholder;
							while (pos++ < test.length) {
								var c = test.charAt(pos - 1);
								if (tests[i].test(c)) {
									buffer[i] = c;
									lastMatch = i;
									break;
								}
							}
							if (pos > test.length)
								break;
						}
					}
					if (!allow && lastMatch + 1 < partialPosition) {
						input.val("");
						clearBuffer(0, len);
					} else if (allow || lastMatch + 1 >= partialPosition) {
						writeBuffer();
						if(!allow)input.val(input.val().substring(0, lastMatch + 1));
					}					
					return (partialPosition ? i : firstNonMaskPos);
				};

				input
					.one("unmask", function() {
						input
							.unbind(".mask")
							.removeData("buffer")
							.removeData("tests");
					})
					.bind("focus.mask", function() {
						focusText = input.val();
						var pos = checkVal();
						writeBuffer();
						setTimeout(function() {
							input.caret(pos);
						}, 0);
					})
					.bind("blur.mask", function() {
						checkVal();
						if (input.val() != focusText)
							input.change();
					})
					.bind("keydown.mask", keydownEvent)
					.bind("keypress.mask", keypressEvent)
					.bind(pasteEventName, function(){ 
						setTimeout(function(){input.caret(checkVal(true));},0);
					});

				checkVal(); //Perform initial check for existing values
			});
		}
	});
})(jQuery);

//������������ĳ��������
Array.prototype.insertAt = function( index, value ) { 
	var part1 = this.slice( 0, index );
	var part2 = this.slice( index );
	part1.push( value );
	return part1.concat( part2);
};
//ɾ�������ĳ��������Ԫ��
Array.prototype.removeAt = function( index ){
	var part1 = this.slice( 0, index );
	var part2 = this.slice( index );
	part1.pop();
	return part1.concat( part2 );
} 