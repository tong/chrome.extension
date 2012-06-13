package chrome;

/**
 * http://code.google.com/chrome/extensions/webRequest.html
 */
@:native("chrome.webRequest") extern class WebRequest {
	
	static function handlerBehaviorChanged( ?cb : Void->Void ) : Void;
	
	//TODO types
	static var onAuthRequired(default,never) : Event<Dynamic>;
	static var onBeforeRedirect(default,never) : Event<Dynamic>;
	static var onBeforeRequest(default,never) : Event<Dynamic>;
	
	static var onBeforeSendHeaders(default,never) : Event<Dynamic>;
	static var onCompleted(default,never) : Event<Dynamic>;
	static var onErrorOccurred(default,never) : Event<Dynamic>;
	static var onHeadersReceived(default,never) : Event<Dynamic>;
	static var onResponseStarted(default,never) : Event<Dynamic>;
	static var onSendHeaders(default,never) : Event<Dynamic>;
}
