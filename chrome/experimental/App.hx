package chrome.experimental;

@:native("chrome.experimental.app") extern class App {
	static function clearAllNotifications( ?details : Int, ?cb : Void->Void ) : Void;
	static function notify( details : Int, ?cb : Void->Void ) : Void;
}
