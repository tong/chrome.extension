package chrome;

@:native("chrome.pageAction") extern class PageAction {
	static function hide( tabId : Int ) : Void;
	static function setIcon( details : Dynamic ) : Void;
	static function setPopup( details : Dynamic ) : Void;
	static function setTitle( details : Dynamic ) : Void;
	static function show( tabId : Int ) : Void;
	static var onClicked(default,null) : Event<Tab->Void>;
}
