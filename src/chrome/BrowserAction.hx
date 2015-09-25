package chrome;

import js.html.ImageData;
import chrome.Events;
import chrome.Tabs;

typedef ColorArray = Array<Int>;

@:require(chrome_ext)
@:native("chrome.browserAction")
extern class BrowserAction {
	static function setTitle( details : { title : String, ?tabId : Int } ) : Void;
	static function getTitle( details : { ?tabId : Int  }, callback : String->Void ) : Void;
	static function setIcon( details : { ?imageData : ImageData, ?path : Dynamic, ?tabId : Int }, ?callback : Void->Void ) : Void;
	static function setPopup( details : { ?tabId : Int, popup : String } ) : Void;
	static function getPopup( details : { ?tabId : Int  }, callback : String->Void ) : Void;
	static function setBadgeText( details : { text : String, ?tabId : Int } ) : Void;
	static function getBadgeText( details : { ?tabId : Int  }, callback : String->Void ) : Void;
	static function setBadgeBackgroundColor( details : { color : ColorArray, ?tabId : Int } ) : Void;
	static function getBadgeBackgroundColor( details : { ?tabId : Int  }, callback : ColorArray->Void ) : Void;
	static function enable( ?tabId : Int ) : Void;
	static function disable( ?tabId : Int ) : Void;
	static var onClicked(default,null) : Event<Tab->Void>;
}
