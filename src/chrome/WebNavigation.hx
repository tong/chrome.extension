package chrome;

import haxe.extern.EitherType;
import chrome.Events;
import chrome.History;

@:enum abstract TransitionType(String) from String to String {
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

@:enum abstract TransitionQualifier(String) from String to String {
	var client_redirect = "client_redirect";
	var server_redirect = "server_redirect";
	var forward_back = "forward_back";
	var from_address_bar = "from_address_bar";
}

private typedef EventParams = {
	?hostContains:String,
	?hostEquals:String,
	?hostPrefix:String,
	?hostSuffix:String,
	?pathContains:String,
	?pathEquals:String,
	?pathPrefix:String,
	?pathSuffix:String,
	?queryContains:String,
	?queryEquals:String,
	?queryPrefix:String,
	?querySuffix:String,
	?urlContains:String,
	?urlEquals:String,
	?urlMatches:String,
	?originAndPathMatches:String,
	?urlPrefix:String,
	?urlSuffix:String,
	?schemes:Array<String>,
	?ports:EitherType<Array<Int>,Array<Array<Int>>>
}

@:require(chrome_ext)
@:native("chrome.webNavigation")
extern class WebNavigation {
	static function getFrame(
		details : {
			tabId:Int,
			frameId:Int
		},
		callback : {
			errorOccurred:Bool,
			url:String,
			parentFrameId:Int
		}->Void
	) : Void;
	static function getAllFrames(
		details : { tabId : Int },
		callback : Array<{errorOccurred:Bool,processId:Int,frameId:Int,parentFrameId:Int,url:String}>->Void
	) : Void;
	static var onBeforeNavigate(default,never) : Event<EventParams->Void>;
	static var onCommitted(default,never) : Event<EventParams->Void>;
	static var onDOMContentLoaded(default,never) : Event<EventParams->Void>;
	static var onCompleted(default,never) : Event<EventParams->Void>;
	static var onErrorOccurred(default,never) : Event<EventParams->Void>;
	static var onCreatedNavigationTarget(default,never) : Event<EventParams->Void>;
	static var onReferenceFragmentUpdated(default,never) : Event<EventParams->Void>;
	static var onTabReplaced(default,never) : Event<{replacedTabId:Int,tabId:Int,timeStamp:Float}->Void>;
	static var onHistoryStateUpdated(default,never) : Event<EventParams->Void>;
}
