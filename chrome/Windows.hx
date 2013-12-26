package chrome;

@:fakeEnum(String) enum WindowState {
	normal;
	minimized;
	maximized;
}

@:require(chrome_ext)
@:native("chrome.windows")
extern class Windows {
	
	static var WINDOW_ID_NONE(default,never) : Int;
	static var WINDOW_ID_CURRENT(default,never) : Int;
	
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
		},
		?f : Window->Void
	) : Void;
	
	static function get(
		windowId : Int,
		?getInfo : { ?populate : Bool },
		f : Window->Void
	) : Void;
	
	static function getAll(
		?getInfo : { ?populate : Bool },
		f : Array<Window>->Void
	) : Void;
	
	static function getCurrent( ?getInfo : { ?populate : Bool }, f : Window->Void ) : Void;
	
	static function getLastFocused( ?getInfo : { ?populate : Bool }, f : Window->Void ) : Void;
	
	static function remove( windowId : Int, ?f : Void->Void ) : Void;
	
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
		?f : Window->Void
	) : Void;
	
	static var onCreated(default,null) : Event<Window->Void>;
	static var onFocusChanged(default,null) : Event<Int->Void>;
	static var onRemoved(default,null) : Event<Int->Void>;
}
