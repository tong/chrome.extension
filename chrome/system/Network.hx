package chrome.system;

typedef NetworkInterface = {
	var name : String;
	var address : String;
	var prefixLength : Int;
}

@:require(chrome)
@:native('chrome.system.network')
extern class Network {
	static function getNetworkInterfaces( f : Array<NetworkInterface>->Void ) : Void;
}
