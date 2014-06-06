package chrome;

@:enum abstract FilenameConflictAction(String) {
	var uniquify = "uniquify";
	var overwrite = "overwrite";
	var prompt = "prompt";
}

@:enum abstract InterruptReason(String) {
	var FILE_FAILED = "FILE_FAILED";
	var FILE_ACCESS_DENIED = "FILE_ACCESS_DENIED";
	var FILE_NO_SPACE = "FILE_NO_SPACE";
	var FILE_NAME_TOO_LONG = "FILE_NAME_TOO_LONG";
	var FILE_TOO_LARGE = "FILE_TOO_LARGE";
	var FILE_VIRUS_INFECTED = "FILE_VIRUS_INFECTED";
	var FILE_TRANSIENT_ERROR = "FILE_TRANSIENT_ERROR";
	var FILE_BLOCKED = "FILE_BLOCKED";
	var FILE_SECURITY_CHECK_FAILED = "FILE_SECURITY_CHECK_FAILED";
	var FILE_TOO_SHORT = "FILE_TOO_SHORT";
	var NETWORK_FAILED = "NETWORK_FAILED";
	var NETWORK_TIMEOUT = "NETWORK_TIMEOUT";
	var NETWORK_DISCONNECTED = "NETWORK_DISCONNECTED";
	var NETWORK_SERVER_DOWN = "NETWORK_SERVER_DOWN";
	var NETWORK_INVALID_REQUEST = "NETWORK_INVALID_REQUEST";
	var SERVER_FAILED = "SERVER_FAILED";
	var SERVER_NO_RANGE = "SERVER_NO_RANGE";
	var SERVER_PRECONDITION = "SERVER_PRECONDITION";
	var SERVER_BAD_CONTENT = "SERVER_BAD_CONTENT";
	var USER_CANCELED = "USER_CANCELED";
	var USER_SHUTDOWN = "USER_SHUTDOWN";
	var CRASH = "CRASH";
}

@:enum abstract Method(String) {
	var GET = "GET";
	var POST = "POST";
}

@:enum abstract DangerType(String) {
	var file = "file";
	var url = "url";
	var content = "content";
	var uncommon = "uncommon";
	var host = "host";
	var unwanted = "unwanted";
	var safe = "safe";
	var accepted = "accepted";
}

@:enum abstract State(String) {
	var in_progress = "in_progress";
	var interrupted = "interrupted";
	var complete = "complete";
}

typedef DownloadItem = {
	var id : String;
	var url : String;
	var referrer : String;
	var filename : String;
	var incognito : Bool;
	var danger : DangerType;
	var mime : String;
	var startTime : String;
	@:optional var endTime : String;
	@:optional var estimatedEndTime : String;
	var state : State;
	var paused : Bool;
	var canResume : Bool;
	@:optional var error : InterruptReason;
	var bytesReceived : Float;
	var totalBytes : Float;
	var fileSize : Float;
	var exists : Int;
	@:optional var byExtensionId : String;
	@:optional var byExtensionName : String;
}

typedef DownloadQuery = {
	@:optional var query : Array<String>;
	@:optional var startedBefore : String;
	@:optional var startedAfter : String;
	@:optional var endedBefore : String;
	@:optional var endedAfter : String;
	@:optional var totalBytesGreater : Float;
	@:optional var totalBytesLess : Float;
	@:optional var filenameRegex : String;
	@:optional var urlRegex : String;
	@:optional var limit : Int;
	@:optional var orderBy : Array<String>;
	@:optional var id : Int;
	@:optional var url : String;
	@:optional var filename : String;
	@:optional var danger : DangerType;
	@:optional var mime : String;
	@:optional var startTime : String;
	@:optional var endTime : String;
	@:optional var state : State;
	@:optional var paused : Bool;
	@:optional var error : InterruptReason;
	@:optional var totalBytes : Float;
	@:optional var fileSize : Float;
	@:optional var exists : Bool;
}

typedef StringDelta = {
	@:optional var previous : String;
	@:optional var current : String;
}

typedef BooleanDelta = {
	@:optional var previous : Bool;
	@:optional var current : Bool;
}

typedef DoubleDelta = {
	@:optional var previous : Float;
	@:optional var current : Float;
}

typedef DownloadDelta = {
	var id : Int;
	@:optional var url : StringDelta;
	@:optional var filename : StringDelta;
	@:optional var danger : StringDelta;
	@:optional var mime : StringDelta;
	@:optional var startTime : StringDelta;
	@:optional var endTime : StringDelta;
	@:optional var state : StringDelta;
	@:optional var canResume : BooleanDelta;
	@:optional var paused : BooleanDelta;
	@:optional var error : StringDelta;
	@:optional var totalBytes : DoubleDelta;
	@:optional var fileSize : DoubleDelta;
	@:optional var exists : BooleanDelta;
}

@:require(chrome_ext)
@:native("chrome.downloads")
extern class Downloads {
	static function download( options : {url:String,?filename:String,?conflictAction:FilenameConflictAction,?saveAs:Bool,?method:Method,?headers:Array<Dynamic>,?body:String}, ?f : Int->Void ) : Void;
	static function search( query : DownloadQuery, f : Array<DownloadItem>->Void ) : Void;
	static function pause( downloadId : Int, ?f : Void->Void ) : Void;
	static function resume( downloadId : Int, ?f : Void->Void ) : Void;
	static function cancel( downloadId : Int, ?f : Void->Void ) : Void;
	static function getFileIcon( downloadId : Int, options : {downloadId:Int,?options:Dynamic}, ?f : String->Void ) : Void;
	static function open( downloadId : Int ) : Void;
	static function show( downloadId : Int ) : Void;
	static function showDefaultFolder() : Void;
	static function erase( query : DownloadQuery, ?f : Array<Int> ) : Void;
	static function removeFile( downloadId : Int, ?f : Void->Void ) : Void;
	static function acceptDanger( downloadId : Int, ?f : Void->Void ) : Void;
	static function drag( downloadId : Int ) : Void;
	static function setShelfEnabled( enabled : Bool ) : Void;
	static var onCreated(default,null) : Event<DownloadItem->Void>;
	static var onErased(default,null) : Event<Int->Void>;
	static var onChanged(default,null) : Event<DownloadDelta->Void>;
	static var onDeterminingFilename(default,null) : Event<DownloadItem->(Void->Void)->Void>;
}
