package chrome;

//TODO full types

@:fakeEnum(String)
private enum DangerType {
	file;
	url;
	content;
	uncommon;
	host;
	safe;
}

@:fakeEnum(String)
private enum State {
	in_progress;
	interrupted;
	complete;
}

@:native("chrome.downloads") extern class Downloads {
	static function download( options : Dynamic, ?f : Int->Void ) : Void;
	static function search( query : Dynamic, f : Array<Dynamic>->Void ) : Void;
	static function pause( downloadId : Int, ?f : Void->Void ) : Void;
	static function resume( downloadId : Int, ?f : Void->Void ) : Void;
	static function cancel( downloadId : Int, ?f : Void->Void ) : Void;
	static function getFileIcon( downloadId : Int, ?options : Dynamic, f : String->Void ) : Void;
	static function open( downloadId : Int ) : Void;
	static function show( downloadId : Int ) : Void;
	static function erase( query : Dynamic, ?f : Array<Int>->Void ) : Void;
	static function acceptDanger( downloadId : Int ) : Void;
	static function drag( downloadId : Int ) : Void;
	static var onCreated : Event<Dynamic->Void>;
	static var onErased : Event<Int->Void>;
	static var onChanged : Event<Dynamic->Void>;
}
