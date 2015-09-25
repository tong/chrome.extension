package chrome;

import chrome.Events;

typedef PermissionsData = {
	@:optional var permissions : Array<String>;
	@:optional var origins : Array<String>;
}

@:require(chrome)
@:native("chrome.permissions")
extern class Permissions {
	static function getAll( callback : PermissionsData->Void ) : Void;
	static function contains( permissions : PermissionsData, callback : Bool->Void ) : Void;
	static function request( permissions : PermissionsData, ?callback : Bool->Void ) : Void;
	static function remove( permissions : PermissionsData, ?callback : Bool->Void ) : Void;
	static var onAdded(default,never) : Event<PermissionsData->Void>;
	static var onRemoved(default,never) : Event<PermissionsData->Void>;
}
