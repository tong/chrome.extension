package chrome.experimental;

@:native("chrome.experimental.infobars") extern class Infobars {
	static function show( details : { tabId : Int, path : String }, ?cb : chrome.Window->Void ) : Void;
}
