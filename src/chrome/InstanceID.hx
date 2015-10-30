package chrome;

import chrome.Events;

//@chrome_permissions(["gcm"])
@:require(chrome)
@:native("chrome.instanceID")
extern class InstanceID {
    static function getID( callback : String->Void ) : Void;
    static function getCreationTime( callback : Float->Void ) : Void;
    static function getToken( getTokenParams : {authorizedEntity:String,scope:String,?options:Dynamic}, callback : String->Void ) : Void;
    static function deleteToken( deleteTokenParams : {authorizedEntity:String,scope:String}, callback : Void->Void ) : Void;
    static function deleteID( callback : Void->Void ) : Void;
    static var onTokenRefresh(default,never) : Event<Void->Void>;
}
