package chrome.experimental;

@:native("chrome.experimental.clipboard") extern class Clipboard {
	static function executeCopy( tabId : Int, cb : Void->Void ) : Void;
	static function executeCut( tabId : Int, cb : Void->Void ) : Void;
	static function executePaste( tabId : Int, cb : Void->Void ) : Void;
}
