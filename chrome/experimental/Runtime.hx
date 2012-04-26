package chrome.experimental;

@:native("chrome.experimental.runtime") extern class Runtime {
	
	static function getBackgroundPage( cb : Dynamic->Void ) : Void;
	
	static var onBackgroundPageUnloadingSoon : Event<Void->Void>;
	static var onInstalled : Event<Void->Void>;
}
