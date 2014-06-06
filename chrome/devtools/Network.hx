package chrome.devtools;

private typedef Request = {
	function getContent( f : String->String->Void ) : Void;	
}

@:require(chrome_ext)
@:native("chrome.devtools.network")
extern class Network {
	static function getHAR( f : Dynamic->Void ) : Void;
	static var onRequestFinished(default,null) : Event<Request->Void>;
	static var onNavigated(default,null) : Event<String->Void>;
}
