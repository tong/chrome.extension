package chrome.experimental;

private typedef OpenOptions = {
	var bitrate : Int;
}

private typedef OpenInfo = {
	var connectionId : Int;
}

private typedef ReadInfo = {
	var bytesRead : Int;
	var data : ArrayBuffer;
}

private typedef WriteInfo = {
	var bytesWritten : Int;
}

private typedef ControlSignalOptions = {
	?cts : Bool,
	?dcd : Bool,
	?dtr : Bool,
	?rts : Bool
}

@:native("chrome.experimental.serial") extern class Serial {
	static function close( connectionId : Int, cb : Bool->Void ) : Void;
	static function flush( connectionId : Int, cb : Bool->Void ) : Void;
	static function getControlSignals( connectionId : Int, cb : Bool->Void ) : Void;
	static function getPorts( cb : Array<String>->Void ) : Void;
	static function open( port : String, ?options : OpenOptions, cb : OpenInfo->Void ) : Void;
	static function read( connectionId : Int, cb : ReadInfo->Void ) : Void;
	static function setControlSignals( connectionId : Int, options : ControlSignalOptions, cb : Bool->Void ) : Void;
	static function write( connectionId : Int, data : ArrayBuffer, cb : WriteInfo->Void ) : Void;
}
