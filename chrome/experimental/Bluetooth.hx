package chrome.experimental;

private typedef ConnectOptions = {
	var deviceAddress : String;
	var serviceUuid : String;
}

private typedef Socket = {
	var device : Device;
	var id : Int;
	var serviceUuid : String;
}

private typedef DisconnectOptions = {
	var socketId : Int;
}

private typedef GetDevicesOptions = {
	?name : String,
	uuid : String
}

private typedef Device = {
	var address : String;
	var bonded : Bool;
	var connected : Bool;
	var name : String;
	var paired : Bool;
}

private typedef OutOfBandPairingData = {
	var hash : ArrayBuffer;
	var randomizer : ArrayBuffer;
}

private typedef GetServicesOptions = {
	var deviceAddress : String;
}

private typedef ServiceRecord = {
	name : String,
	?uuid : String
}

private typedef ReadOptions = {
	var socketId : Int;
}

private typedef SetOutOfBandPairingDataOptions = {
	address : String,
	?data : OutOfBandPairingData
}

private typedef StartDiscoveryOptions = {
	var deviceCallback : Device->Int;
}

@:native("chrome.experimental.bluetooth") extern class Bluetooth {
	static function connect( options : ConnectOptions, cb : Socket->Void ) : Void;
	static function disconnect( options : DisconnectOptions, ?cb : Void->Void ) : Void;
	static function getAddress( cb : String->Void ) : Void;
	static function getDevices( options : GetDevicesOptions, cb : Array<Device>->Void ) : Void;
	static function getLocalOutOfBandPairingData( cb : OutOfBandPairingData->Void ) : Void;
	static function getServices( options : GetServicesOptions, cb : Array<ServiceRecord>->Void ) : Void;
	static function isAvailable( cb : Bool->Void ) : Void;
	static function isPowered( cb : Bool->Void ) : Void;
	static function read( options : ReadOptions, cb : ArrayBuffer->Void ) : Void;
	static function setOutOfBandPairingData( options : SetOutOfBandPairingDataOptions, ?cb : Void->Void ) : Void;
	static function startDiscovery( options : StartDiscoveryOptions, ?cb : Void->Void ) : Void;
}
