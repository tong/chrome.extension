package chrome;

import js.html.Blob;

/**
 * http://code.google.com/chrome/extensions/pageCapture.html
 */
@:native("chrome.pageCapture") extern class PageCapture {
	static function saveAsMHTML( details : { tabId : Int, }, cb : Blob->Void ) : Void;
}
