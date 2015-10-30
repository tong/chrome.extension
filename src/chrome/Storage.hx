package chrome;

import chrome.Events;

typedef StorageChange = {
	@:optional var oldValue : Dynamic;
	@:optional var newValue : Dynamic;
}

typedef StorageArea = {

	@:overload(function( ?keys : Dynamic, ?callback : Dynamic->Void ):Void{})
	@:overload(function( ?keys : String, ?callback : Dynamic->Void ):Void{})
	function get( ?keys : Array<String>, ?callback : Dynamic->Void ) : Void;

	@:overload(function( ?keys : Array<String>, callback : Int->Void ):Void{})
	function getBytesInUse( ?keys : String, callback : Int->Void ) : Void;

	function set( items : Dynamic, ?callback : Void->Void ) : Void;

	@:overload(function( ?keys : Array<String>, ?callback : Void->Void ):Void{})
	function remove( keys : String, ?callback : Void->Void ) : Void;

	function clear( ?callback : Void->Void ) : Void;
}

@:enum abstract StorageAreaName(String) from String to String {
	var sync = "sync";
	var local = "local";
	var managed = "managed";
}

@:require(chrome)
@:native("chrome.storage")
extern class Storage {
	static var sync(default,never) : StorageArea;
	static var local(default,never) : StorageArea;
	static var managed(default,never) : StorageArea;
	static var onChanged(default,never) : Event<Dynamic->String->Void>;
}
