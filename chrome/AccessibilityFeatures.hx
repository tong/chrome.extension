package chrome;

@:native("chrome.accessibilityFeatures")
extern class AcessibilityFeatures {
	static var spokenFeedback : ChromeSetting;
	static var largeCursor : ChromeSetting;
	static var stickyKeys : ChromeSetting;
	static var highContrast : ChromeSetting;
	static var screenMagnifier : ChromeSetting;
	static var autoclick : ChromeSetting;
	static var virtualKeyboard : ChromeSetting;
}
