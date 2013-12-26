package chrome;

typedef Filter = {
	@:optional var maxResults : Int;
}

typedef Session = {
	var lastModified : Int;
	@:optional var tab : Tab;
	@:optional var window : Window;
}

typedef Device = {
	var info : String;
	var sessions : Array<Session>;
}

@:require(chrome_ext)
@:require(chrome_experimental)
@:native("chrome.sessions")
extern class Sessions {
	static var MAX_SESSION_RESULTS(default,never) : Int;
	static function getRecentlyClosed( ?filter : Filter, f : Array<Session>->Void ) : Void;
	static function getDevices( ?filter : Filter, f : Array<Device>->Void ) : Void;
	static function restore( ?sessionId : String, ?f : Session->Void ) : Void;
}