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
	var expirationDate : Float;
	var storeId : String;
}

typedef CookieStore = {
	var id : String;
	var tabIds : Array<Int>;
}

/*
private typedef Details = {
	var url : string;
	var name : string;
	var storeId : string; // optional
}

private typedef GetAllDetails = {
	var url : String;  // optional
	var name : String;  // optional
	var domain : String;  // optional
	var path : String;  // optional
	var secure : Bool;  // optional
	var session : Bool;  // optional
	var storeId : String; // optional
}

private typedef SetDetails = {
	var url : String;
	var name : String;  // optional
	var value : String;  // optional
	var domain : String;  // optional
	var path : String;  // optional
	var secure : Bool;  // optional
	var httpOnly : Bool;  // optional
	var expirationDate : Float; // optional
	var storeId : String; // optional
}
*/

/*
@:fakeEnum(String) extern enum CookieChangeInfo {
	evicted;
	expired;
	explicit;
	expired_overwrite;
	overwrite;
}
*/

typedef CookieChangeInfo = {
	var removed : Bool;
	var cookie : Cookie;
	var cause : String; //  ( enumerated string ["evicted", "expired", "explicit", "expired_overwrite", "overwrite"] )
}

@:native("chrome.cookies") extern class Cookies {
	static function get( details : Dynamic, cb : Cookie->Void ) : Void;
	static function getAll( details : Dynamic, cb : Array<Cookie>->Void ) : Void;
	static function getAllCookieStores( cb : Array<Cookie>->Void ) : Void;
	static function remove( details : Dynamic, ?cb : Dynamic->Void ) : Void;
	static function set( details : Dynamic, ?cb : Cookie->Void ) : Void;
	static var onChanged(default,null) : Event<CookieChangeInfo->Void>;
}
