package chrome;

typedef StorageChange = {
	?oldValue : Dynamic,
	?newValue : Dynamic
}

typedef StorageArea = {
	
	@:overload(function( ?keys : Array<String>, cb : Dynamic->Void ):Void{})
	function get( ?keys : String, cb : Dynamic->Void ) : Void;

	@:overload(function( ?keys : Array<String>, cb : Int->Void ):Void{})
	function getBytesInUse( ?keys : String, cb : Int->Void ) : Void;

	@:overload(function( ?keys : Array<String>, ?cb : Dynamic->Void ):Void{})
	function remove( keys : Dynamic, ?cb : Void->Void ) : Void;

	function set( items : Dynamic, ?cb : Void->Void ) : Void;
	
	function clear( ?cb : Void->Void ) : Void;
}

@:native("chrome.storage") extern class Storage {
	static var sync : StorageArea;
	static var local : StorageArea;
	static var onChanged(default,null) : Event<Dynamic->String->Void>;
}
