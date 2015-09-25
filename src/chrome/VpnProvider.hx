package chrome;

import js.html.ArrayBuffer;
import chrome.Events;

@:enum abstract ConnectionState(String) from String to String {
    var connected = "connected";
    var failure = "failure";
}

@:require(chrome_os)
@:native("chrome.vpnProvider")
extern class VpnProvider {
    static function createConfig( name : String, callback : String->Void ) : Void;
    static function destroyConfig( id : String, ?callback : Void->Void ) : Void;
    static function setParameters( parameters : {address:String,?broadcastAddress:String,?mtu:String,exclusionList:Array<String>,inclusionList:Array<String>,?domainSearch:Array<String>,dnsServers:Array<String>}, callback : Void->Void ) : Void;
    static function sendPacket( data : ArrayBuffer, ?callback : Void->Void ) : Void;
    static function notifyConnectionStateChanged( state : ConnectionState, ?callback : Void->Void ) : Void;
    static var onPlatformMessage(default,null) : Event<String->String->String->Void>;
    static var onPacketReceived(default,null) : Event<ArrayBuffer->Void>;
    static var onConfigRemoved(default,null) : Event<String->Void>;
    static var onConfigCreated(default,null) : Event<String->String->Dynamic->Void>;
    static var onUIEvent(default,null) : Event<String->?String->Void>;
}
