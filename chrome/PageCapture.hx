package chrome.devtools;

/**
 * http://code.google.com/chrome/extensions/pageCapture.html
 */
@:native("chrome.input.pageCapture") extern class PageCapture {
	static function saveAsMHTML( details : { tabId : Int, }, cb : Blob->Void ) : Void;
}
