package chrome;

@:fakeEnum(String) enum OS {
	win;
	mac;
	linux;
	chrome_os;
	android;
	ios;
	unknow;
}

typedef DeviceInfo = {
	var name : String;
	var id : String;
	var os : String;
	var type : String;
	var chromeVersion : String;
}

@:require(chrome_experimental)
@:native("chrome.signedInDevices")
extern class SignedInDevices {
	static function get( ?isLocal : Bool, f : Array<DeviceInfo>->Void ) : Void;
	static var onDeviceInfoChange(default,null) : Event<Array<DeviceInfo>->Void>;
}