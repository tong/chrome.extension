package chrome.experimental;

typedef SocketSendInfo = {
	var bytesWritten : Int;
}

typedef SocketEvent = {
	var type : Int;
	var byteCount : Int;
	var bytes : Blob;
	var errorCode : Int;
	var errorMessage : String;
}

typedef SocketInfo = {
	var socketId : Int;
}

@:native("chrome.experimental.socket") extern class Socket {
	static function create( type : String, host : String, port : Int, options : Dynamic, cb : SocketInfo->Void ) : Void;
	static function connect( socketId : Int, cb : Dynamic->Void ) : Void;
	//static function connect( socketId : Int, hostname : String, port : Int, cb : Bool->Void ) : Void;
	static function disconnect( socketId : Int, cb : Bool->Void ) : Void;
	static function write( socketId : Int, data : String, cb : SocketSendInfo->Void ) : Void;
}
