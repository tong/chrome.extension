package chrome;

@:require(chrome_ext)
@:require(chrome_experimental)
@:native("chrome.processes")
extern class Processes {
	static function terminate( processId : Int, ?f : Bool->Void ) : Void;
	static function getProcessIdForTab( tabId : Int, f : Int->Void ) : Void;
	static function getProcessInfo( processIds : Int, includeMemory : Bool, f : Dynamic->Void ) : Void;
	static var onUpdated(default,null) : Event<Dynamic->Void>;
	static var onUpdatedWithMemory(default,null) : Event<Dynamic->Void>;
	static var onCreated(default,null) : Event<Dynamic->Void>;
	static var onUnresponsive(default,null) : Event<Process->Void>;
	static var onExited(default,null) : Event<{processId:Int,exitType:Int,exitCode:Int}->Void>;
}