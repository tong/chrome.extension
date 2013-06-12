package chrome;

@:native("chrome.idle") extern class Idle {
	static function queryState( thresholdSeconds : Int, cb : String->Void ) : Void;
	static function setDetectionInterval( intervalInSeconds : Int ) : Void;
	static var onStateChanged : Event<String->Void>;
}
