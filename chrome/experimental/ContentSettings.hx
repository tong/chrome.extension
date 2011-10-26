package chrome.experimental;

typedef ContentSetting = {
	function clear( details : Dynamic, ?cb : Void->Void ) : Void;
	function get( details : Dynamic, ?cb : Dynamic->Void ) : Void;
	function getResourceIdentifiers( cb : Void->Void ) : Void;
	function set( details : Dynamic, ?cb : Void->Void ) : Void;
}

@:native("chrome.experimental.contentSettings") extern class ContentSettings {
	static var cookies : ContentSetting;
	static var images : ContentSetting;
	static var javascript : ContentSetting;
	static var plugins : ContentSetting;
	static var popups : ContentSetting;
	static var notifications : ContentSetting;
}
