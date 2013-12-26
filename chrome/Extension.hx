package chrome;

@:fakeEnum(String) enum FetchPropertyType {
	tab;
	infobar;
	notification;
	popup;
}

@:require(chrome_ext)
@:native("chrome.extension")
extern class Extension {
	static var lastError : { message : String };
	static var inIncognitoContext : Bool;
	static function sendRequest( ?extensionId : String, request : Dynamic, ?f : Dynamic->Void ) : Void;
	static function getURL( path : String ) : String;
	static function getViews( ?fetchProperties : { ?type : FetchPropertyType, ?windowId : Int } ) : Array<Window>; 
	static function getBackgroundPage() : Window; 
	static function getExtensionTabs() : Array<Window>; 
	static function isAllowedIncognitoAccess( f : Bool->Void ) : Void;
	static function isAllowedFileSchemeAccess( f : Bool->Void ) : Void;
	static function setUpdateUrlData( data : String ) : Void;
	static var onRequest(default,null) : Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
	static var onRequestExternal(default,null) : Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
}
