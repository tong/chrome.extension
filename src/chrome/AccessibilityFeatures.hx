package chrome;

import chrome.Types;

@:require(chrome)
@:native("chrome.accessibilityFeatures")
extern class AcessibilityFeatures {
	static var spokenFeedback(default,never) : ChromeSetting;
	static var largeCursor(default,never) : ChromeSetting;
	static var stickyKeys(default,never) : ChromeSetting;
	static var highContrast(default,never) : ChromeSetting;
	static var screenMagnifier(default,never) : ChromeSetting;
	static var autoclick(default,never) : ChromeSetting;
	static var virtualKeyboard(default,never) : ChromeSetting;
	static var caretHighlight(default,never) : ChromeSetting;
	static var cursorHighlight(default,never) : ChromeSetting;
	static var focusHighlight(default,never) : ChromeSetting;
	static var selectToSpeak(default,never) : ChromeSetting;
	static var switchAccess(default,never) : ChromeSetting;
	static var animationPolicy(default,never) : ChromeSetting;
}
