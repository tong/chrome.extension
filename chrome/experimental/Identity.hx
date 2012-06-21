package chrome.experimental;

@:native("chrome.experimental.identity") extern class Identity {
	static function getAuthToken( cb : String->Void ) : Void;
	static function launchWebAuthFlow( launchInfo : {url:String,?interactive:Bool}, cb : String->Void ) : Void;
}
