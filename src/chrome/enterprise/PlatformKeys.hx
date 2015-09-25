package chrome.enterprise;

import js.html.ArrayBuffer;
import js.html.SubtleCrypto;

typedef Token = {
    var id : String;
    var subtleCrypto : SubtleCrypto;
}

@:require(chrome)
@:native("chrome.platformKeys")
extern class PlatformKeys {
    static function getTokens( callback : Array<Token>->Void ) : Void;
    static function getCertificates( tokenId : String, callback : Array<ArrayBuffer>->Void ) : Void;
    static function importCertificate( tokenId : String, certificate : ArrayBuffer, ?callback : Void->Void ) : Void;
    static function removeCertificate( tokenId : String, certificate : ArrayBuffer, ?callback : Void->Void ) : Void;
}
