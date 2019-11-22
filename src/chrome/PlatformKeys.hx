package chrome;

#if (haxe_ver < 4)
import js.html.ArrayBuffer;
#else
import js.lib.ArrayBuffer;
#end

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
	static function getAll(
		details : {
			request : {
				certificateTypes : CertificateTypes,
				certificateAuthorities : Array<ArrayBuffer>
			},
			?clientCerts : Array<ArrayBuffer>,
			interactive : Bool
		},
		callback : Array<Match>->Void ) : Void;
	static function getKeyPair( certificate : ArrayBuffer, parameters : Dynamic, callback : Dynamic->?Dynamic->Void ) : Void;
	static function subtleCrypto() : js.html.SubtleCrypto;
	static function verifyTLSServerCertificate(
		details : {
			serverCertificateChain : Array<ArrayBuffer>,
			hostname : String
		},
		callback : { trusted : Bool, debug_errors : Array<String> }->Void ) : Void;
}
