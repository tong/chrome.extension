package chrome;

private typedef CreateProperties = {
	@:optional var windowId : Int;
	@:optional var index : Int;
	@:optional var url : String;
	@:optional var active : Bool;
	@:optional var pinned : Bool;
	@:optional var openerTabId : Int;
}

@:fakeEnum(String)
private enum QueryStatus {
	loading;
	complete;
}

private typedef QueryInfo = {
	@:optional var active : Bool;
	@:optional var pinned : Bool;
	@:optional var highlighted : Bool;
	@:optional var currentWindow : Bool;
	@:optional var lastFocusedWindow : Bool;
	@:optional var status : QueryStatus;
	@:optional var title : String;
	@:optional var url : String;
	@:optional var windowId : Int;
	@:optional var windowType : WindowType;
	@:optional var index : Int;
}

private typedef HighlightInfo = {
	@:optional var windowId : Int;
	var tabs : Array<Tab>;
}

private typedef UpdateProperties = {
	@:optional var url : String;
	@:optional var active : Bool;
	@:optional var highlighted : Bool;
	@:optional var pinned : Bool;
	@:optional var openerTabId : Int;
}

private typedef MoveProperties = {
	@:optional var windowId : Int;
	var index : Int;
}

@:fakeEnum(String)
private enum RunAt {
	document_start;
	document_end;
	document_idle;
}

@:fakeEnum(String)
private enum ImageFormat {
	jpeg;
	png;
}

private typedef CaptureVisibleTabOptions = {
	@:optional var format : ImageFormat;
	@:optional var quality : Int;
}


private typedef InjectDetails = {
	@:optional var code : String;
	@:optional var file : String;
	@:optional var allFrames : Bool;
	@:optional var runAt : RunAt;
}

private typedef UpdateInfo = {
	@:optional var status : String;
	@:optional var url : String;
	@:optional var pinned : Bool;
	@:optional var favIconUrl : String;
}

private typedef ActivatedInfo = {
	var tabId : Int;
	var windowId : Int;
}

@:native("chrome.tabs")
extern class Tabs {
	static function get( tabId : Int, f : Tab->Void ) : Void;
	static function getCurrent( f : Tab->Void ) : Void;
	static function connect( tabId : Int, ?connectInfo : {?name:String} ) : Void;
	static function sendMessage( tabId : Int, message : Dynamic, ?f : Dynamic->Void ) : Void;
	static function create( properties : CreateProperties, ?f : Tab->Void ) : Void;
	static function duplicate( tabId : Int, ?f : Tab->Void ) : Void;
	static function query( info : QueryInfo, ?f : Array<Tab>->Void ) : Void;
	static function highlight( info : HighlightInfo, f : Window->Void ) : Void;
	@:overload(function(properties:UpdateProperties,?f:Tab->Void):Void{})
	static function update( tabId : Int, properties : UpdateProperties, ?f : Tab->Void ) : Void;
	@:overload(function(tabIds:Int,properties:MoveProperties,?f:Tab->Void):Void{})
	static function move( tabIds : Array<Int>, properties : MoveProperties, ?f : Tab->Void ) : Void;
	static function reload( ?tabId : Int, ?reloadProperties : {bypassCache:Bool}, ?f : Void->Void ) : Void;
	@:overload(function(tabIds:Array<Int>,?f:Void->Void):Void{})
	static function remove( tabId : Int, ?f : Void->Void ) : Void;
	@:overload(function(f:String->Void):Void{})
	static function detectLanguage( ?tabId : Int, f : String->Void ) : Void;
	@:overload(function(?options:CaptureVisibleTabOptions,f:String->Void):Void{})
	@:overload(function(f:String->Void):Void{})
	static function captureVisibleTab( windowId : Int, options : CaptureVisibleTabOptions, f : String->Void ) : Void;
	@:overload(function(details:InjectDetails,?f:Array<Dynamic>->Void):Void{})
	static function executeScript( tabId : Int, details : InjectDetails, ?f : Array<Dynamic>->Void ) : Void;
	@:overload(function(details:InjectDetails,?f:Array<Dynamic>->Void):Void{})
	static function insertCSS( tabId : Int, details : InjectDetails, ?f : Void->Void ) : Void;
	static var onCreated(default,null) : Event<Tab->Void>;
	static var onUpdated(default,null) : Event<Int->UpdateInfo->Tab->Void>;
	static var onMoved(default,null) : Event<Int->(Int->Int->Int)->Void>;
	static var onActivated(default,null) : Event<ActivatedInfo->Void>;
	static var onHighlighted(default,null) : Event<(Int->Array<Int>)->Void>;
	static var onDetached(default,null) : Event<Int->(Int->Int)->Void>;
	static var onAttached(default,null) : Event<Int->(Int->Int)->Void>;
	static var onRemoved(default,null) :  Event<Int->(Int->Bool)->Void>; // Event<Int->RemoveInfo->Void>;
	static var onReplaced(default,null) :  Event<Int->Int->Void>;
}
