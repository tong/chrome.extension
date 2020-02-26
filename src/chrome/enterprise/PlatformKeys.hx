package chrome.enterprise;

import js.html.SubtleCrypto;
import js.lib.ArrayBuffer;

typedef Token = {
    var id : String;
    var subtleCrypto : SubtleCrypto;
}

@:require(chrome)
@:native("chrome.enterprise.platformKeys")
extern class PlatformKeys {
    static function getTokens( callback : Array<Token>->Void ) : Void;
    static function getCertificates( tokenId : String, callback : Array<ArrayBuffer>->Void ) : Void;
    static function importCertificate( tokenId : String, certificate : ArrayBuffer, ?callback : Void->Void ) : Void;
    static function removeCertificate( tokenId : String, certificate : ArrayBuffer, ?callback : Void->Void ) : Void;
    static function challengeMachineKey( challenge : ArrayBuffer, ?registerKey : Bool, ?callback : ArrayBuffer->Void ) : Void;
    static function challengeUserKey( challenge : ArrayBuffer, registerKey : Bool, callback : ArrayBuffer->Void ) : Void;
}
