package chrome.sockets;

import js.html.ArrayBuffer;

private typedef SocketProperties = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
}

private typedef SocketInfo = {
	var socketId : Int;
	var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
	var paused : Bool;
	@:optional var localAddress : String;
	@:optional var localPort : Int;
}

@:require(chrome)
@:native('chrome.sockets.udp')
extern class Udp {
	static function create( ?properties : SocketProperties, f : {socketId:Int}->Void ) : Void;
	static function update( socketId : Int, properties : SocketProperties, ?f : Void->Void ) : Void;
	static function setPaused( socketId : Int, paused : Bool, ?f : Void->Void ) : Void;
	static function bind( socketId : Int, address : String, port : Int, f : Int->Void ) : Void;
	static function send( socketId : Int, data : ArrayBuffer, address : String, port : Int, f : {resultCode:Int,?bytesSent:Int}->Void ) : Void;
	static function close( socketId : Int, ?f : Void->Void ) : Void;
	static function getInfo( socketId : Int, f : SocketInfo->Void ) : Void;
	static function getSockets( f : Array<SocketInfo>->Void ) : Void;
	static function joinGroup( socketId : Int, address : String, f : Int->Void ) : Void;
	static function leaveGroup( socketId : Int, address : String, f : Int->Void ) : Void;
	static function setMulticastTimeToLive( socketId : Int, ttl : Int, f : Int->Void ) : Void;
	static function setMulticastLoopbackMode( socketId : Int, enabled : Bool, f : Int->Void ) : Void;
	static function getJoinedGroups( socketId : Int, f : Array<String>->Void ) : Void;
	static var onReceive(default,null) : Event<{socketId:Int,data:ArrayBuffer,remoteAddress:String,remotePort:Int}->Void>;
	static var onReceiveError(default,null) : Event<{socketId:Int,resultCode:Int}->Void>;
}
