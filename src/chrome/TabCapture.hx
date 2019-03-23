package chrome;

import js.html.LocalMediaStream;
import chrome.Events;

@:enum abstract CaptureInfoStatus(String) from String to String {
	var pending = "pending";
	var active = "active";
	var stopped = "stopped";
	var error = "error";
}

typedef CaptureInfo = {
	var tabId : Int;
	var status : CaptureInfoStatus;
	var fullscreen : Bool;
}

typedef MediaStreamConstraint = {
	var mandatory : Dynamic;
	@:optional var optional : Dynamic;
}

private typedef CaptureOptions = {
	@:optional var audio : Bool;
	@:optional var video : Bool;
	@:optional var audioConstraints : MediaStreamConstraint;
	@:optional var videoConstraints : MediaStreamConstraint;
}

@:require(chrome_ext)
@:native("chrome.tabCapture")
extern class TabCapture {
	static function capture( options : CaptureOptions, callback : LocalMediaStream->Void ) : Void;
	static function getCapturedTabs( callback : Array<CaptureInfo>->Void ) : Void;
	static function captureOffscreenTab( startUrl : String, options : CaptureOptions, callback : LocalMediaStream->Void ) : Void;
	static function getMediaStreamId( ?options : { ?consumerTabId:Int,?targetTabId:Int }, callback : String->Void ) : Void;
	static var onStatusChanged(default,never) : Event<CaptureInfo->Void>;
}
