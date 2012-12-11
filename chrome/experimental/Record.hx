package chrome.experimental;

typedef SessionDetails = {
	?extensionPath : String
}

typedef ReplayURLsResult = {
	var runTime : Int;
	var stats : String;
	var errors : Array<String>;
}

@:native("chrome.experimental.Record") extern class Record {
	static function captureURLs( urls : Array<String>, cacheDirectoryPath : String, ?cb : Array<String>->Void ) : Void;
	static function replayURLs( urls : Array<String>, cacheDirectoryPath : String, repeatCount : Int, ?details : SessionDetails, ?cb : ReplayURLsResult->Void ) : Void;
}
