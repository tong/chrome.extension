package chrome;

import chrome.Events;

typedef Cookie = {
	var name : String;
	var value : String;
	var domain : String;
	var hostOnly : Bool;
	var path : String;
	var secure : Bool;
	var httpOnly : Bool;
	var sameSite : SameSiteStatus;
	var session : Bool;
	@:optional var expirationDate : Float;
	var storeId : String;
}

typedef CookieStore = {
	var id : String;
	var tabIds : Array<Int>;
}

@:enum abstract SameSiteStatus(String) from String to String {
	var no_restriction = "no_restriction";
	var lax = "lax";
	var strict = "strict";
}

@:enum abstract OnChangedCause(String) from String to String {
	var evicted = "evicted";
	var expired = "expired";
	var explicit = "explicit";
	var expired_overwrite = "expired_overwrite";
	var overwrite = "overwrite";
}

@:require(chrome_ext)
@:native("chrome.cookies")
extern class Cookies {
	static function get( details : { url : String, name : String, ?storeId : String }, callback : ?Cookie->Void ) : Void;
	static function getAll( details : { ?url : String, ?name : String, ?domain : String, ?path : String, ?secure : Bool, ?session : Bool, ?storeId : String }, callback : Array<Cookie>->Void ) : Void;
	static function set( details : { url : String, ?name : String, ?value : String, ?domain : String, ?path : String, ?secure : Bool, ?httpOnly : Bool, ?sameSite : SameSiteStatus, ?expirationDate : Float, ?storeId : String }, callback : ?Cookie->Void ) : Void;
	static function remove( details : { url : String, name : String, ?storeId : String }, callback : { url : String, name : String, storeId : String }->Void ) : Void;
	static function getAllCookieStores( callback : Array<CookieStore>->Void ) : Void;
	static var onChanged(default,never) : Event<(Bool->Cookie->OnChangedCause)->Void>;
}
