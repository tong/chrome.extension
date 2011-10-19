package chrome.experimental;

@:native("chrome.experimental.savePage") extern class SavePage {
	static function saveAsMHTML( tabId : Int, cb : Blob->Void ) : Void;
}
