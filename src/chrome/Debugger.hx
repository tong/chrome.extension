package chrome;

import chrome.Events;

typedef Debuggee = {
	@:optional var tabId : Int;
	@:optional var extensionId : String;
	@:optional var targetId : String;
}

@:enum abstract TargetInfoType(String) from String to String {
	var page = "page";
	var background_page = "background_page";
	var worker = "worker";
	var other = "other";
}

@:enum abstract DetachReason(String) from String to String {
	var target_closed = "target_closed";
	var canceled_by_user = "canceled_by_user";
	var replaced_with_devtools = "replaced_with_devtools";
}

typedef TargetInfo = {
	var type : TargetInfoType;
	var id : String;
	@:optional var tabId : Int;
	@:optional var extensionId : String;
	var attached : Bool;
	var title : String;
	var url : String;
	@:optional var faviconUrl : String;
}

@:require(chrome_ext)
@:native("chrome.debugger")
extern class Debugger {
	static function attach( target : Debuggee, requiredVersion : String, ?callback : Void->Void ) : Void;
	static function detach( target : Debuggee, ?callback : Void->Void ) : Void;
	static function sendCommand( target : Debuggee, method : String, ?commandParams : Dynamic, ?callback : Dynamic->Void ) : Void;
	static function getTargets( ?callback : Array<TargetInfo>->Void ) : Void;
	static var onEvent(default,never) : Event<Debuggee->String->?Dynamic->Void>;
	static var onDetach(default,never) : Event<Debuggee->DetachReason->Void>;
}
