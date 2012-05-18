package chrome.experimental;

typedef HttpHeaderObject = {
	name : String,
	?value : String,
	?binaryValue : Array<Int>
}

@:fakeEnum(String) enum DownloadMethod {
	GET;
	POST;
}

typedef DownloadOptions = {
	url : String,
	?filename : String,
	?saveAs : Bool,
	?method : DownloadMethod,
	?headers : Array<HttpHeaderObject>,
	?body : String
}

//TODO where is this used ?
@:fakeEnum(String) enum DownloadDangerType {
	safe;
	file;
	url;
	content;
	uncommon;
}

@:native("chrome.experimental.downloads") extern class Downloads {
	
	static var DANGER_UNCOMMON(default,null) : String;
	static var ERROR_GENERIC(default,null) : String;
	static var ERROR_INVALID_URL(default,null) : String;
	
	static function download( options : DownloadOptions, ?cb : Int->Void ) : Void;
}
