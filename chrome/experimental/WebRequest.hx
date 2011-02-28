package chrome.experimental;

@:native("chrome.experimental.webRequest") extern class WebRequest {
	static var onBeforeRedirect : Event<Dynamic->Void>;
	static var onBeforeRequest : Event<Dynamic->Void>;
	static var onCompleted : Event<Dynamic->Void>;
	static var onErrorOccurred : Event<Dynamic->Void>;
	static var onHeadersReceived : Event<Dynamic->Void>;
	static var onRequestSent : Event<Dynamic->Void>;
}
