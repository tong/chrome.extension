package chrome.experimental.devtools;

@:fakeEnum(String)
enum Severity{
	Tip;
	Debug;
	Log;
	Warning;
	Error;
}

typedef ConsoleMessage = {
	var severity : Severity;
	var text : String;
	@:optional var url : String;
	@:optional var line : Float;
}

@:native("chrome.experimental.devtools.console")
extern class Console {
	static function addMessage( severity : Severity, text : String ) : Void;
	static function getMessages( f : Array<ConsoleMessage> ) : Void;
	static var onMessageAdded : chrome.Event<ConsoleMessage>;
}
