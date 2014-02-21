package chrome.sockets;

import chrome.sockets.Tcp;

@:require(chrome)
@:native('chrome.sockets.tcpServer')
extern class TcpServer {
	static function create( ?properties : SocketProperties, f : {socketId:Int}->Void ) : Void;
	static function update( socketId : Int, properties : SocketProperties, ?f : Void->Void ) : Void;
	static function setPaused( socketId : Int, paused : Bool, ?f : Void->Void ) : Void;
	static function listen( socketId : Int, address : String, port : Int, ?backlog : Int, ?f : Int->Void ) : Void;
	static function disconnect( socketId : Int, ?f : Void->Void ) : Void;
	static function close( socketId : Int, ?f : Void->Void ) : Void;
	static function getInfo( socketId : Int, f : SocketInfo->Void ) : Void;
	static function getSockets( f : Array<SocketInfo>->Void ) : Void;
	static var onAccept(default,null) : Event<{socketId:Int,clientSocketId:Int}->Void>;
	static var onAcceptError(default,null) : Event<{socketId:Int,resultCode:Int}->Void>;
}
