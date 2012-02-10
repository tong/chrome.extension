package chrome;

//TODO types!

private typedef RequestFilter = {
	var urls : Array<String>;
	var types : Array<String>; //TODO optional, enum
	var tabId : Array<String>; //TODO optional
	var windowId : Int; //TODO optional
}

private typedef HttpHeader = {
	var name : String;
	var value : String;
	var binaryValue : Array<Int>;
}
private typedef HttpHeaders = Array<HttpHeader>;

private typedef BlockingResponse = {
	var cancel : Bool;
	var redirectUrl :String;
	var requestHeaders : HttpHeaders;
	var responseHeaders : HttpHeaders;
	var authCredentials : { username : String, password : String };
}

/*
private typedef T_onAuthRequired = {
	function addListener( listener : (Dynamic->Void)->Void, filter : RequestFilter, extraInfoSpec : Array<String> ) : Void;
	function removeListener( listener : (Dynamic->Void)->Void, filter : RequestFilter, extraInfoSpec : Array<String> ) : Void;
	function hasListener( listener : (Dynamic->Void)->Void, filter : RequestFilter, extraInfoSpec : Array<String> ) : Void;
}

private typedef T_1 = {
	function addListener( listener : Dynamic->Void, filter : RequestFilter, extraInfoSpec : Array<String> ) : Void;
	function removeListener( listener : Dynamic->Void, filter : RequestFilter, extraInfoSpec : Array<String> ) : Void;
	function hasListener( listener : Dynamic->Void, filter : RequestFilter, extraInfoSpec : Array<String> ) : Void;
}

private typedef T_2 = {
	function addListener( listener : Dynamic->Void, filter : RequestFilter ) : Void;
	function removeListener( listener : Dynamic->Void, filter : RequestFilter ) : Void;
	function hasListener( listener : Dynamic->Void, filter : RequestFilter ) : Void;
}
*/

/**
	http://code.google.com/chrome/extensions/webRequest.html
*/
@:native("chrome.webRequest") extern class WebRequest {
	
	static function handlerBehaviorChanged( ?cb : Void->Void ) : Void;
	
	static var onAuthRequired(default,never) : Dynamic; // T_onAuthRequired;
	static var onBeforeRedirect(default,never) : Dynamic; // T_1;
	static var onBeforeRequest(default,never) : Dynamic; //T_1;
	static var onBeforeSendHeaders(default,never) : Dynamic; // T_1;
	static var onCompleted(default,never) : Dynamic; // T_1;
	static var onErrorOccurred(default,never) : Dynamic; // T_2;
	static var onHeadersReceived(default,never) : Dynamic; // T_1;
	static var onResponseStarted(default,never) : Dynamic; // T_1;
	static var onSendHeaders(default,never) : Dynamic; // T_1;
}
