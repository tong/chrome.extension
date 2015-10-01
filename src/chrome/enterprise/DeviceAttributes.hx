package chrome.enterprise;

@:require(chrome)
@:require(chrome_dev)
@:native("chrome.enterprise.deviceAttributes")
extern class DeviceAttributes {
    static function getDirectoryDeviceId( callback : String->Void ) : Void;
}
