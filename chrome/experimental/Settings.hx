package chrome.experimental;

import chrome.type.ChromeSetting;

@:native("chrome.experimental.settings") extern class Settings {
	static function clear( ?cb : Void->Void ) : Void;
	static function get( ?keys : Array<String>, cb : Dynamic->Void ) : Void;
	static function remove( keys : Array<String>, ?cb : Void->Void ) : Void;
	static function set( settings : Dynamic, ?cb : Dynamic->Void ) : Void;
}

