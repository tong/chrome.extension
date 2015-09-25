package chrome;

@:enum abstract ViewType(String) from String to String {
	var tab = "tab";
	var notification = "notification";
	var popup = "popup";
}

@:require(chrome_ext)
@:native("chrome.extension")
extern class Extension {
	static var lastError : { message : String };
	static var inIncognitoContext : Bool;
	//static function sendRequest( ?extensionId : String, request : Dynamic, ?f : Dynamic->Void ) : Void;
	static function getURL( path : String ) : String;
	static function getViews( ?fetchProperties : { ?type : ViewType, ?windowId : Int } ) : Array<js.html.Window>;
	static function getBackgroundPage() : js.html.Window;
	static function isAllowedIncognitoAccess( callback : Bool->Void ) : Void;
	static function isAllowedFileSchemeAccess( callback : Bool->Void ) : Void;
	static function setUpdateUrlData( data : String ) : Void;
	//static var onRequest(default,null) : Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
	//static var onRequestExternal(default,null) : Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
}
