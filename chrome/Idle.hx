package chrome;

@:enum abstract IdleState(String) {
	var active = "active";
	var idle = "idle";
	var locked = "locked";
}

@:require(chrome)
@:native("chrome.idle")
extern class Idle {
	static function queryState( detectionIntervalInSeconds : Int, f : IdleState->Void ) : Void;
	static function setDetectionInterval( intervalInSeconds : Int ) : Void;
	static var onStateChanged : Event<IdleState->Void>;
}
