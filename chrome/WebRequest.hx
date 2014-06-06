package chrome;

typedef UploadData = {
	@:optional var bytes : Dynamic;
	@:optional var file : String;
}

typedef HttpHeaders = Array<Dynamic>;

@:enum abstract RequestType(String) {
	var main_frame = "main_frame";
	var sub_frame = "sub_frame";
	var stylesheet = "stylesheet";
	var script = "script";
	var image = "image";
	var object = "object";
	var xmlhttprequest = "xmlhttprequest";
	var other = "other";
}

private typedef OnBeforeRequestEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	@:optional var requestBody : {?error:String,?formData:Dynamic,?raw:Array<UploadData>};
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
}

private typedef OnBeforeSendHeadersEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	@:optional var requestHeaders : HttpHeaders;
}

private typedef OnSendHeadersEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	@:optional var requestHeaders : HttpHeaders;
}

private typedef OnHeadersReceivedEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	var statusLine : String;
	var responseHeaders : HttpHeaders;
}

private typedef OnAuthRequiredEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	var scheme : String;
	@:optional var realm : String;
	var challenger : Dynamic;
	var isProxy : Bool;
	@:optional var responseHeaders : HttpHeaders;
	var statusLine : String;
}

private typedef OnResponseStartedEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	@:optional var ip : String;
	var fromCache : Bool;
	var statusCode : Int;
	@:optional var responseHeaders : HttpHeaders;
	var statusLine : String;
}

private typedef OnBeforeRedirectEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	@:optional var ip : String;
	var fromCache : Bool;
	var statusCode : Int;
	@:optional var responseHeaders : HttpHeaders;
	var statusLine : String;
}

private typedef OnCompletedEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	@:optional var ip : String;
	var fromCache : Bool;
	var statusCode : Int;
	@:optional var responseHeaders : HttpHeaders;
	var statusLine : String;
}

private typedef OnErrorOccurredEventDetails = {
	var requestId : String;
	var url : String;
	var method : String;
	var frameId : Int;
	var parentFrameId : Int;
	var tabId : Int;
	var type : RequestType;
	var timeStamp : Float;
	@:optional var ip : String;
	var fromCache : Bool;
	var error : String;
}

@:require(chrome_ext)
@:native("chrome.webRequest")
extern class WebRequest {
	static function handlerBehaviorChanged( ?f : Void->Void ) : Void;
	static var onBeforeRequest(default,never) : Event<OnBeforeRequestEventDetails->Void>;
	static var onBeforeSendHeaders(default,never) : Event<OnBeforeSendHeadersEventDetails->Void>;
	static var onSendHeaders(default,never) : Event<OnSendHeadersEventDetails>;
	static var onHeadersReceived(default,never) : Event<OnHeadersReceivedEventDetails>;
	static var onAuthRequired(default,never) : Event<OnAuthRequiredEventDetails>;
	static var onResponseStarted(default,never) : Event<OnResponseStartedEventDetails>;
	static var onBeforeRedirect(default,never) : Event<OnBeforeRedirectEventDetails>;
	static var onCompleted(default,never) : Event<OnCompletedEventDetails>;
	static var onErrorOccurred(default,never) : Event<OnErrorOccurredEventDetails>;
}
