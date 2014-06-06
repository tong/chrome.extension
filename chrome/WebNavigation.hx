package chrome;

@:enum abstract TransitionType(String) {
	var link = "link";
	var typed = "typed";
	var auto_bookmark = "auto_bookmark";
	var auto_subframe = "auto_subframe";
	var manual_subframe = "manual_subframe";
	var generated = "generated";
	var start_page = "start_page";
	var form_submit = "form_submit";
	var reload = "reload";
	var keyword = "keyword";
	var keyword_generated = "keyword_generated";
}

@:enum abstract TransitionQualifiers(String) {
	var client_redirect = "client_redirect";
	var server_redirect = "server_redirect";
	var forward_back = "forward_back";
	var from_address_bar = "from_address_bar";
}

private typedef OnBeforeNavigateEventDetails = {
	var tabId : Int;
	var url : String;
	var processId : Int;
	var frameId : Int;
	var parentFrameId : Int;
	var timeStamp : Float;
}

private typedef OnCommittedEventDetails = {
	var tabId : Int;
	var url : String;
	var processId : Int;
	var frameId : Int;
	var transitionType : TransitionType;
	var transitionQualifiers : TransitionQualifiers;
	var timeStamp : Float;
}

private typedef OnDOMContentLoadedEventDetails = {
	var tabId : Int;
	var url : String;
	var processId : Int;
	var frameId : Int;
	var timeStamp : Float;
}

private typedef OnCompletedEventDetails = {
	var tabId : Int;
	var url : String;
	var processId : Int;
	var frameId : Int;
	var timeStamp : Float;
}

private typedef OnErrorOccurredEventDetails = {
	var tabId : Int;
	var url : String;
	var processId : Int;
	var frameId : Int;
	var error : String;
	var timeStamp : Float;
}

private typedef OnCreatedNavigationTargetEventDetails = {
	var sourceTabId : Int;
	var sourceProcessId : Int;
	var sourceFrameId : Int;
	var url : String;
	var tabId : Int;
	var timeStamp : Float;
}

private typedef OnReferenceFragmentUpdatedEventDetails = {
	var tabId : Int;
	var url : String;
	var processId : Int;
	var frameId : Int;
	var transitionType : TransitionType;
	var transitionQualifiers : TransitionQualifiers;
	var timeStamp : Float;
}

@:require(chrome_ext)
@:native("chrome.webNavigation")
extern class WebNavigation {
	static function getFrame( details : { tabId : Int, processId : Int, frameId : Int }, f : {errorOccurred:Bool,url:String,parentFrameId:Int}->Void ) : Void;
	static function getAllFrames( details : { tabId : Int }, f : Array<{errorOccurred:Bool,processId:Int,frameId:Int,parentFrameId:Int,url:String}>->Void ) : Void;
	static var onBeforeNavigate(default,null) : Event<OnBeforeNavigateEventDetails->Void>;
	static var onCommitted(default,null) : Event<OnCommittedEventDetails->Void>;
	static var onDOMContentLoaded(default,null) : Event<OnDOMContentLoadedEventDetails->Void>;
	static var onCompleted(default,null) : Event<OnCompletedEventDetails->Void>;
	static var onErrorOccurred(default,null) : Event<OnErrorOccurredEventDetails->Void>;
	static var onCreatedNavigationTarget(default,null) : Event<OnCreatedNavigationTargetEventDetails->Void>;
	static var onReferenceFragmentUpdated(default,null) : Event<OnReferenceFragmentUpdatedEventDetails->Void>;
}
