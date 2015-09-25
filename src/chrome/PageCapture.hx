package chrome;

@:require(chrome_ext)
@:native("chrome.pageCapture")
extern class PageCapture {
	static function saveAsMHTML( details : {tabId:Int}, f : js.html.Blob->Void ) : Void;
}
