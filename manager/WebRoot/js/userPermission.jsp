<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<jsp:include page="/js/noLoginPermission.js"/>
	Permission.initLoginOrlogoutButton = function() {
		Permission.setLogoutButton();
	}
	Permission.postProduct = function(){
		window.open("/infoCenter/postProduct/toPostProduct.html");
	}	
	Permission.postDemand = function(){
		window.open("/infoCenter/postDemand/toPostDemand.html");
	}
	Permission.addFavorite = function(favoriteType, objectId, price, hire, typeId){
		FavoriteObject.showAddFavoriteModule(favoriteType, objectId, price, hire, typeId);
	}
	Permission.postProductMessage = function(productId){
		Message.showPostProductMessageWindow(productId);
	}
	Permission.postDemandMessage = function(demandId){
		Message.showPostDemandMessageWindow(demandId);
	}
	Permission.toUserCenter = function(){
		location.href = "/userCenter/user/toUserCenter.html";
	}
	Permission.toFavorite = function(){
		location.href = "/userCenter/favorite/getProductFavoriteItem.html";
	}
	Permission.toGetIsNotReadedCommend = function(){
		location.href = "/infoCenter/commend/getIsNotReadedCommend.html";
	}
	Permission.toGetNewMessageAndMail = function(){
		location.href = "/infoCenter/viewMessage/getNewMessageAndMail.html";
	}
	Permission.toSuggestion = function(){
		Suggestion.logined_showWindow();
	}
	<ww:if test="user.isWebShopOwner">
		<jsp:include page="/js/webShopOwnerPermission.js"/>
	</ww:if>