package chrome;

import js.html.ArrayBuffer;

typedef Match = {
	var certificate : ArrayBuffer;
	var keyAlgorithm : Dynamic;
}

@:enum abstract CertificateTypes(String) from String to String {
	var rsaSign = "rsaSign";
	var ecdsaSign = "ecdsaSign";
}

@:require(chrome)
@:native("chrome.platformKeys")
extern class PlatformKeys {
	static function getAll( request : {certificateTypes:CertificateTypes,?certificateAuthorities:Array<ArrayBuffer>}, callback : Array<Match>->Void ) : Void;
	static function getKeyPair( certificate : ArrayBuffer, parameters : Dynamic, callback : Dynamic->?Dynamic->Void ) : Void;
	static function subtleCrypto() : js.html.SubtleCrypto;
	static function verifyTLSServerCertificate( details : { serverCertificateChain : Array<ArrayBuffer>, hostname : String }, callback : Bool->Array<String>->Void ) : Void;
}
