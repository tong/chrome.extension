package chrome;

@:fakeEnum(String) private enum Level {
	system;
	display;
}

@:require(chrome)
@:native("chrome.power")
extern class Power {

	/** Requests that power management be temporarily disabled */
	static function requestKeepAwake( level : Level ) : Void;

	/** Releases a request previously made via requestKeepAwake() */
	static function releaseKeepAwake() : Void;
}
