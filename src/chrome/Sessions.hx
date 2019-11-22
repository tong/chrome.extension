package chrome;

import chrome.Events;
import chrome.Tabs;
import chrome.Windows;

typedef Filter = {
	@:optional var maxResults : Int;
}

typedef Session = {
	var lastModified : Int;
	@:optional var tab : Tab;
	@:optional var window : Window;
}

private typedef Device = {
	var deviceName : String;
	var sessions : Array<Session>;
}

@:require(chrome_ext)
@:native("chrome.sessions")
extern class Sessions {
	static var MAX_SESSION_RESULTS(default,never) : Int;
	static function getRecentlyClosed( ?filter : Filter, callback : Array<Session>->Void ) : Void;
	static function getDevices( ?filter : Filter, callback : Array<Device>->Void ) : Void;
	static function restore( ?sessionId : String, ?callback : Session->Void ) : Void;
	static var onChanged(default,never) : Event<Void->Void>;
}
