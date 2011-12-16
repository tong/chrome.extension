package chrome;

typedef AttachInfo = {
	var newWindowId : Int;
	var newPosition : Int;
}

typedef DetachInfo = {
	var oldWindowId : Int;
	var oldPosition : Int;
}

typedef MoveInfo = {
	var windowId : Int;
	var fromIndex : Int;
	var toIndex : Int;
}

typedef RemoveInfo = {
	var isWindowClosing : Bool;
}

typedef SelectInfo = {
	var windowId : Int;
}

typedef ChangeInfo = {
	var status : String;
	var url : String;
	var pinned : Bool;
}

/* not working, why ?
@:fakeEnum(String) extern enum CaptureFormat {
	jpeg;
	png;
}
*/

typedef CaptureOptions = {
	var quality : Int;
	var format : String; // "png" or "jpeg"
	//var format : CaptureFormat;  //TODO
}

private typedef CreateProperties = {
	var windowId : Int; // optional
	var index : Int; // optional
	var url : String; // optional
	var selected : Bool; // optional
	var pinned : Bool; // optional
}

private typedef InserCSSDetails = {
	var code : String; // optional
	var file : Int; // optional
	var allFrames : String; // optional
}

private typedef MoveProperties = {
	var index : String;
	var windowId : Int; // optional
}

typedef QueryInfo = {
	var active : Bool; // optional
	var pinned : Bool; // optional
	var highlighted : Bool; // optional
	var status : String; // optional
	var title : String; // optional
	var url : String; // optional
	var windowId : String; // optional
	var windowType : String; // optional enumerated string ["normal", "popup", "panel", "app"]
}

typedef ReloadProperties = {
	var bypassCache : Bool; // optional
}

@:native("chrome.tabs") extern class Tabs {
	static function captureVisibleTab( windowId : Int, options : CaptureOptions, cb : String->Void ) : Void;
	static function connect( tabId : Int, ?connectInfo : { name : String } ) : Port;
	static function create( createProperties : CreateProperties, ?cb : Tab->Void ) : Void;
	static function detectLanguage( tabId : Int, cb : String->Void ) : Void; 
	static function executeScript( tabId : Int, details : CreateProperties, ?cb : Void->Void ) : Void;
	static function get( tabId : Int, cb : Tab->Void ) : Void;
	static function getAllInWindow( ?windowId : Int, cb : Array<Tab>->Void ) : Void;
	static function getCurrent( cb : Tab->Void ) : Void;
	static function getSelected( windowId : Int, cb : Tab->Void  ) : Void;
	static function insertCSS( ?tabId : Int, details : InserCSSDetails, ?cb : Void->Void ) : Void;
	static function move( tabId : Int, moveProperties : MoveProperties, ?cb : Tab->Void ) : Void;
	static function query( queryInfo : QueryInfo, cb : Array<Tab> ) : Void;
	static function reload( ?tabId : Int, properties : ReloadProperties, ?cb : Void->Void ) : Void;
	static function remove( tabId : Int, ?cb : Void->Void ) : Void;
	static function sendRequest( tabId : Int, any : Dynamic, responseCallback : Dynamic->Void ) : Void;
	static function update( tabId : Int, updateProperties : Dynamic, ?cb : Tab->Void ) : Void;
	static var onAttached(default,null) : Event<Int->AttachInfo->Void>;
	static var onCreated(default,null) : Event<Tab->Void>;
	static var onDetached(default,null) : Event<Int->DetachInfo->Void>;
	static var onMoved(default,null) : Event<Int->MoveInfo->Void>;
	static var onRemoved(default,null) : Event<Int->RemoveInfo->Void>;
	static var onSelectionChanged(default,null) : Event<Int->SelectInfo->Void>;
	static var onUpdated(default,null) : Event<Int->ChangeInfo->Tab->Void>;
}
