package chrome.experimental.devtools;

@:native("chrome.experimental.devtools.resources") extern class Resources {
	static function getHAR( cb : Dynamic->Void ) : Void;
	static var onFinished(default,null) : chrome.Event<Resource->Void>;
	static var onNavigation(default,null) : chrome.Event<String->Void>;
	
	
}
