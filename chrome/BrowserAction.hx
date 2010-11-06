package chrome;

@:native("chrome.browserAction") extern class BrowserAction {
	static function setBadgeBackgroundColor( details : Dynamic ) : Void;
	static function setBadgeText( details : Dynamic ) : Void;
	static function setIcon( details : Dynamic ) : Void;
	static function setPopup( details : Dynamic ) : Void;
	static function setTitle( details : Dynamic ) : Void;
	static var onClicked(default,null) : Event<Tab->Void>;
}
