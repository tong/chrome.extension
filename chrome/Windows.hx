package chrome;

@:native("chrome.windows") extern class Windows {
	static var WINDOW_ID_NONE(default,never) : Int;
	static var WINDOW_ID_CURRENT(default,never) : Int;
	static function create( ?createData : Dynamic, ?cb : Window->Void ) : Void;
	static function get( windowId : Int, cb : Window->Void ) : Void;
	static function getAll( ?getInfo : Dynamic, cb : Array<Window>->Void ) : Void;
	static function getCurrent( cb : Window->Void ) : Void;
	static function getLastFocused( xb : Window->Void ) : Void;
	static function remove( windowId : Int, ?cb : Void->Void ) : Void;
	static function update( windowId : Int, updateInfo : Dynamic, ?cb : Window->Void ) : Void;
	static var onCreated(default,null) : Event<Window->Void>;
	static var onFocusChanged(default,null) : Event<Int->Void>;
	static var onRemoved(default,null) : Event<Int->Void>;
}
