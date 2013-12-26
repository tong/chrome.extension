package chrome.experimental.devtools;

@:require(chrome_ext)
@:require(chrome_experimental)
@:fakeEnum(String)
enum Severity{
	Tip;
	Debug;
	Log;
	Warning;
	Error;
}
