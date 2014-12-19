<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>会员系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
-->
</style>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/user/userManage.js"></script>
<script language="JavaScript">
function correctPNG()
{
	
    var arVersion = navigator.appVersion.split("MSIE")
    var version = parseFloat(arVersion[1])
    if ((version >= 5.5) && (document.body.filters)) 
    {
       for(var j=0; j<document.images.length; j++)
       {
          var img = document.images[j]
          var imgName = img.src.toUpperCase()
          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
          {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText 
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" ;
             img.outerHTML = strNewHTML
             j = j-1
          }
       }
    }    
}

$(document).ready(function(){
	correctPNG();
	Permission.scriptOnloadCallbackFunctionString = "window.location.href = '/index.jsp';";
	function login(){
		Login.builderLoginWindow(Login.manager, "loginCallback(Login.userName)");
	}
	login();
}); 

function loginCallback(userName){
}

if(document.addEventListener){
	document.addEventListener("keypress",handler, true);
}else{
	document.attachEvent("onkeypress",handler);
}

function handler(evt){
	if(evt.keyCode==13){
		Login.login();
	}
}

function doSubmit() {
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
	$("#btnLogin").attr("disabled", "disabled");
	$("#loginForm").submit();
}

</script>
<link href="/css/frame.css" rel="stylesheet" type="text/css">
<body>
<form name="loginForm" id="loginForm" action="/login.action" method="post">
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
        <tr>
          <td width="1%" height="21">&nbsp;</td>
          <td height="42">&nbsp;</td>
          <td width="17%">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
        <tr>
          <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
              <tr>
                <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="100">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="170" align="right" valign="top"><img src="images/logo.png" width="567" height="170"></td>
                    </tr>
                    <tr>
                      <td height="198" align="right" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td>&nbsp;</td>
                            <td width="30%" height="40"><img src="images/icon-demo.gif" width="16" height="16"><a href="" target="_blank" class="left_txt3"> 使用说明</a> </td>
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="1%" >&nbsp;</td>
          <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%" height="38"><span class="login_txt_bt">登陆后台管理</span></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                    <tr>
                      <td height="164" colspan="2" align="middle">
                          <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                            <tr>
                              <td width="13%" height="38" class="top_hui_text"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                              <td height="38" colspan="2" class="top_hui_text"><input name="loginName" id="login_userName" class="editbox4" size="20" />
                              </td>
                            </tr>
                            <tr>
                              <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密 码： &nbsp;&nbsp; </span></td>
                              <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" size="21" name="password" id="login_password" />
                                <img src="images/luck.gif" width="19" height="18"> </td>
                            </tr>
                            <tr>
                              <td width="13%" height="35" ><span class="login_txt">验证码：</span></td>
                              <td height="35" colspan="2" class="top_hui_text"><input class="wenbenkuang" name="login_inputCode" id="login_inputCode" type="text" maxLength="4" size="10">
                                <a title="刷新" id="codeLink" href="javascript:void%200;Login.reloadImage();"><img name="login_validateCode" id="login_validateCode" style="cursor: pointer;" align="middle" border="0" height="20" width="60"></a> </td>
                            </tr>
                            <tr>
                              <td height="35" >&nbsp;</td>
                              <td width="20%" height="35" ><input type="button" class="button" value="登 陆" onClick="Login.login();" id="btnLogin"/>
                              </td>
                              <td width="67%" class="top_hui_text"><input type="reset" class="button" id="cs" value="重 置"/></td>
                            </tr>
                          </table>
                          <br>
                          <div id="login_resultDiv" style="text-align: center;margin:20px;color:#000000;"></div>
                   </td>
                    </tr>
                    <tr>
                      <td width="433" height="164" align="right" valign="bottom"><img src="images/login-wel.gif" width="242" height="138"></td>
                      <td width="57" align="right" valign="bottom">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
        <tr>
          <td align="center"><span class="login-buttom-txt">Copyright &copy; 2009-2010 www.kexiangsoft.com</span></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
