package chrome;

import chrome.Events;

@:enum abstract OS(String) from String to String {
	var win = "win";
	var mac = "mac";
	var linux = "linux";
	var chrome_os = "chrome_os";
	var android = "android";
	var ios = "ios";
	var unknown = "unknown";
}

@:enum abstract SignedInDeviceType(String) from String to String {
	var desktop_or_laptop = "desktop_or_laptop";
	var phone = "phone";
	var tablet = "tablet";
	var unknown = "unknown";
}

typedef DeviceInfo = {
    var name : String;
    var id : String;
    var os : OS;
    var type : SignedInDeviceType;
    var chromeVersion : String;
}

@:require(chrome)
@:require(chrome_dev)
@:native("chrome.signedInDevices")
extern class SignedInDevices {
    static function get( ?isLocal : Bool, callback : Array<DeviceInfo>->Void ) : Void;
    static var onDeviceInfoChange(default,never) : Event<Array<DeviceInfo>->Void>;
}
