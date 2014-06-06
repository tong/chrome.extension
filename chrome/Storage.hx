package chrome;

typedef StorageChange = {
	@:optional var oldValue : Dynamic;
	@:optional var newValue : Dynamic;
}

typedef StorageArea = {
	
	@:overload(function( ?keys : Dynamic, f : Dynamic->Void ):Void{})
	function get( ?keys : Array<String>, f : Dynamic->Void ) : Void;

	@:overload(function( ?keys : Array<String>, f : Int->Void ):Void{})
	function getBytesInUse( ?keys : String, f : Int->Void ) : Void;

	function set( items : Dynamic, ?f : Void->Void ) : Void;
	
	@:overload(function( ?keys : Array<String>, ?f : Void->Void ):Void{})
	function remove( keys : String, ?f : Void->Void ) : Void;
	
	function clear( ?f : Void->Void ) : Void;
}

@:require(chrome)
@:native("chrome.storage")
extern class Storage {
	static var sync : StorageArea;
	static var local : StorageArea;
	static var managed : StorageArea;
	static var onChanged(default,null) : Event<Dynamic->String->Void>;
}
