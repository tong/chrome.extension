package chrome;

private typedef GetAllFramesDetails = {
	var tabId : Int;
}

private typedef GetFrameDetails = {>GetAllFramesDetails,
	var frameId : Int;
}

private typedef WebNavigationEvent = {
	var tabId : Int;
	var url : String;
	var frameId : Int;
	var timeStamp : Float;
}

private typedef WebNavigationCommittedEvent = {>WebNavigationEvent,
	var transitionType : String; // enumerated string ["link", "typed", "auto_bookmark", "auto_subframe", "manual_subframe", "generated", "start_page", "form_submit", "reload", "keyword", "keyword_generated"]
	var transitionQualifiers : Array<Dynamic>; //TODO
}

private typedef WebNavigationCreatedNavigationEvent = {
	var tabId : Int;
	var url : String;
	var frameId : Int;
	var timeStamp : Float;
}

private typedef WebNavigationErrorEvent = {>WebNavigationEvent,
	var error : String;
}

@:native("chrome.webNavigation") extern class WebNavigation {
	static function getAllFrames( details : GetAllFramesDetails, cb : Array<Dynamic>->Void ) : Void;
	static function getFrame( details : GetFrameDetails, cb : Dynamic->Void ) : Void;
	static var onBeforeNavigate : Event<WebNavigationEvent->Void>;
	static var onCommitted : Event<WebNavigationCommittedEvent->Void>;
	static var onCompleted : Event<WebNavigationEvent->Void>;
	static var onCreatedNavigationTarget : Event<WebNavigationCreatedNavigationEvent->Void>;
	static var onDOMContentLoaded : Event<WebNavigationEvent->Void>;
	static var onErrorOccurred : Event<WebNavigationErrorEvent->Void>;
	static var onReferenceFragmentUpdated : Event<WebNavigationCommittedEvent->Void>;
}
