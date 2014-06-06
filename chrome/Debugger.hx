package chrome;

typedef Debuggee = {
	@:optional var tabId : Int;
	@:optional var extensionId : String;
	@:optional var targetId : String;
}

@:enum abstract TargetType(String) {
	var page = "page";
	var background_page = "background_page";
	var worker = "worker";
	var other = "other";
}

typedef TargetInfo = {
	var type : TargetType;
	var id : String;
	@:optional var tabId : Int;
	@:optional var extensionId : String;
	var attached : Bool;
	var title : String;
	var url : String;
	@:optional var faviconUrl : String;
}

@:enum abstract DetachReason(String) {
	var target_closed = "target_closed";
	var canceled_by_user = "canceled_by_user";
	var replaced_with_devtools = "replaced_with_devtools";
}

@:require(chrome_ext)
@:native("chrome.debugger")
extern class Debugger {
	static function attach( target : Debuggee, requiredVersion : String, ?f : Void->Void ) : Void;
	static function detach( target : Debuggee, ?f : Void->Void ) : Void;
	static function sendCommand( target : Debuggee, method : String, ?commandParams : Dynamic, ?f : Dynamic->Void ) : Void;
	static function getTargets( ?f : Array<TargetInfo>->Void ) : Void;
	static var onEvent(default,null) : Event<Debuggee->String->?Dynamic->Void>;
	static var onDetach(default,null) : Event<Debuggee->DetachReason->Void>;
}
