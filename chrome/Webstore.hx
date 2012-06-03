package chrome;

@:native("chrome.webstore") extern class Webstore {
	static function install( ?url : String, ?successCallback : Void->Void, ?failureCallback : String->Void ) : Void;
}
