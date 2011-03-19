package chrome.experimental;

private typedef Process = {
	var id : Int;
	var type : String;
	var cpu : Float;
	var network : Float;
	var privateMemory : Float;
	var sharedMemeory : Float;
}

@:native("chrome.experimental.processes") extern class Processes {
	static function getProcessIdForTab( tabId : Int, cb : Int->Void ) : Void;
	static var onUpdated : Event<Process->Void>;
}
