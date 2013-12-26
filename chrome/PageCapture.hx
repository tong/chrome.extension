package chrome;

import js.html.Blob;

@:require(chrome_ext)
@:native("chrome.pageCapture")
extern class PageCapture {
	static function saveAsMHTML( details : { tabId : Int, }, cb : Blob->Void ) : Void;
}
