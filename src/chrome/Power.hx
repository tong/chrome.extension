package chrome;

@:enum abstract Level(String) from String to String {
	var system = "system";
	var display = "display";
}

@:require(chrome)
@:native("chrome.power")
extern class Power {
	static function requestKeepAwake( level : Level ) : Void;
	static function releaseKeepAwake() : Void;
}
