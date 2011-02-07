package chrome.experimental;

@:native("chrome.experimental.infobars") extern class Infobars {
	static function show( details : Dynamic, cb : Window->Void ) : Void;
}
