package chrome.enterprise;

/**
    Note: This API is only for extensions pre-installed by policy.
*/
@:require(chrome)
@:require(chrome_ext)
@:require(chrome_os)
@:require(chrome_dev)
@:native("chrome.enterprise.deviceAttributes")
extern class DeviceAttributes {
    static function getDirectoryDeviceId( callback : String->Void ) : Void;
    static function getDeviceSerialNumber( callback : String->Void ) : Void;
    static function getDeviceAssetId( callback : String->Void ) : Void;
    static function getDeviceAnnotatedLocation( callback : String->Void ) : Void;
}
