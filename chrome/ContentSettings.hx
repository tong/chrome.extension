package chrome;

/**
	http://code.google.com/chrome/extensions/contentSettings.html
*/
@:native("chrome.contentSettings") extern class ContentSettings {
	static var cookies(default,never) : ContentSetting;
	static var images(default,never) : ContentSetting;
	static var javascript(default,never) : ContentSetting;
	static var plugins(default,never) : ContentSetting;
	static var popups(default,never) : ContentSetting;
	static var notifications(default,never) : ContentSetting;
}
