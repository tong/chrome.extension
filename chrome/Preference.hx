package chrome;

@:native("preference") extern class Preference {
	function clear( details : Dynamic, ?cb : Void->Void ) : Void;
	function get( details : Dynamic, cb : Dynamic->Void ) : Void;
	function set( details : Dynamic, ?cb : Void->Void ) : Void;
}
