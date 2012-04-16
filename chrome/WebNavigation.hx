package chrome;


@:fakeEnum(String) enum TransitionType {
	link;
	typed;
	auto_bookmark;
	auto_subframe;
	manual_subframe;
	generated;
	start_page;
	form_submit;
	reload;
	keyword;
	keyword_generated;
}

@:fakeEnum(String) enum TransitionQualifiers {
	client_redirect;
	server_redirect;
	forward_back;
	from_address_bar;
}

private typedef GetAllFramesDetails = {
	errorOccurred : Bool,
	frameId : Int,
	url : String
}

private typedef GetFramesDetails = {
	errorOccurred : Bool,
	url : String
}

private typedef OnBeforeNavigateEventDetails = {
	tabId : Int,
	url : String,
	frameId : Int,
	timeStamp : Float
}

private typedef OnCommittedEventDetails = {
	tabId : Int,
	url : String,
	frameId : Int,
	transitionType : TransitionType,
	transitionQualifiers : TransitionQualifiers,
	timeStamp : Float
}

private typedef OnCompletedEventDetails = {
	tabId : Int,
	url : String,
	frameId : Int,
	timeStamp : Float
}

private typedef OnCreatedNavigationTargetEventDetails = {
	sourceTabId : Int,
	sourceFrameId : Int,
	url : String,
	tabId : Int,
	timeStamp : Float
}

private typedef OnDOMContentLoadedEventDetails = {
	tabId : Int,
	url : String,
	frameId : Int,
	timeStamp : Float
}

private typedef OnErrorOccurredEventDetails = {
	tabId : Int,
	url : String,
	frameId : Int,
	error : String,
	timeStamp : Float
}

private typedef OnReferenceFragmentUpdatedEventDetails = {
	tabId : Int,
	url : String,
	frameId : Int,
	transitionType : TransitionType,
	transitionQualifiers : TransitionQualifiers,
	timeStamp : Float
}

@:native("chrome.webNavigation") extern class WebNavigation {
	
	static function getAllFrames(
		details : {
			tabId : Int
		},
		cb : ?Array<GetAllFramesDetails>->Void
	) : Void;
	
	static function getFrame(
		details : {
			tabId : Int,
			frameId : Int
		},
		cb : ?GetFramesDetails->Void
	) : Void;
	
	static var onBeforeNavigate(default,null) : Event<OnBeforeNavigateEventDetails->Void>;
	static var onCommitted(default,null) : Event<OnCommittedEventDetails->Void>;
	static var onCompleted(default,null) : Event<OnCompletedEventDetails->Void>;
	static var onCreatedNavigationTarget(default,null) : Event<OnCreatedNavigationTargetEventDetails->Void>;
	static var onDOMContentLoaded(default,null) : Event<OnDOMContentLoadedEventDetails->Void>;
	static var onErrorOccurred(default,null) : Event<OnErrorOccurredEventDetails->Void>;
	static var onReferenceFragmentUpdated(default,null) : Event<OnReferenceFragmentUpdatedEventDetails->Void>;
}
