package chrome;

import js.html.ImageData;
import chrome.Events;
import chrome.Tabs;

@:require(chrome_ext)
@:native("chrome.pageAction")
extern class PageAction {
	static function show( tabId : Int ) : Void;
	static function hide( tabId : Int ) : Void;
	static function setTitle( details : { tabId : Int, title : String } ) : Void;
	static function getTitle( details : { tabId : Int }, callback : String->Void ) : Void;
	static function setIcon( details : { tabId : Int, ?imageData : ImageData, ?path : Dynamic, ?iconIndex : Int }, ?callback : Void->Void ) : Void;
	static function setPopup( details : { tabId : Int, popup : String } ) : Void;
	static function getPopup( details : { tabId : Int }, callback : String->Void ) : Void;
	static var onClicked(default,never) : Event<Tab->Void>;
}
