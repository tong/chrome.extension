package chrome.devtools;

private typedef Request = {
	function getContent( f : String->String->Void ) : Void;	
}

@:require(chrome_ext)
@:native("chrome.devtools.network")
extern class Network {
	// HAR specs: http://www.softwareishard.com/blog/har-12-spec/
	static function getHAR( f : Dynamic->Void ) : Void;
	static var onNavigated(default,null) : Event<String->Void>;
	static var onRequestFinished(default,null) : Event<Request->Void>;
}
