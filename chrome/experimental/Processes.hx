package chrome.experimental;

@:native("chrome.experimental.processes") extern class Processes {
	static function getProcessIdForTab( tabId : Int, cb : Int->Void ) : Void;
	static var onUpdated : Event<Dynamic->Void>;
}
