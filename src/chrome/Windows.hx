package chrome;

import chrome.Events;
import chrome.Tabs;

@:enum abstract WindowType(String) from String to String {
	var normal = "normal";
	var popup = "popup";
	var panel = "panel";
	var app = "app";
	var devtools = "devtools";
}

@:enum abstract WindowState(String) from String to String {
	var normal = "normal";
	var minimized = "minimized";
	var maximized = "maximized";
	var fullscreen = "fullscreen";
	var docked = "docked";
}

typedef Window = {
	@:optional var id : Int;
	var focused : Bool;
	@:optional var top : Int;
	@:optional var left : Int;
	@:optional var width : Int;
	@:optional var height : Int;
	@:optional var tabs : Array<Tab>;
	var incognito : Bool;
	@:optional var type : WindowType;
	@:optional var state : WindowState;
	var alwaysOnTop : Bool;
	@:optional var sessionId : String;
}

@:enum abstract CreateType(String) from String to String {
	var normal = "normal";
	var popup = "popup";
	var panel = "panel";
	var detached_panel = "detached_panel";
}

@:require(chrome_ext)
@:native("chrome.windows")
extern class Windows {

	static var WINDOW_ID_NONE(default,never) : Int;
	static var WINDOW_ID_CURRENT(default,never) : Int;

	static function get(
		windowId : Int,
		?getInfo : { ?populate : Bool, ?windowTypes : Array<WindowType> },
		callback : Window->Void
	) : Void;
	static function getCurrent( ?getInfo : { ?populate : Bool, ?windowTypes : Array<WindowType> }, callback : Window->Void ) : Void;
	static function getLastFocused( ?getInfo : { ?populate : Bool, ?windowTypes : Array<WindowType> }, callback : Window->Void ) : Void;
	static function getAll( ?getInfo : { ?populate : Bool, ?windowTypes : Array<WindowType> }, callback : Array<Window>->Void ) : Void;
	static function create(
		?createData : {
			?url : String,
			?tabId : Int,
			?left : Int,
			?top : Int,
			?width : Int,
			?height : Int,
			?focused : Bool,
			?incognito : Bool,
			?type : WindowType,
			?state : WindowState,
		},
		?callback : ?Window->Void
	) : Void;
	static function update(
		windowId : Int,
		updateInfo : {
			?left : Int,
			?top : Int,
			?width : Int,
			?height : Int,
			?focused : Bool,
			?drawAttention : Bool,
			?state : WindowState
		},
		?callback : Window->Void
	) : Void;
	static function remove( windowId : Int, ?callback : Void->Void ) : Void;

	static var onCreated(default,null) : Event<Window->Void>;
	static var onRemoved(default,null) : Event<Int->Void>;
	static var onFocusChanged(default,null) : Event<Int->Void>;
}
