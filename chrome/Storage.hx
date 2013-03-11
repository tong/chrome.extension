package chrome;

typedef StorageChange = {
	?oldValue : Dynamic,
	?newValue : Dynamic
}

typedef StorageArea = {
	function get( ?keys : Dynamic, cb : Dynamic->Void ) : Void;
	function getBytesInUse( ?keys : Dynamic, cb : Int->Void ) : Void;
	function remove( keys : Dynamic, ?cb : Void->Void ) : Void;
	function set( items : Dynamic, ?cb : Void->Void ) : Void;
	function clear( ?cb : Void->Void ) : Void;
}

@:native("chrome.storage") extern class Storage {
	static var sync : StorageArea;
	static var local : StorageArea;
	static var onChanged(default,null) : Event<Dynamic->String->Void>;
}
