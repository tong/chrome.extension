package chrome.experimental;

typedef StorageChange = {
	var oldValue : Dynamic;
	var newValue : Dynamic;
}

typedef StorageNamespace = {
	function clear( ?cb : Void->Void ) : Void;
	@:overload(function get(?keys:Array<Dynamic>,cb:Dynamic->Void):Void{})
	@:overload(function get(?keys:Array<String>,cb:Dynamic->Void):Void{})
	function get( ?keys : String, cb : Dynamic->Void ) : Void;
	@:overload(function remove(keys:Array<String>,?cb:Dynamic->Void):Void{})
	function remove( keys : String, ?cb : Void->Void ) : Void;
	function set( items  : Dynamic, ?cb : Void->Void ) : Void;
}

@:native("chrome.experimental.storage") extern class Storage {
	static var sync : StorageNamespace;
	static var local : StorageNamespace;
	static var onChanged(default,never) : Event<Dynamic->String->Void>;
}