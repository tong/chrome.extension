package chrome.devtools;

import chrome.Events;

typedef Request = {
	function getContent( callback : String->String->Void ) : Void;
}

@:require(chrome_ext)
@:native("chrome.devtools.network")
extern class Network {
	static function getHAR( callback : Dynamic->Void ) : Void;
	static var onRequestFinished(default,never) : Event<Request->Void>;
	static var onNavigated(default,never) : Event<String->Void>;
}
