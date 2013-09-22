package chrome;

private typedef OriginTypes = {
	@:optional var unprotectedWeb : Bool;
	@:optional var protectedWeb : Bool;
	@:optional var extension : Bool;
}

typedef RemovalOptions = {
	@:optional var since : Float;
	var originTypes : OriginTypes;
}

typedef DataToRemove = {
	@:optional var appcache : Bool;
	@:optional var cache : Bool;
	@:optional var cookies : Bool;
	@:optional var downloads : Bool;
	@:optional var fileSystems : Bool;
	@:optional var formData : Bool;
	@:optional var history : Bool;
	@:optional var indexedDB : Bool;
	@:optional var localStorage : Bool;
	@:optional var serverBoundCertificates : Bool;
	@:optional var pluginData : Bool;
	@:optional var passwords : Bool;
	@:optional var webSQL : Bool;
}

@:native("chrome.browsingData") extern class BrowsingData {
	static function remove( options : RemovalOptions, dataToRemove : DataToRemove, ?cb : Void->Void ) : Void;
	static function removeAppcache( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeCache( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeCookies( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeDownloads( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeFileSystems( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeFormData( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeHistory( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeIndexedDB( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeLocalStorage( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removePasswords( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removePluginData( options : RemovalOptions, ?cb : Void->Void ) : Void;
	static function removeWebSQL( options : RemovalOptions, ?cb : Void->Void ) : Void;
}
