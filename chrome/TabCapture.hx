package chrome;

typedef LocalMediaStream = Dynamic; //TODO

typedef MediaStreamConstraint = {
	var mandatory : Dynamic;
	@:optional var optional : Dynamic;
}

typedef CaptureOptions = {
	@:optional var audio : Bool;
	@:optional var video : Bool;
	@:optional var audioConstraints : MediaStreamConstraint;
	@:optional var videoConstraints : MediaStreamConstraint;
}

@:enum abstract CaptureStatus(String) {
	var pending = "pending";
	var active = "active";
	var stopped = "stopped";
	var error = "error";
}

typedef CaptureInfo = {
	var tabId : Int;
	var status : CaptureStatus;
	var fullscreen : Bool;
}


@:require(chrome_ext)
@:native("chrome.tabCapture")
extern class TabCapture {
	static function capture( options : CaptureOptions, f : LocalMediaStream->Void ) : Void;
	static function getCapturedTabs( f : Array<CaptureInfo>->Void ) : Void;
	static var onStatusChanged(default,null) : Event<CaptureInfo->Void>;
}
