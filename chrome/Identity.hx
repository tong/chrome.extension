package chrome;

@:require(chrome_ext)
@:native("chrome.identity")
extern class Identity {
	@:overload(function(f:String->Void):Void{})
	static function getAuthToken( details : {?interactive:Bool}, f : String->Void ) : Void;
	static function removeCachedAuthToken( details : {token:String}, f : Void->Void ) : Void;
	static function launchWebAuthFlow( details : {url:String,?interactive:Bool}, f : String->Void ) : Void;
	static function getRedirectURL( ?path : String ) : String;
	static var onSignInChanged(default,null) : Event<Dynamic->Bool->Void>;
}
