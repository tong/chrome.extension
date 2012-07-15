package chrome;

import js.Dom;

/**
	http://code.google.com/chrome/extensions/extension.html
*/
@:native("chrome.extension") extern class Extension {
	
	static var lastError : { message : String };
	static var inIncognitoContext : Bool;
	
	static function connect( extensionId : String, ?connectInfo : { name : String } ) : Port;
	static function getBackgroundPage() : Dynamic; //js.Window; // DOMWindow
	static function getURL( path : String ) : String;
	static function getViews( ?fetchProperties : { ?type : String, ?windowId : Int } ) : Array<js.Window>; // type : enumerated string ["tab", "infobar", "notification", "popup"] 
	static function isAllowedFileSchemeAccess( cb : Bool->Void ) : Void;
	static function isAllowedIncognitoAccess( cb : Bool->Void ) : Void;
	@:overload(function( ?extensionId : String, request : Dynamic, ?responseCallback : Dynamic->Void ) : Void {} )
	static function sendMessage( request : Dynamic, ?responseCallback : Dynamic->Void ) : Void;

	static var onConnect(default,null) : chrome.Event<Port->Void>;
	static var onConnectExternal(default,null) : chrome.Event<Port->Void>;
	static var onRequest(default,null) : chrome.Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
	static var onRequestExternal(default,null) : chrome.Event<Dynamic->MessageSender->(Dynamic->Void)->Void>;
}
