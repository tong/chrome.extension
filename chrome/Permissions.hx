package chrome;

typedef PermissionsData = {
	@:optional var permissions : Array<String>;
	@:optional var origins : Array<String>;
}

@:require(chrome)
@:native("chrome.permissions")
extern class Permissions {
	static function contains( permissions : PermissionsData, f : Bool->Void ) : Void;
	static function getAll( permissions : PermissionsData ) : Void;
	static function remove( permissions : PermissionsData, ?f : Bool->Void ) : Void;
	static function request( permissions : PermissionsData, ?f : Bool->Void ) : Void;
	static var onAdded(default,never) : Event<PermissionsData->Void>;
	static var onRemoved(default,never) : Event<PermissionsData->Void>;
}
