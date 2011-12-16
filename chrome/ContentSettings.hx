package chrome;

@:native("chrome.contentSettings") extern class ContentSettings {
	static var cookies : ContentSetting;
	static var images : ContentSetting;
	static var javascript : ContentSetting;
	static var plugins : ContentSetting;
	static var popups : ContentSetting;
	static var notifications : ContentSetting;
}
