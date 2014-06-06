package chrome;

typedef AccountInfo = {
	var id : String;
}

@:require(chrome)
@:native("chrome.identity")
extern class Identity {
	static function getAccounts( f : Array<AccountInfo>->Void ) : Void;
	static function getAuthToken( ?details : {?interactive:Bool}, f : String->Void ) : Void;
	static function removeCachedAuthToken( details : {token:String}, f : Void->Void ) : Void;
	static function launchWebAuthFlow( details : {url:String,?interactive:Bool}, f : String->Void ) : Void;
	static function getRedirectURL( ?path : String ) : String;
	static var onSignInChanged(default,null) : Event<Dynamic->Bool->Void>;
}
