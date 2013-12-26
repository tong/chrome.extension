package chrome;

@:require(chrome)
@:native("chrome.browserAction")
extern class BrowserAction {
	
	static function setTitle( details : { title : String, ?tabId : Int } ) : Void;
	static function getTitle( details : { ?tabId : Int  }, cb : String->Void ) : Void;
	static function setIcon( details : { ?imageData : Dynamic, ?path : String, ?tabId : Int }, ?cb : Void->Void ) : Void; // ?imageData : ImageData
	static function setPopup( details : { ?tabId : Int, popup : String } ) : Void;
	static function getPopup( details : { ?tabId : Int  }, cb : String->Void ) : Void;
	static function setBadgeText( details : { text : String, ?tabId : Int } ) : Void;
	static function getBadgeText( details : { ?tabId : Int  }, cb : String->Void ) : Void;
	static function setBadgeBackgroundColor( details : { color : Array<Int>, ?tabId : Int } ) : Void;
	static function getBadgeBackgroundColor( details : { ?tabId : Int  }, cb : Array<Int>->Void ) : Void;
	static function enable( ?tabId : Int ) : Void;
	static function disable( ?tabId : Int ) : Void;
	
	static var onClicked(default,null) : Event<Tab->Void>;
}
