package chrome.networking;

import chrome.Events;

typedef NetworkInfo = {
    var type : String; //enum Type; //TODO is missing in documentation
    @:optional var GUID : String;
    @:optional var HexSSID : String;
    @:optional var SSID : String;
    @:optional var BSSID : String;
    @:optional var Security : String;
}

@:enum abstract Result(String) from String to String {
	var unhandled = "unhandled";
	var succeeded = "succeeded";
	var rejected = "rejected";
	var failed = "failed";
}

@:require(chrome)
@:native("chrome.networking.Config")
extern class Config {
    static function setNetworkFilter( networks : Array<NetworkInfo>, callback : Void->Void ) : Void;
    static function finishAuthentication( GUID : String, result : Result, ?callback : Void->Void ) : Void;
    static var onCaptivePortalDetected(default,null) : Event<NetworkInfo->Void>;
}
