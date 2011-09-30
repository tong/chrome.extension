package chrome;

@:native("chrome.tabs") extern class Tabs {
	static function captureVisibleTab( windowId : Int, options : Dynamic, cb : String->Void ) : Void;
	static function connect( tabId : Int, ?connectInfo : Dynamic ) : Port;
	static function create( createProperties : Dynamic, ?cb : Tab->Void ) : Void;
	static function detectLanguage( tabId : Int, cb : String->Void ) : Void; 
	static function executeScript( tabId : Int, details : Dynamic, ?cb : Void->Void ) : Void;
	static function get( tabId : Int, cb : Tab->Void ) : Void;
	static function getAllInWindow( ?windowId : Int, cb : Array<Tab>->Void ) : Void;
	static function getCurrent( cb : Tab->Void ) : Void;
	static function getSelected( windowId : Int, cb : Tab->Void  ) : Void;
	static function insertCSS( ?tabId : Int, details : Dynamic, ?cb : Void->Void ) : Void;
	static function move( tabId : Int, moveProperties : Dynamic, ?cb : Tab->Void ) : Void;
	static function remove( tabId : Int, ?cb : Void->Void ) : Void;
	static function sendRequest( tabId : Int, any : Dynamic, responseCallback : Dynamic->Void ) : Void;
	static function update( tabId : Int, updateProperties : Dynamic, ?cb : Tab->Void ) : Void;
	static var onAttached(default,null) : Event<Int->Dynamic->Void>;
	static var onCreated(default,null) : Event<Tab->Void>;
	static var onDetached(default,null) : Event<Int->Dynamic->Void>;
	static var onMoved(default,null) : Event<Int->Dynamic->Void>;
	static var onRemoved(default,null) : Event<Int->Dynamic->Void>;
	static var onSelectionChanged(default,null) : Event<Int->Dynamic->Void>;
	static var onUpdated(default,null) : Event<Int->Dynamic->Tab->Void>;
}
