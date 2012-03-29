package chrome.devtools;

@:native("chrome.input.pageCapture") extern class PageCapture {
	static function saveAsMHTML( details : Dynamic, cb : Blob->Void ) : Void;
}
