package chrome;

@:native("chrome.idle") extern class Idle {
	static var onStateChanged : Event<String->Void>;
	static function queryState( thresholdSeconds : Int, cb : String->Void ) : Void;
}
