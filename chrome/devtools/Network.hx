package chrome.devtools;

private typedef Request = {
	function getContent( cb : String->String->Void ) : Void;	
}

@:native("chrome.devtools.network") extern class Network {
	static function getHAR( cb : Dynamic->Void ) : Void; // HAR specs: http://www.softwareishard.com/blog/har-12-spec/
	static var onNavigated(default,null) : Event<String->Void>;
	static var onRequestFinished(default,null) : Event<Request->Void>;
}
