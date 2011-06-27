package chrome;

import js.Dom;

@:native("chrome.extension") extern class Extension {
	static var lastError : Dynamic;
	static var inIncognitoContext : Dynamic;
	static function connect( extensionId : String, connectInfo : Dynamic ) : Port;
	static function getBackgroundPage() : Dynamic; //?
	static function getURL( path : String ) : String;
	static function getViews( ?fetchProperties : Dynamic ) : Array<js.Window>;
	static function sendRequest( ?extensionId : String, request : Dynamic, responseCallback : Dynamic->Void ) : Void;
	static function isAllowedFileSchemeAccess( cb : : Bool->Void ) : Void;
	static function isAllowedIncognitoAccess( cb : : Bool->Void ) : Void;
	static var onConnect(default,null) : chrome.Event<Port->Void>;
	static var onConnectExternal(default,null) : chrome.Event<Port->Void>;
	static var onRequest(default,null) : chrome.Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
	static var onRequestExternal(default,null) : chrome.Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
}
