package chrome;

@:require(chrome)
@:native("chrome.preference")
extern class Preference {
	function clear( details : Dynamic, ?f : Void->Void ) : Void;
	function get( details : Dynamic, f : Dynamic->Void ) : Void;
	function set( details : Dynamic, ?f : Void->Void ) : Void;
}
