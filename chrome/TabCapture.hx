package chrome;

typedef MediaStreamConstraint = Dynamic; //TODO
typedef LocalMediaStream = Dynamic; //TODO

typedef CaptureOptions = {
	@:optional var audio : Bool;
	@:optional var video : Bool;
	@:optional var audioConstraints : MediaStreamConstraint;
	@:optional var videoConstraints : MediaStreamConstraint;
}

@:enum(String) enum CaptureStatus {
	pending;
	active;
	stopped;
	error;
}

typedef CaptureInfo = {
	var tabId : Int;
	var status : CaptureStatus;
	var fullscreen : Bool;
}

@:require(chrome_ext)
@:native("chrome.tabCapture")
extern class TabCapture {
	static function capture( options : CaptureOptions, f : Dynamic->Void ) : Void;
	static function getCapturedTabs( f : Array<CaptureInfo> ) : Void;
	static var onStatusChanged(default,null) : Event<CaptureInfo->Void>;
}
