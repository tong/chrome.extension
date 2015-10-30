package chrome.devtools;

import chrome.Events;

@:require(chrome_ext)
@:native('chrome.devtools.resource')
extern class Resource {
	static var url : String;
	static function getContent( callback : String->String->Void ) : Void;
	static function setContent( content : String, commit : Bool, ?callback : Dynamic->Void ) : Void;
}

@:require(chrome_ext)
@:native("chrome.devtools.inspectedWindow")
extern class InspectedWindow {
	static var tabId(default,never) : Int;
	static function eval( expression : String, ?f : Dynamic->Bool->Void ) : Void;
	static function reload( reloadOptions : {?ignoreCache:Bool,?userAgent:String,?injectedScript:String} ) : Void;
	static function getResources( f : Array<Resource>->Void ) : Void;
	static var onResourceAdded(default,never) : Event<Resource->Void>;
	static var onResourceContentCommitted(default,never) : Event<Resource->String->Void>;
}
