package chrome.devtools;

@:require(chrome_ext)
@:native("chrome.devtools.inspectedWindow")
extern class InspectedWindow {
	static var tabId : Int;
	static function eval( expression : String, ?f : Dynamic->Bool->Void ) : Void;
	static function reload( reloadOptions : {?ignoreCache:Bool,?userAgent:String,?injectedScript:String} ) : Void;
	static function getResources( f : Array<Resource>->Void ) : Void;
	static var onResourceAdded(default,null) : Event<Resource->Void>;
	static var onResourceContentCommitted(default,null) : Event<Resource->String->Void>;
}
