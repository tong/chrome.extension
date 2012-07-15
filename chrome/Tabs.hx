package chrome;

@:fakeEnum(String) enum CaptureFormat {
	jpeg;
	png;
}

@:fakeEnum(String) enum QueryStatus {
	loading;
	complete;
}

private typedef RemoveInfo = {
	isWindowClosing : Bool
}

private typedef UpdateInfo = {
	?status : String,
	?url : String,
	?pinned : Bool
}

@:fakeEnum(String) enum RunAt {
	document_start;
	document_end;
	document_idle;
}

/**
 * http://code.google.com/chrome/extensions/tabs.html
 */
@:native("chrome.tabs") extern class Tabs {
	
	static function captureVisibleTab(
		?windowId : Int,
		?options : {
			?format : CaptureFormat,
			?quality : Int
		},
		cb : String->Void
	) : Void;
	
	static function connect(
		tabId : Int,
		?connectInfo : { ?name : String }
	) : Port;
	
	static function create(
		createProperties : {
			?windowId : Int,
			?index : Int,
			?url : String,
			?active : Bool,
			?pinned : Bool,
			?openerTabId : Int
		},
		?cb : Tab->Void
	) : Void;
	
	static function detectLanguage( ?tabId : Int, cb : String->Void ) : Void; 
	
	static function executeScript(
		?tabId : Int,
		details : {
			?code : String,
			?file : String,
			?allFrames : String,
			?runAt : RunAt
		},
		?cb : Void->Void
	) : Void;
	
	static function get( tabId : Int, cb : Tab->Void ) : Void;
	
	static function getSelected( cb : Tab->Void ) : Void;
	
	static function getCurrent( cb : Tab->Void ) : Void;
	
	@:overload( function(
		highlightInfo : { windowId : Int, tabs : Int },
		cb : Window->Void
	) : Void {} )
	static function highlight(
		highlightInfo : { windowId : Int, tabs : Array<Int> },
		cb : Window->Void
	) : Void;
	
	static function insertCSS(
		?tabId : Int,
		details : {
			?code : String,
			?file : String,
			?allFrames : Bool,
			?runAt : RunAt
		},
		?cb : Void->Void
	) : Void;
	
	@:overload( function(
		tabId : Array<Int>,
		moveProperties : {
			?windowId : Int,
			index : Int
		},
		?cb : Tab->Void
	) : Void {} )
	static function move(
		tabId : Int,
		moveProperties : {
			?windowId : Int,
			index : Int
		},
		?cb : Tab->Void
	) : Void;

	static function query(
		queryInfo : {
			?active : Bool,
			?pinned : Bool,
			?highlighted : Bool,
			?currentWindow : Bool,
			?lastFocusedWindow : Bool,
			?status : QueryStatus,
			?title : String,
			?url : String,
			?windowId : Int,
			?windowType : WindowType,
			?index : Int
		},
		cb : Array<Tab>->Void
	) : Void;

	static function reload(
		?tabId : Int,
		?properties : { ?bypassCache : Bool	 },
		?cb : Void->Void
	) : Void;
	
	@:overload( function(
		tabIds : Array<Int>,
		?cb : Void->Void
	) : Void {} )
	static function remove(
		tabIds : Int,
		?cb : Void->Void
	) : Void;
	
	static function sendRequest( tabId : Int, request : Dynamic, ?responseCallback : Dynamic->Void ) : Void;

	static function update(
		?tabId : Int,
		updateProperties : {
			?url : String,
			?active : Bool,
			?highlighted : Bool,
			?pinned : Bool,
			?openerTabId : Int,
		},
		?cb : Tab->Void
	) : Void;

	static var onAttached(default,null) : Event<Int->(Int->Int)->Void>;
	static var onCreated(default,null) : Event<Tab->Void>;
	static var onDetached(default,null) : Event<Int->(Int->Int)->Void>;
	static var onHighlighted(default,null) : Event<(Int->Array<Int>)->Void>;
	static var onMoved(default,null) : Event<Int->(Int->Int->Int)->Void>;
	static var onRemoved(default,null) : Event<Int->RemoveInfo->Void>;
	static var onUpdated(default,null) : Event<Int->UpdateInfo->Tab->Void>;
}
