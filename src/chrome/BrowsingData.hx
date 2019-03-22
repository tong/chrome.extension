package chrome;

typedef OriginTypes = {
	@:optional var unprotectedWeb : Bool;
	@:optional var protectedWeb : Bool;
	@:optional var extension : Bool;
}

typedef RemovalOptions = {
	@:optional var since : Float;
	var originTypes : OriginTypes;
}

typedef DataTypeSet = {
	@:optional var appcache : Bool;
	@:optional var cache : Bool;
	@:optional var cookies : Bool;
	@:optional var cacheStorage : Bool;
	@:optional var downloads : Bool;
	@:optional var fileSystems : Bool;
	@:optional var formData : Bool;
	@:optional var history : Bool;
	@:optional var indexedDB : Bool;
	@:optional var localStorage : Bool;
	@:optional var serverBoundCertificates : Bool;
	@:optional var passwords : Bool;
	@:optional var pluginData : Bool;
	@:optional var serviceWorkers : Bool;
	@:optional var webSQL : Bool;
}

@:require(chrome_ext)
@:native("chrome.browsingData")
extern class BrowsingData {
	static function settings( f : {options:RemovalOptions,dataToRemove:DataTypeSet,dataRemovalPermitted:DataTypeSet}->Void ) : Void;
	static function remove( options : RemovalOptions, dataToRemove : DataTypeSet, ?callback : Void->Void ) : Void;
	static function removeAppcache( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeCache( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeCacheStorage( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeCookies( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeDownloads( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeFileSystems( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeFormData( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeHistory( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeIndexedDB( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeLocalStorage( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removePluginData( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removePasswords( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeServiceWorkers ( options : RemovalOptions, ?callback : Void->Void ) : Void;
	static function removeWebSQL( options : RemovalOptions, ?callback : Void->Void ) : Void;
}
