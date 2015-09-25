package chrome;

import chrome.Events;

typedef AccountInfo = {
	var id : String;
}

@:require(chrome)
@:native("chrome.identity")
extern class Identity {
	@:require(chrome_dev)
	static function getAccounts( callback : Array<AccountInfo>->Void ) : Void;
	static function getAuthToken( ?details : {?interactive:Bool,?account:AccountInfo,scopes:Array<String>}, ?callback : String->Void ) : Void;
	static function getProfileUserInfo( ?callback : {email:String,id:String}->Void ) : Void;
	static function removeCachedAuthToken( details : {token:String}, ?callback : Void->Void ) : Void;
	static function launchWebAuthFlow( details : {url:String,?interactive:Bool}, callback : String->Void ) : Void;
	static function getRedirectURL( ?path : String ) : String;
	static var onSignInChanged(default,null) : Event<AccountInfo->Bool->Void>;
}
