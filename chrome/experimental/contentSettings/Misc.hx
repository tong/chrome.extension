package chrome.experimental.contentSettings;

@:native("chrome.experimental.contentSettings.misc") extern class Misc {
	static var blockThirdPartyCookies : chrome.Preference;
	static var enableReferrers : chrome.Preference;
	static var enableHyperlinkAuditing : chrome.Preference;
}
