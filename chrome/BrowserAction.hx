package chrome;

/**
	http://code.google.com/chrome/extensions/browserAction.html
*/
@:native("chrome.browserAction") extern class BrowserAction {
	
	static function getBadgeBackgroundColor( details : { ?tabId : Int  }, cb : Array<Int>->Void ) : Void;
	static function getBadgeText( details : { ?tabId : Int  }, cb : String->Void ) : Void;
	static function getPopup( details : { ?tabId : Int  }, cb : String->Void ) : Void;
	static function getTitle( details : { ?tabId : Int  }, cb : String->Void ) : Void;
	
	static function setBadgeBackgroundColor( details : { color : Array<Int>, ?tabId : Int } ) : Void;
	static function setBadgeText( details : { text : String, ?tabId : Int } ) : Void;
	static function setIcon( details : { ?imageData : Dynamic, ?path : String, ?tabId : Int } ) : Void; // ?imageData : ImageData
	static function setPopup( details : { ?tabId : Int, popup : String } ) : Void;
	static function setTitle( details : { title : String, ?tabId : Int } ) : Void;
	
	static var onClicked(default,null) : Event<Tab->Void>;
}
