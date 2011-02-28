package chrome.experimental;

@:native("chrome.experimental.webNavigation") extern class WebNavigation {
	static var onBeforeNavigate : Event<Dynamic->Void>;
	static var onBeforeRetarget : Event<Dynamic->Void>;
	static var onCommitted : Event<Dynamic->Void>;
	static var onCompleted : Event<Dynamic->Void>;
	static var onDOMContentLoaded : Event<Dynamic->Void>;
	static var onErrorOccurred : Event<Dynamic->Void>;
}
