package chrome;

private typedef ImageDataType = Dynamic; //TODO

@:require(chrome_ext)
@:native("chrome.pageAction")
extern class PageAction {
	static function show( tabId : Int ) : Void;
	static function hide( tabId : Int ) : Void;
	static function setTitle( details : { tabId : Int, title : String } ) : Void;
	static function getTitle( details : { tabId : Int }, f : String->Void ) : Void;
	static function setIcon( details : { tabId : Int, ?imageData : ImageDataType, ?path : Dynamic, ?iconIndex : Int }, ?f : Void->Void ) : Void;
	static function setPopup( details : { tabId : Int, popup : String } ) : Void;
	static function getPopup( details : { tabId : Int }, f : String->Void ) : Void;
	static var onClicked(default,null) : Event<Tab->Void>;
}
