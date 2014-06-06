package chrome;

typedef Cookie = {
	var name : String;
	var value : String;
	var domain : String;
	var hostOnly : Bool;
	var path : String;
	var secure : Bool;
	var httpOnly : Bool;
	var session : Bool;
	@:optional var expirationDate : Float;
	var storeId : String;
}

typedef CookieStore = {
	var id : String;
	var tabIds : Array<Int>;
}

@:enum abstract CookieChangeInfoCause(String) {
	var evicted = "evicted";
	var expired = "expired";
	var explicit = "explicit";
	var expired_overwrite = "expired_overwrite";
	var overwrite = "overwrite";
}

typedef CookieChangeInfo = {
	var removed : Bool;
	var cookie : Cookie;
	var cause : CookieChangeInfoCause;
}

@:require(chrome_ext)
@:native("chrome.cookies")
extern class Cookies {
	static function get( details : { url : String, name : String, ?storeId : String }, f : ?Cookie->Void ) : Void;
	static function getAll( details : { ?url : String, ?name : String, ?domain : String, ?path : String, ?secure : Bool, ?session : Bool, ?storeId : String }, f : Array<Cookie>->Void ) : Void;
	static function set( details : { url : String, ?name : String, ?value : String, ?domain : String, ?path : String, ?secure : Bool, ?httpOnly : Bool, ?expirationDate : Float, ?storeId : String }, f : ?Cookie->Void ) : Void;
	static function remove( details : { url : String, name : String, ?storeId : String }, f : {url:String,name:String,storeId:String}->Void ) : Void;
	static function getAllCookieStores( f : Array<CookieStore>->Void ) : Void;
	static var onChanged(default,null) : Event<CookieChangeInfo->Void>;
}
