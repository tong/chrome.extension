package chrome;

import haxe.extern.EitherType;
import chrome.Runtime;
import chrome.Types;
import chrome.Windows;
import chrome.Events;
import chrome.ExtensionTypes;

@:enum abstract MutedInfoReason(String) from String to String {
	var user = "user";
	var capture = "capture";
	var extension = "extension";
}

typedef MutedInfo = {
	var muted : Bool;
	@:optional var reason : MutedInfoReason;
	@:optional var extensionId : String;
}

typedef Tab = {
	@:optional var id : Int;
	var index : Int;
	var windowId : Int;
	@:optional var openerTabId : Int;
	var highlighted : Bool;
	var active : Bool;
	var pinned : Bool;
	@:optional var audible : Bool;
	@:optional var discarded : Bool;
	@:optional var autoDiscardable : Bool;
	@:optional var mutedInfo : MutedInfo;
	@:optional var url : String;
	@:optional var title : String;
	@:optional var favIconUrl : String;
	@:optional var status : String;
	var incognito : Bool;
	@:optional var width : Int;
	@:optional var height : Int;
	@:optional var sessionId : String;
}

@:enum abstract ZoomSettingsMode(String) from String to String {
	var automatic = "automatic";
	var manual = "manual";
	var disabled = "disabled";
}

@:enum abstract ZoomSettingsScope(String) from String to String {
	var per_origin = "per-origin";
	var per_tab = "per-tab";
}

typedef ZoomSettings = {
	@:optional var mode : ZoomSettingsMode;
	@:optional var scope : ZoomSettingsScope;
	@:optional var defaultZoomFactor : Float;
}

@:enum abstract TabStatus(String) from String to String {
	var loading = "loading";
	var complete = "complete";
}

@:require(chrome_ext)
@:native("chrome.tabs")
extern class Tabs {
	static var TAB_ID_NONE(default,never) : Int;
	static function get( tabId : Int, callback : Tab->Void ) : Void;
	static function getCurrent( callback : Tab->Void ) : Void;
	static function connect( tabId : Int, connectInfo : {?name:String,?frameId:Int} ) : chrome.Port;
	static function sendMessage( tabId : Int, message : Dynamic, ?options : {?frameId:Int}, ?responseCallback : Dynamic->Void ) : Void;
	static function create(
		createProperties : {
			?windowId:Int,
			?index:Int,
			?url:String,
			?active:Bool,
			?pinned:Bool,
			?openerTabId:Int
		},
		callback : Tab->Void ) : Void;
	static function duplicate( tabId : Int, ?callback : Tab->Void ) : Void;
	static function query(
		queryInfo : {
			?active:Bool,
			?pinned:Bool,
			?audible:Bool,
			?muted:Bool,
			?highlighted:Bool,
			?discarded:Bool,
			?autoDiscardable:Bool,
			?currentWindow:Bool,
			?lastFocusedWindow:Bool,
			?currentWindow:Bool,
			?status:TabStatus,
			?title:String,
			?url:EitherType<String,Array<String>>,
			?windowId:Int,
			?windowType:WindowType,
			?index:Int
		},
		callback : Array<Tab>->Void ) : Void;
	static function highlight( highlightInfo : {?windowId:Int,tabs:Either<Array<Int>,insertCSS>}, ?callback : Window->Void ) : Void;
	static function update(
		?tabId : Int,
		updateProperties : {
			?url:String,
			?active:Bool,
			?highlighted:Bool,
			?pinned:Bool,
			?muted:Bool,
			?openerTabId:Int,
			?autoDiscardable:Int
		},
		?callback : Tab->Void ) : Void;
	@:overload(function( ?tabId : Array<Int>, moveProperties : {?windowId:Int,index:Int}, ?callback : Array<Tab>->Void ) : Void {})
	static function move( ?tabId : Int, moveProperties : {?windowId:Int,index:Int}, ?callback : Tab->Void ) : Void;
	static function reload( ?tabId : Int, reloadProperties : {?bypassCache:Bool}, ?callback : Void->Void ) : Void;
	@:overload(function( ?tabId : Array<Int>, ?callback : Void->Void ) : Void {})
	static function remove( ?tabId : Int, ?callback : Void->Void ) : Void;
	static function detectLanguage( ?tabId : Int, callback : String->Void ) : Void;
	static function captureVisibleTab( ?windowId : Int, ?options : {?format:ImageDetails,?auality:Int}, callback : String->Void ) : Void;
	static function executeScript(
		?tabId : Int,
		details : {
			?code:String,
			?file:String,
			?allFrames:Bool,
			?frameId:Int,
			?matchAboutBlank:Bool,
			?runAt:RunAt,
			?cssOrigin:CSSOrigin
		},
		?callback : Array<Dynamic>->Void ) : Void;
	static function insertCSS(
		?tabId : Int,
		details : {
			?code:String,
			?file:String,
			?allFrames:Bool,
			?frameId:Int,
			?matchAboutBlank:Bool,
			?runAt:RunAt,
			?cssOrigin:CSSOrigin
		},
		?callback : Void->Void ) : Void;
	static function setZoom( ?tabId : Int, zoomFactor : Float, ?callback : Void->Void ) : Void;
	static function getZoom( ?tabId : Int, callback : Float->Void ) : Void;
	static function setZoomSettings( ?tabId : Int, zoomSettings : ZoomSettings, ?callback : Void->Void ) : Void;
	static function getZoomSettings( ?tabId : Int, callback : ZoomSettings->Void ) : Void;
	static function discard( ?tabId : Int, ?callback : Tab->Void ) : Void;
	static function goForward( ?tabId : Int, ?callback : Void->Void ) : Void;
	static function goBack( ?tabId : Int, ?callback : Void->Void ) : Void;
	static var onCreated(default,never) : Event<Tab->Void>;
	static var onUpdated(default,never) : Event<Int->{?status:String,?url:String,?pinned:Bool,?audible:Bool,?discarded:Bool,?autoDiscardable:Bool,?mutedInfo:MutedInfo,?favIconUrl:String,?title:String}->Tab->Void>;
	static var onMoved(default,never) : Event<Int->{windowId:Int,fromIndex:Int,toIndex:Int}->Void>;
	static var onActivated(default,never) : Event<{tabId:Int,windowId:Int}->Void>;
	static var onHighlighted(default,never) : Event<{windowId:Int,tabIds:Array<Int>}->Void>;
	static var onDetached(default,never) : Event<{oldWindowId:Int,oldPosition:Int}->Void>;
	static var onAttached(default,never) : Event<{newWindowId:Int,newPosition:Int}->Void>;
	static var onRemoved(default,never) :  Event<Int->{windowId:Int,isWindowClosing:Bool}->Void>;
	static var onReplaced(default,never) :  Event<Int->Int->Void>;
	static var onZoomChange(default,never) :  Event<{tabId:Int,oldZoomFactor:Float,newZoomFactor:Float,zoomSettings:ZoomSettings}->Void>;
}
