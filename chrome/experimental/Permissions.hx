package chrome.experimental;

typedef _Permissions = {
	var permissions : Array<String>;
	var origins : Array<String>;
}

@:native("chrome.experimental.permissions") extern class Permissions {
	static function contains( permissions : _Permissions, cb : Bool->Void  ) : Void;
	static function getAll( cb : _Permissions->Void  ) : Void;
	static function remove( permissions : _Permissions, ?cb : Bool->Void  ) : Void;
	static function request( permissions : _Permissions, ?cb : Bool->Void  ) : Void;
	static var onAdded(default,null) : Event<_Permissions->Void>;
	static var onRemoved(default,null) : Event<_Permissions->Void>;
}
