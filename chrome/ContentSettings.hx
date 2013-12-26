package chrome;

@:require(chrome_ext)
@:native("chrome.contentSettings")
extern class ContentSettings {
	static var cookies(default,never) : ContentSetting;
	static var images(default,never) : ContentSetting;
	static var javascript(default,never) : ContentSetting;
	static var plugins(default,never) : ContentSetting;
	static var popups(default,never) : ContentSetting;
	static var notifications(default,never) : ContentSetting;
}
