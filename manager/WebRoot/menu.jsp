<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="role" prefix="r"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理页面</title>

<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 132px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 132px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(images/menu_bgs.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: left;
	margin: 0px;
	padding: 0px;
	text-indent: 10px;
}
.content{
	width: 132px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 132px;
	padding-left: 0px;
}
.MM {
	width: 132px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 132px;
	display: block;
	text-align: left;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
	text-indent: 22px;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: left;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
	text-indent: 22px;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 132px;
	display: block;
	text-align: left;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
	text-indent: 22px;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: left;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 132px;
	text-decoration: none;
	text-indent: 22px;
}
</style>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="132" valign="top"><div id="container">
      <h1 class="type"><a href="javascript:void(0)">会员管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="/member/gotoAddMember.action" target="main">会员登记</a></li>
          <li><a href="/member/queryMemberByModel.action" target="main">会员信息查询</a></li>
        </ul>
      </div>
      <!--<h1 class="type"><a href="javascript:void(0)">积分管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="/member/gotoAddScore.action" target="main">积分录入</a></li>
		  <li><a href="" target="main">会员积分记录查询</a></li>
		  <li><a href="" target="main">会员兑换记录查询</a></li>
        </ul>
      </div>-->
      <!--<h1 class="type"><a href="javascript:void(0)">挂失管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
		  <li><a href="/member/gotoManagerMember.action" target="main">挂失</a></li>
          <li><a href="/member/gotoManagerMember.action" target="main">解冻</a></li>
          <li><a href="/member/gotoManagerMember.action" target="main">补卡</a></li>
        </ul>
      </div>-->
      <r:role roleName="0">
	  <h1 class="type"><a href="javascript:void(0)">用户管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="/user/gotoAddUser.action" target="main">新用户注册</a></li>
          <li><a href="/user/queryUserByLoginName.action" target="main">用户信息查询</a></li>
        </ul>
      </div>
	  </r:role>
	  
	  <h1 class="type"><a href="javascript:void(0)">礼品管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <r:role roleName="0"><li><a href="/member/gotoAddGift.action" target="main">礼品信息入库</a></li></r:role>
          <li><a href="/member/queryGiftByName.action" target="main">礼品库存查询</a></li>
		  <li><a href="/member/queryGiftRecordByName.action" target="main">礼品入库查询</a></li>
		  <li><a href="/member/queryTicketList.action" target="main">小票补打</a></li>
        </ul>
      </div>
	  <r:role roleName="0">
	  <h1 class="type"><a href="javascript:void(0)">商户管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="/member/gotoAddShop.action" target="main">商户信息登记</a></li>
          <li><a href="/member/queryShopByName.action" target="main">商户信息查询</a></li>
        </ul>
      </div>
	  <h1 class="type"><a href="javascript:void(0)">商户铺号管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
        	<li><a href="/member/gotoAddShopLocation.action" target="main">商户铺号信息登记</a></li>
          <li><a href="/member/queryShopLocation.action" target="main">商户铺号信息查询</a></li>
        </ul>
      </div>
	  </r:role>
	  <!--<h1 class="type"><a href="javascript:void(0)">商户品牌管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
        	<li><a href="/member/gotoAddShopBrand.action" target="main">商户品牌信息登记</a></li>
          <li><a href="/member/queryShopBrand.action" target="main">商户品牌信息查询</a></li>
        </ul>
      </div>-->
      <h1 class="type"><a href="javascript:void(0)">数据统计</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
		  <r:role roleName="0"><li><a href="/report/queryShopReport.action" target="main">商户统计</a></li>
          <li><a href="/report/queryGiftReport.action" target="main">礼品统计</a></li>
		  <li><a href="/report/queryMemberReport.action" target="main">会员统计</a></li></r:role>
		  <li><a href="/report/queryScoreLineReport.action" target="main">积分录入统计</a></li>
		  <r:role roleName="0"><li><a href="/report/queryScoreModifyReport.action" target="main">积分修改统计</a></li></r:role>
		  <li><a href="/report/queryExchangeReport.action" target="main">积分兑换统计</a></li>
        </ul>
      </div>
	  
	  <h1 class="type"><a href="javascript:void(0)">短信群发</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="132" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
		  <li><a href="/member/sendSms.jsp" target="main">短信群发</a></li>

        </ul>
      </div>
	  
     </div>
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
</body>
</html>
