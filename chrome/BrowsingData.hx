package chrome;

typedef RemovalOptions = {
	?since : Float,
	originTypes : {
		?unprotectedWeb : Bool,
		?protectedWeb : Bool,
		?extension : Bool
	}
}

typedef DataToRemove = {
	?appcache : Bool,
	?cache : Bool,
	?cookies : Bool,
	?downloads : Bool,
	?fileSystems : Bool,
	?formData : Bool,
	?history : Bool,
	?indexedDB : Bool,
	?localStorage : Bool,
	?serverBoundCertificates : Bool,
	?pluginData : Bool,
	?passwords : Bool,
	?webSQL : Bool
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
