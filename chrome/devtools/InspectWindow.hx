package chrome.devtools;

@:native("chrome.devtools.inspectWindow") extern class InspectWindow {
	static var tabId : Int;
	static function eval( expression : String, ?cb : Dynamic->Bool->Void ) : Void;
	static function getResources( cb : Array<Resource>->Void ) : Void;
	static function reload( reloadOptions : Dynamic ) : Void;
	static var onResourceAdded(default,null) : Event<Resource->Void>;
	static var onResourceContentCommitted(default,null) : Event<Resource->String->Void>;
}
