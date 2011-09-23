package chrome.experimental.devtools;

@:native("chrome.experimental.devtools.resources") extern class Resources {
	static function getHAR( cb : Dynamic->Void ) : Void; // HAR specs: http://www.softwareishard.com/blog/har-12-spec/
	static var onFinished(default,null) : chrome.Event<Resource->Void>;
	static var onNavigation(default,null) : chrome.Event<String->Void>;
	
	
}
