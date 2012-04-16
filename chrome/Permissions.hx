package chrome;

typedef PermissionsData = {
	?permissions : Array<String>,
	?origins : Array<String>
}

/**
 * http://code.google.com/chrome/extensions/permissions.html
 */
@:native("chrome.permissions") extern class Permissions {
	
	static function contains( permissions : PermissionsData, cb : Bool->Void ) : Void;
	static function getAll( permissions : PermissionsData ) : Void;
	static function remove( permissions : PermissionsData, ?cb : Bool->Void ) : Void;
	static function request( permissions : PermissionsData, ?cb : Bool->Void ) : Void;
	
	static var onAdded : Event<PermissionsData->Void>;
	static var onRemoved : Event<PermissionsData->Void>;
}
