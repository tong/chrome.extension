package chrome.experimental;

@:native("chrome.experimental.keybinding") extern class Keybinding {
	static var onCommand : Event<String->Void>;
}
