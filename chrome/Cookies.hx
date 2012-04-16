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

@:fakeEnum(String) enum CookieChangeInfoCause {
	evicted;
	expired;
	explicit;
	expired_overwrite;
	overwrite;
}

typedef CookieChangeInfo = {
	var removed : Bool;
	var cookie : Cookie;
	var cause : CookieChangeInfoCause;
}

@:native("chrome.cookies") extern class Cookies {
	
	static function get(
		details : {
			url : String,
			name : String,
			?storeId : String
		},
		cb : ?Cookie->Void
	) : Void;
	
	static function getAll(
		details : {
			?url : String,
			?name : String,
			?domain : String,
			?path : String,
			?secure : String,
			?session : String,
			?storeId : String
		},
		cb : Array<Cookie>->Void
	) : Void;
	
	static function getAllCookieStores( cb : Array<CookieStore>->Void ) : Void;
	
	static function remove(
		details : {
			url : String,
			name : String,
			?storeId : String
		},
		?cb : String->String->String->Void
	) : Void;
	
	static function set(
		details : {
			url : String,
			?name : String,
			?value : String,
			?domain : String,
			?path : String,
			?secure : Bool,
			?httpOnly : Bool,
			?expirationDate : Float,
			?storeId : String
		},
		?cb : Cookie->Void
	) : Void;
	
	static var onChanged(default,null) : Event<CookieChangeInfo->Void>;
}
