	Permission.initLoginOrlogoutButton = function() {
		Permission.setLoginButton();
	}
	Permission.postProduct = function(){
		Permission.scriptOnloadCallbackFunctionString = "Permission.postProduct()";
		login();
	}
	Permission.postDemand = function(){
		Permission.scriptOnloadCallbackFunctionString = "Permission.postDemand()";
		login();
	}
	Permission.addFavorite = function(favoriteType, objectId, price, hire, typeId){
		Permission.scriptOnloadCallbackFunctionString = "Permission.addFavorite('" + favoriteType + "', '" + objectId + "', '" + price + "', '" + hire + "', '" + typeId + "')";
		login();
	}
	Permission.postProductMessage = function(productId){
		Permission.scriptOnloadCallbackFunctionString = "Permission.postProductMessage('" + productId + "')";
		login();
	}
	Permission.postDemandMessage = function(demandId){
		Permission.scriptOnloadCallbackFunctionString = "Permission.postDemandMessage('" + demandId + "')";
		login();
	}
	Permission.toUserCenter = function(){
		Permission.scriptOnloadCallbackFunctionString = "Permission.toUserCenter()";
		login();
	}
	Permission.toFavorite = function(){
		Permission.scriptOnloadCallbackFunctionString = "Permission.toFavorite()";
		login();
	}
	Permission.toGetIsNotReadedCommend = function(){
		Permission.scriptOnloadCallbackFunctionString = "Permission.toGetIsNotReadedCommend()";
		login();
	}
	Permission.toGetNewMessageAndMail = function(){
		Permission.scriptOnloadCallbackFunctionString = "Permission.toGetNewMessageAndMail()";
		login();
	}
	Permission.toSuggestion = function(){
		Suggestion.noLogin_showWindow();
	}