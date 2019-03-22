package chrome;

import chrome.Events;

@:enum abstract IdleState(String) from String to String {
	var active = "active";
	var idle = "idle";
	var locked = "locked";
}

@:require(chrome)
@:native("chrome.idle")
extern class Idle {
	static function queryState( detectionIntervalInSeconds : Int, callback : IdleState->Void ) : Void;
	static function setDetectionInterval( intervalInSeconds : Int ) : Void;
	static function getAutoLockDelay( callback : Int->Void ) : Void;
	static var onStateChanged(default,never) : Event<IdleState->Void>;
}
