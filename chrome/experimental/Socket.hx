package chrome.experimental;

@:fakeEnum(String) enum SocketType {
	tcp;
	udp;
}

typedef CreateInfo = {
	var socketId : Int;
}

typedef ReadInfo = {
	var data : ArrayBuffer;
	var resultCode : Int;
}

typedef WriteInfo = {
	var bytesWritten : Int;
}

typedef RecvFromInfo = {
	var address : String;
	var data : ArrayBuffer;
	var port : Int;
	var resultCode : Int;
}

@:native("chrome.experimental.socket") extern class Socket {
	static function bind( socketId : Int, address : String, port : Int, cb : Int->Void ) : Void;
	static function connect( socketId : Int, hostname : String, port : Int, cb : Dynamic->Void ) : Void;
	//TODO: static function create( type : SocketType, ?options : Dynamic, cb : CreateInfo->Void ) : Void;
	static function create( type : String, ?options : Dynamic, cb : CreateInfo->Void ) : Void;
	static function destroy( socketId : Int ) : Void;
	static function disconnect( socketId : Int ) : Void;
	static function read( socketId : Int, ?bufferSize : Int, cb : ReadInfo->Void ) : Void;
	static function recvFrom( socketId : Int, ?bufferSize : Int, cb : RecvFromInfo->Void ) : Void;
	static function sendTo( socketId : Int, data : ArrayBuffer, address : String, port : Int,  cb : WriteInfo->Void ) : Void;
	static function setKeepAlive( socketId : Int, enable : Bool, ?delay : Int,  cb : Bool->Void ) : Void;
	static function setNoDelay( socketId : Int, ?delay : Int,  cb : Bool->Void ) : Void;
	static function write( socketId : Int, data : ArrayBuffer,  cb : WriteInfo->Void ) : Void;
}
