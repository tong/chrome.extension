package chrome;

@:enum abstract ViewType(String) from String to String {
	var tab = "tab";
	var popup = "popup";
}

@:require(chrome_ext)
@:native("chrome.extension")
extern class Extension {
	static var inIncognitoContext(default,never) : Bool;
	static function getViews( ?fetchProperties : { ?type : ViewType, ?windowId : Int, ?tabId : Int } ) : Array<js.html.Window>;
	static function getBackgroundPage() : js.html.Window;
	static function isAllowedIncognitoAccess( callback : Bool->Void ) : Void;
	static function isAllowedFileSchemeAccess( callback : Bool->Void ) : Void;
	static function setUpdateUrlData( data : String ) : Void;
}
