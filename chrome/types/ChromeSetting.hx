package chrome.types;

@:native("chrome.types.chromeSetting") extern class ChromeSetting {
	function clear( details : Dynamic, ?cb : Void->Void ) : Void;
	function get( details : Dynamic, cb : Dynamic->Void ) : Void;
	function set( details : Dynamic, ?cb : Void->Void ) : Void;
	var onChange : Event<Dynamic->Void>;
}
