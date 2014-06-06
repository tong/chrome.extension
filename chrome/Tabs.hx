package chrome;

import chrome.types.ImageDetails;

@:enum abstract QueryStatus(String) {
	var loading = "loading";
	var complete = "complete";
}

/*
@:enum abstract WindowType(String) {
	var normal = "normal";
	var popup = "popup";
	var panel = "panel";
	var app = "app";
}
*/

@:enum abstract RunAt(String) {
	var document_start = "document_start";
	var document_end = "document_end";
	var document_idle = "document_idle";
}

typedef InjectDetails = {
	@:optional var code : String;
	@:optional var file : String;
	@:optional var allFrames : Bool;
	@:optional var matchAboutBlank : Bool;
	@:optional var runAt : Bool;
}

typedef UpdateInfo = {
	@:optional var status : String;
	@:optional var url : String;
	@:optional var pinned : String;
	@:optional var favIconUrl : String;
}

typedef MoveInfo = {
	@:optional var windowId : Int;
	@:optional var fromIndex : Int;
	@:optional var toIndex : Int;
}

typedef ActiveInfo = {
	@:optional var tabId : Int;
	@:optional var windowId : Int;
}

@:require(chrome_ext)
@:native("chrome.tabs")
extern class Tabs {
	static function get( tabId : Int, f : Tab->Void ) : Void;
	static function getCurrent( f : Tab->Void ) : Void;
	static function connect( tabId : Int, connectInfo : {?name:String} ) : chrome.Port;
	static function sendMessage( tabId : Int, message : Dynamic, f : Dynamic->Void ) : Void;
	static function create( createProperties : {?windowId:Int,?index:Int,?url:String,?active:Bool,?pinned:Bool,openerTabId:Int}, f : Tab->Void ) : Void;
	static function duplicate( tabId : Int, f : Tab->Void ) : Void;
	static function query( queryInfo : {?active:Bool,?pinned:Bool,?highlighted:Bool,?currentWindow:Bool,?status:QueryStatus,?title:String,?url:String,?windowId:Int,windowType:WindowType,?index:Int}, f : Array<Tab>->Void ) : Void;
	static function highlight( highlightInfo : {?windowId:Int,tabs:Array<Int>}, f : Window->Void ) : Void;
	static function update( ?tabId : Int, updateProperties : {?url:String,?active:Bool,?highlighted:Bool,?pinned:Bool,?openerTabId:Int}, ?f : Tab->Void ) : Void;
	static function move( ?tabId : Int, moveProperties : {?windowId:Int,?index:Int}, ?f : Tab->Void ) : Void;
	static function reload( ?tabId : Int, reloadProperties : {?bypassCache:Bool}, ?f : Void->Void ) : Void;
	static function remove( ?tabId : Int, ?f : Void->Void ) : Void;
	static function detectLanguage( ?tabId : Int, f : String->Void ) : Void;
	static function captureVisibleTab( ?windowId : Int, options : ImageDetails, f : String->Void ) : Void;
	static function executeScript( ?tabId : Int, details : InjectDetails, ?f : Array<Dynamic>->Void ) : Void;
	static function insertCSS( ?tabId : Int, details : InjectDetails, ?f : Void->Void ) : Void;
	static var onCreated(default,null) : Event<Tab->Void>;
	static var onUpdated(default,null) : Event<Int->UpdateInfo->Tab->Void>;
	static var onMoved(default,null) : Event<Int->(Int->MoveInfo->Int)->Void>;
	static var onActivated(default,null) : Event<ActiveInfo->Void>;
	static var onHighlightChanged(default,null) : Event<(Int->Array<Int>)->Void>;
	static var onHighlighted(default,null) : Event<(Int->Array<Int>)->Void>;
	static var onDetached(default,null) : Event<Int->(Int->Int)->Void>;
	static var onAttached(default,null) : Event<Int->(Int->Int)->Void>;
	static var onRemoved(default,null) :  Event<Int->(Int->Bool)->Void>;
	static var onReplaced(default,null) :  Event<Int->Int->Void>;
}
