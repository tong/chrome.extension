package chrome;

typedef Debuggee = {
	var tabId : Int;
}

/**
	http://code.google.com/chrome/extensions/debugger.html
*/
@:native("chrome.debugger") extern class Debugger {
	
	static function attach( target : Debuggee, requiredVersion : String, ?cb : Void->Void ) : Void;
	static function detach( target : Debuggee, ?cb : Void->Void ) : Void;
	static function sendCommand( target : Debuggee, method : String, ?params : Dynamic, ?cb : Dynamic->Void ) : Void;
	
	static var onDetach(default,null) : Event<Debuggee->Void>;
	static var onEvent(default,null) : Event<Debuggee->String->?Dynamic->Void>;
}
