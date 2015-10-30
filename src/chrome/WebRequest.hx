package chrome;

import chrome.Events;

@:enum abstract ResourceType(String) from String to String {
	var main_frame = "main_frame";
	var sub_frame = "sub_frame";
	var stylesheet = "stylesheet";
	var script = "script";
	var image = "image";
	var object = "object";
	var xmlhttprequest = "xmlhttprequest";
	var other = "other";
}

@:enum abstract OnBeforeRequestOptions(String) from String to String {
	var blocking = "blocking";
	var requestBody = "requestBody";
}

@:enum abstract OnBeforeSendHeadersOptions(String) from String to String {
	var requestHeaders = "requestHeaders";
	var blocking = "blocking";
}

@:enum abstract OnSendHeadersOptions(String) from String to String {
	//TODO missing in documentation
	var blocking = "blocking";
}

@:enum abstract OnHeadersReceivedOptions(String) from String to String {
	var blocking = "blocking";
	var responseHeaders = "responseHeaders";
}

@:enum abstract OnAuthRequiredOptions(String) from String to String {
	var responseHeaders = "responseHeaders";
	var blocking = "blocking";
	var asyncBlocking = "asyncBlocking";
}

@:enum abstract OnResponseStartedOptions(String) from String to String {
	//TODO missing in documentation
	var responseHeaders = "responseHeaders";
}

@:enum abstract OnBeforeRedirectOptions(String) from String to String {
	//TODO missing in documentation
	var responseHeaders = "responseHeaders";
}

@:enum abstract OnCompletedOptions(String) from String to String {
	//TODO missing in documentation
	var responseHeaders = "responseHeaders";
}

typedef RequestFilter = {
	var urls : Array<String>;
	@:optional var types : Array<ResourceType>;
	@:optional var tabId : Int;
	@:optional var windowId : Int;
}

typedef HttpHeaders = Array<Dynamic>;

typedef BlockingResponse = {
	@:optional var cancel : Bool;
	@:optional var redirectUrl : String;
	@:optional var requestHeaders : HttpHeaders;
	@:optional var responseHeaders : HttpHeaders;
	@:optional var windauthCredentialsowId : Dynamic;
}

typedef UploadData = {
	@:optional var bytes : Dynamic;
	@:optional var file : String;
}

@:require(chrome_ext)
@:native("chrome.webRequest")
extern class WebRequest {
	static var MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES(default,never) : Int;
	static function handlerBehaviorChanged( callback : Void->Void ) : Void;
	static var onBeforeRequest(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			?requestBody : {
				?error : String,
				?formData : Dynamic,
				?raw : Array<UploadData>,
			},
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
		}->Void>;
	static var onBeforeSendHeaders(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
			?requestHeaders : HttpHeaders
		}->Void>;
	static var onHeadersReceived(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
			statusLine : String,
			?responseHeaders : HttpHeaders,
			statusCode : Int
		}->Void>;
	static var onAuthRequired(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
			scheme : String,
			?realm : String,
			?challenger : Dynamic,
			isProxy : Bool,
			?responseHeaders : HttpHeaders,
			statusLine : String,
			statusCode : Int
		}->?(BlockingResponse->Void)->Void>;
	static var onResponseStarted(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
			?ip : String,
			?fromCache : Bool,
			statusCode : Int,
			?responseHeaders : HttpHeaders,
			statusLine : String
		}->Void>;
	static var onBeforeRedirect(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
			?ip : String,
			?fromCache : Bool,
			statusCode : Int,
			redirectUrl : String,
			?responseHeaders : HttpHeaders,
			statusLine : String
		}->Void>;
	static var onCompleted(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
			?ip : String,
			?fromCache : Bool,
			statusCode : Int,
			?responseHeaders : HttpHeaders,
			statusLine : String
		}->Void>;
	static var onErrorOccurred(default,never) : Event<{
			requestId : String,
			url : String,
			method : String,
			frameId : Int,
			parentFrameId : Int,
			tabId : Int,
			type : ResourceType,
			timeStamp : Float,
			?ip : String,
			fromCache : Bool,
			error : String
		}->Void>;
}
