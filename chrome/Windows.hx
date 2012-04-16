package chrome;

@:fakeEnum(String) enum WindowState {
	normal;
	minimized;
	maximized;
}

/**
 * http://code.google.com/chrome/extensions/windows.html
 */
@:native("chrome.windows") extern class Windows {
	
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
		?cb : Window->Void
	) : Void;
	
	static function get(
		windowId : Int,
		?getInfo : { ?populate : Bool },
		cb : Window->Void
	) : Void;
	
	static function getAll(
		?getInfo : { ?populate : Bool },
		cb : Array<Window>->Void
	) : Void;
	
	static function getCurrent( ?getInfo : { ?populate : Bool }, cb : Window->Void ) : Void;
	
	static function getLastFocused( ?getInfo : { ?populate : Bool }, cb : Window->Void ) : Void;
	
	static function remove( windowId : Int, ?cb : Void->Void ) : Void;
	
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
		?cb : Window->Void
	) : Void;
	
	static var onCreated(default,null) : Event<Window->Void>;
	static var onFocusChanged(default,null) : Event<Int->Void>;
	static var onRemoved(default,null) : Event<Int->Void>;
}
