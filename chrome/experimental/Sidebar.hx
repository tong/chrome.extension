package chrome.experimental;

@:native("chrome.experimental.sidebar") extern class Sidebar {
	static function collapse( ?details : Dynamic ) : Void;
	static function expand( ?details : Dynamic ) : Void;
	static function getState( ?details : Dynamic, cb : String->Void ) : Void;
	static function hide( ?details : Dynamic ) : Void;
	static function navigate( ?details : Dynamic ) : Void;
	static function setBadgeText( ?details : Dynamic ) : Void;
	static function setIcon( ?details : Dynamic ) : Void;
	static function setTitle( ?details : Dynamic ) : Void;
	static function show( ?details : Dynamic ) : Void;
	static var onStateChanged : Event<Dynamic->Void>;
}
