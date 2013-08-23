package chrome;

@:native("chrome.identity")
extern class Identity {
	@:overload(function(cb:String->Void):Void{})
	static function getAuthToken( details : {?interactive:Bool}, cb : String->Void ) : Void;
	static function removeCachedAuthToken( details : {token:String}, cb : Void->Void ) : Void;
	static function launchWebAuthFlow( details : {url:String,?interactive:Bool}, cb : String->Void ) : Void;
}
