package chrome;

import chrome.Events;

@:enum abstract ProcessType(String) from String to String {
	var browser = "browser";
    var renderer = "renderer";
    var extension = "extension";
    var notification = "notification";
    var plugin = "plugin";
    var worker = "worker";
    var nacl = "nacl";
    var utility = "utility";
    var gpu = "gpu";
    var other = "other";
}

typedef Cache = {
    var size : Float;
    var liveSize : Float;
}

typedef Process = {
	var id : Int;
	var osProcessId : Int;
	var title : String;
	var type : ProcessType;
	var profile : String;
	var naclDebugPort : Int;
	var tabs : Array<Int>;
	@:optional var cpu : Float;
	@:optional var network : Float;
	@:optional var privateMemory : Float;
	@:optional var jsMemoryAllocated : Float;
	@:optional var jsMemoryUsed : Float;
	@:optional var sqliteMemory : Float;
	@:optional var imageCache : Cache;
	@:optional var scriptCache : Cache;
	@:optional var cssCache : Cache;
}

@:require(chrome_ext)
@:require(chrome_dev)
@:native("chrome.processes")
extern class Processes {
    static function terminate( processId : Int, ?callback : Bool->Void ) : Void;
    static function getProcessIdForTab( tabId : Int, callback : Int->Void ) : Void;
    @:overload(function( processId : Array<Int>, includeMemory : Bool, callback : Dynamic->Void) : Void {})
    static function getProcessInfo( processId : Int, includeMemory : Bool, callback : Dynamic->Void ) : Void;
    static var onUpdated(default,never) : Event<Dynamic->Void>;
    static var onUpdatedWithMemory(default,never) : Event<Dynamic->Void>;
    static var onCreated(default,never) : Event<Process->Void>;
    static var onUnresponsive(default,never) : Event<Process->Void>;
    static var onExited(default,never) : Event<Int->Int->Int->Void>;
}
