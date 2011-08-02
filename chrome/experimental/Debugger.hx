package chrome.experimental;

@:native("chrome.experimental.debugger") extern class Debugger {
	static function attach( tabId : Int, cb : Void->Void ) : Void;
	static function dettach( tabId : Int, cb : Void->Void ) : Void;
	static function sendRequest( tabId : Int, method : String, params : Dynamic, cb : Dynamic->Void ) : Void;
	static var onDetach(default,null) : Event<Int->Void>;
	static var onEvent(default,null) : Event<Int->String->Dynamic->Void>;
}
